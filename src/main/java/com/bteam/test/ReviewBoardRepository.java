package com.bteam.test;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.bteam.test.model.ReviewBoard;
import com.bteam.test.model.User;


public interface ReviewBoardRepository extends JpaRepository<ReviewBoard, Integer> {
	
	
}
