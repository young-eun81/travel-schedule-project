package com.bteam.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class UserController {

	
	//회원가입 페이지
	@GetMapping("/auth/joinForm")
	public String main() {
		return "user/joinForm";
	}
	
	
	//로그인 페이지
	@GetMapping("/auth/loginForm")
	public String login() {
		return "user/loginForm";
	}
	
}
