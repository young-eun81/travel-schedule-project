package com.bteam.test;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.bteam.test.model.User;

public interface UserRepository extends JpaRepository<User, Long>{

	Optional<User> findByusername(String username);
	
	//Email로 id 찾기
	@Query(value="SELECT userId FROM user WHERE userEmail= ?1", nativeQuery=true)
	String findByUserEmail(String email);
	
	@Query(value="SELECT userId, userEmail FROM user WHERE userId= ? AND userEmail= ?", nativeQuery=true)
	List<String> findPasswordByIdEmail(String username, String email);

}
