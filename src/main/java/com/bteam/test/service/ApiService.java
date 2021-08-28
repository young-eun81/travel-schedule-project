package com.bteam.test.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bteam.test.model.ApiForm;
import com.bteam.test.model.TourData;



@Service
public class ApiService {
	
	@Autowired
	private ApiRepository apiRepo;

	//검색어 키워드로 찾기 로직
	public List<ApiForm> searchKeyword(String keyword) {
		
		List<TourData> api = apiRepo.findBytitleContainingOrInstructionContaining(keyword, keyword); 
		
		List<ApiForm> apiList = new ArrayList<>();
		
		if(api.isEmpty()) return apiList;
		
		for(TourData apiEntity: api) {
			apiList.add(this.convertEntityToForm(apiEntity));
		}
		
		return apiList;
	}
	
	// 컨텐츠 한 건 조회
	public ApiForm readContent(String keyword) {
		TourData result = apiRepo.findByTitle(keyword);
		ApiForm content = new ApiForm();
		content.setTitle(result.getTitle());
		content.setAddress(result.getAddress());
		content.setInstruction(result.getInstruction());
		content.setLatitude(result.getLatitude());
		content.setLongitude(result.getLongitude());
		content.setImgpath(result.getImgpath());
		
		return content;
	}
	
	private ApiForm convertEntityToForm(TourData api) {
		return ApiForm.builder()
				.title(api.getTitle())
				.address(api.getAddress())
				.instruction(api.getInstruction())
				.longitude(api.getLongitude())		
				.latitude(api.getLatitude())
				.imgpath(api.getImgpath())
				.thumbnailpath(api.getThumbnailpath())
				.build();
	}

}
