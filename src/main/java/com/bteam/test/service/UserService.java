package com.bteam.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bteam.test.UserRepository;
import com.bteam.test.model.User;
import com.bteam.test.model.UserRole;


import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

@Service
public class UserService {

	@Autowired
	private UserRepository repository;
	
	//회원찾기
	@Transactional(readOnly=true)
	public User findUser(String username) {
		
		User user = repository.findByusername(username).orElseGet(()-> {
			return new User();
		});
		
		return user;
	}

	//회원가입
	@Transactional
	public int signUp(User user) {
		
		String rawPassword = user.getPassword();
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		user.setPassword(passwordEncoder.encode(rawPassword)); //해쉬
		user.setRole(UserRole.USER);
		
		try {
		//password를 암호화 한 뒤에 db에 저장
		repository.save(user);
		return 1;
		} catch (Exception e) {
			return -1;
		}
	}
	
	@Transactional
	public String findByEmail(HttpServletResponse response, User user, String email) throws Exception {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//이메일로 찾은 아이디
		String findId = repository.findByUserEmail(email);
		
		System.out.println(findId);
		
		if(findId == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다. 이메일을 확인해주세요.')");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			
			return null;
			
		} else {
			
			return findId;
		}	
	}
	
	//비밀번호 찾기 로직
	@Transactional
	public List<String> findByIdAndEmail(HttpServletResponse response, User user ,String email, String username) throws Exception {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
	
		List<String> findPw = repository.findPasswordByIdEmail(username, email);
		
		if(findPw == null) {
			out.println("<script>");
			out.println("alert('가입한 아이디 또는 이메일을 확인해주세요.')");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			
			return null;
			
		} else {
			
			out.println("<script>");
			out.println("alert('임시 비밀번호가 발송되었습니다.')");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();

			return findPw;
		}
		
	}
	
	
	
}
