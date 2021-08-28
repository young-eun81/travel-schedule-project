package com.bteam.test.handler;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

@Component
public class AuthFailureHandler extends SimpleUrlAuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
		
		String msg = "회원 ID 또는 비밀번호가 일치하지 않습니다.";
		
		 if(exception instanceof BadCredentialsException){
			 
	     } else if(exception instanceof InsufficientAuthenticationException) {
	    	 msg = "Invalid Secret Key";
	     }
		 
		 // 한글 깨짐 현상 -> URL 인코딩
		 	msg = URLEncoder.encode(msg, "UTF-8");
	        setDefaultFailureUrl("/auth/loginForm?error=true&exception="+msg);

	        super.onAuthenticationFailure(request,response,exception);
	
	}
	
}
