package com.bteam.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import com.bteam.test.model.KakaoProfile;
import com.bteam.test.model.OAuthToken;
import com.bteam.test.model.User;
import com.bteam.test.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
public class KakaoController {
	
	@Value("${cos.key}")
	private String cosKey;
	
	@Autowired
	AuthenticationManager auth;
	
	@Autowired
	UserService userService;
	
	@GetMapping("/auth/kakaologin")
	public String kakaoCode(String code) {//데이터를 리턴해주는 컨트롤러 메소드
		
		//POST 방식으로 key=value 데이터를 요청(카카오톡으로)
		RestTemplate rt = new RestTemplate();
		
		//Header 데이터
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		//Body 데이터
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "5cc502515c3774ea8102a09ba2ba1bcc");
		params.add("redirect_uri", "http://localhost:8111/auth/kakaologin");
		params.add("code", code);
		
		// Header 데이터와 Body 데이터를 가지게 된 Entity => 아래 매소드에 넣기 위해 HttpEntity 생성
		HttpEntity<MultiValueMap<String,String>> kakaoRequest = 
				new HttpEntity<>(params, headers);
		
		// Http 요청하기 - POST 방식 - 그리고 response 변수의 응답 받기
		ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,
				kakaoRequest,
				String.class
				);
		
		//Gson, Json Simple, ObjectMapper (라이브러리)
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken = null;
		
		try {
			
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		
		} catch (JsonMappingException e) {// 파싱할 때, 이름이 틀리면 오류 & getter, setter 오류
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		System.out.println("카카오 액세스 토큰 : " + oauthToken.getAccess_token());
	
		/**
		 * 사용자 정보 받기 시작
		 */
		RestTemplate rt2 = new RestTemplate();
		
		//Header 데이터
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		// Header 데이터와 Body 데이터를 가지게 된 Entity => 아래 매소드에 넣기 위해 HttpEntity 생성
		HttpEntity<MultiValueMap<String,String>> kakaoProfileRequest2 = 
				new HttpEntity<>(headers2);
		
		// Http 요청하기 - POST 방식 - 그리고 response 변수의 응답 받기
		ResponseEntity<String> response2 = rt2.exchange(
				"https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST,
				kakaoProfileRequest2,
				String.class
				);
		
		System.out.println(response2.getBody());
		
		//카카오 프로필
		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile kakaoProfile = null;
		
		try {
			
			kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
			
		} catch (JsonMappingException e) {// 파싱할 때, 이름이 틀리면 오류 & getter, setter 오류
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		//User 오브젝트 : Username, password, username, email, birth
		System.out.println("카카오 회원번호 : " + kakaoProfile.getId());
		System.out.println("카카오 이메일 : " + kakaoProfile.getKakao_account().getEmail());
		System.out.println("카카오 생일 : " + kakaoProfile.getKakao_account().getBirthday());
		
		System.out.println("블로그 서버 회원아이디 : " + kakaoProfile.getKakao_account().getEmail() + "_" + kakaoProfile.getId());
		System.out.println("블로그 서버 이메일 : " + kakaoProfile.getKakao_account().getEmail());
		//카카오 로그인 시 임시 비밀번호
		//UUID tempPassword = UUID.randomUUID(); => 중복되지 않는 어떤 특정한 값을 만들어내는 알고리즘
		System.out.println("블로그 서버 비밀번호 : " + cosKey);
		
		User kakaoUser = User.builder()
				.username(kakaoProfile.getKakao_account().getEmail() + "_" + kakaoProfile.getId())
				.password(cosKey)
				.name(kakaoProfile.getKakao_account().getProfile().getNickname())
				.userEmail(kakaoProfile.getKakao_account().getEmail())
				.kakaoId("kakao")
				.birth(kakaoProfile.getKakao_account().getBirthday())
				.build();
				
		// 가입자 혹은 비가입자 체크
		//가입자 확인(회원 찾기)
		// 가입자 혹은 비가입자 체크 해서 처리
		User originUser = userService.findUser(kakaoUser.getUsername());

		if(originUser.getUsername() == null) {
			System.out.println("기존 회원이 아닙니다. 자동 회원가입 및 로그인을 진행합니다");
			userService.signUp(kakaoUser);
		}
		
		// 로그인 처리
		Authentication authentication = auth.authenticate(new UsernamePasswordAuthenticationToken(kakaoUser.getUsername(), cosKey));
		SecurityContextHolder.getContext().setAuthentication(authentication);
				
		return "redirect:/"; //위의 @ResponseBody 삭제
	}

}
