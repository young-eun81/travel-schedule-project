package com.bteam.test;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bteam.test.model.User;

public interface UserRepository extends JpaRepository<User, Long>{

	Optional<User> findByuserid(String userid);

}
