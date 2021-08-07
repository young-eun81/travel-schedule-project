package com.bteam.test.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.bteam.test.UserRepository;
import com.bteam.test.model.User;
import com.bteam.test.model.UserDto;
import com.bteam.test.service.UserService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class UserMainController {

	private final UserRepository userRepository;
	private final UserService userService;

	@GetMapping("/user/info")
	public List<User> userinfo() {
		return userRepository.findAll();
	}

	// 회원가입 요청 처리
	@PostMapping("/user/join")
	public String userjoin(@RequestBody UserDto userdto) {
		userService.registerUser(userdto);
		return "redirect:/";

	}
}
