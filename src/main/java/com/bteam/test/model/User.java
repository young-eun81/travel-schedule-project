package com.bteam.test.model;


import javax.persistence.*;



import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
@Entity
public class User {

	@GeneratedValue(strategy = GenerationType.AUTO)
	@Id
	private int Id;
	
	@Column(nullable = false)
	private String userid;
	
	@Column(nullable = false)
	private String password;
	
	@Column(nullable = false)
	@Enumerated(value = EnumType.STRING)
	private UserRole role;
	
	
	public User(UserDto userdto) {
		this.userid=userdto.getUserid();
		this.password=userdto.getPassword();
		
	}
	public User(String userid, String password, UserRole role) {
		this.userid=userid;
		this.password=password;
		this.role=role;
	}
	
}
