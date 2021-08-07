package com.bteam.test.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserDto {

	private String userid;
	
	private String password;
	
	private boolean admin=false;
	
	
}
