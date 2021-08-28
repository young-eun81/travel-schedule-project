package com.bteam.test.model;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class UserDto {

	private Long id;
	private String username;
	private String password;
	private String name;
	private String userEmail;
	private String birth;
	private UserRole role;

	// User 객체로 전송
	public User toEntity() {
		return User.builder().id(id).username(username).password(password).userEmail(userEmail).birth(birth).role(role)
				.build();
	}

	@Builder
	public UserDto(Long id, String username, String password, String name, String userEmail, String birth,
			UserRole role) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.name = name;
		this.userEmail = userEmail;
		this.birth = birth;
		this.role = role;
	}

}
