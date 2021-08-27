package com.bteam.test.service;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.bteam.test.model.TourData;

	
	@Repository
	public interface ApiRepository extends JpaRepository<TourData, String> {

		//키워드로 제목과 설명 찾아서 검색
		List<TourData> findBytitleContainingOrInstructionContaining(String title, String instruction);

		//랜덤으로 이미지 가져오기
		@Query(value="SELECT * FROM tourdata ORDER BY RAND() LIMIT 6;", nativeQuery=true)
		public List<TourData> randomImage();
		
		TourData findByTitle(String title);

}
