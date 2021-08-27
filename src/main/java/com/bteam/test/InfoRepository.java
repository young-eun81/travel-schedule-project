package com.bteam.test;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bteam.test.model.TourData;


public interface InfoRepository extends JpaRepository<TourData, String> {
	
	TourData findByTitle(String title);

}
