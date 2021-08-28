package com.bteam.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bteam.test.InfoRepository;
import com.bteam.test.model.Infodto;
import com.bteam.test.model.TourData;



@Service
public class InfoService {
	
	@Autowired
	InfoRepository infoRepo;
	
	// 컨텐츠 한 건 조회
	public Infodto readContent(String keyword) {
		TourData result = infoRepo.findByTitle(keyword);
		Infodto content = new Infodto();
		content.setTitle(result.getTitle());
		content.setAddress(result.getAddress());
		content.setInstruction(result.getInstruction());
		content.setLatitude(result.getLatitude());
		content.setLongitude(result.getLongitude());
		content.setImgpath(result.getImgpath());
		
		return content;
	}
}
