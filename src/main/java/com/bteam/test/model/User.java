package com.bteam.test.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity //User 클래스가 MySQL에 테이블 생성이 된다.
@Table(name="user")
@Data
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY) //프로젝트에서 연결된 DB의 넘버링 전략 따라가기
	private Long id; //auto_increment
	
	@Column(name="userId", nullable=false, length=50)
	private String username; //아이디
	
	@Column(name="userPassword", nullable=false, length=100) //후에 해쉬(비밀번호 암호화) 때문에 메모리 넉넉하게
	private String password; //비밀번호
	
	@Column(name="userName", nullable=false, length=50)
	private String name; //이름
	
	@Column(nullable=false, length=50)
	private String userEmail; //이메일
	
	//도메인 => 정해져있는 값(고정값), Enum으로 설정 가능
//	@ColumnDefault("'ROLE_USER'")
	//DB는 RoleType이라는 타입이 없다.
	@Enumerated(EnumType.STRING)
	private UserRole role; //Enum을 쓰는게 좋다. / ADMIN, USER
	
	private String kakaoId; //oauth 확인
	
	private String birth; //생일
}
