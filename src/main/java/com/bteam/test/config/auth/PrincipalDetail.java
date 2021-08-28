package com.bteam.test.config.auth;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;

import org.springframework.security.core.userdetails.UserDetails;

import com.bteam.test.model.User;

import lombok.Data;

//스프링 시큐리티가 로그인요청 가로챔 => 로그인 진행 및 완료 => UserDetails 타입의 오브젝트를
//스프링 시큐리티의 고유한 세션 저장소에 저장
@Data
public class PrincipalDetail implements UserDetails {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private User user;
	
	public PrincipalDetail(User user) {
		this.user = user;
	}

	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		return user.getUsername();
	}

	//계정 만료되지 않았는지 확인 (true: 만료 안됨)
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	//계정이 잠겨있지 않았는지 리턴 (true: 잠기지 않음)
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	//비밀번호 만료 확인 리턴 (true: 활성화)
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	//계정이 활성화인지 리턴 (true: 활성화)
	@Override
	public boolean isEnabled() {
		return true;
	}
	
	//계정이 갖고있는 권한 목록 리턴 (권한이 여러개면 루프를 사용하지만 지금은 USER 한개만)
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		Collection<GrantedAuthority> collectors = new ArrayList<>();
		collectors.add(()-> { 
			return "ROLE_" + user.getRole();
		});
		
		return collectors;
	}

}
