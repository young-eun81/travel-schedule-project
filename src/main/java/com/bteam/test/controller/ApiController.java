package com.bteam.test.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.bteam.test.model.ApiForm;
import com.bteam.test.model.TourData;
import com.bteam.test.service.ApiRepository;
import com.bteam.test.service.ApiService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ApiController {
	
	@Autowired
	private ApiService apiService;
	
	@Autowired
	private ApiRepository apiRepo;
	
	@GetMapping({"","/"})
	public String index(Model model) {
		
		List<TourData> randomIndex = apiRepo.randomImage();
		
		model.addAttribute("randomIndex", randomIndex);
		model.addAttribute("api", new TourData());
		
		return "index";
	}
	
	@GetMapping("/search")
	public String search(@RequestParam(value="keyword") String keyword, Model model) {
		
		List<ApiForm> apiList = apiService.searchKeyword(keyword);
		
		model.addAttribute("apiList", apiList);
		
		List<String> keywordList = new ArrayList<>();
		
		keywordList.add(keyword);
		
		model.addAttribute("keywordList", keywordList);
		
		return "search";
	}
	
	@GetMapping("/search/{title}")
	public String showContent(@PathVariable String title, Model model) {
		
		ApiForm content = apiService.readContent(title);
		
		model.addAttribute("content",content);
		
		log.info("title={}", title);
		
		return "detail";
	}

}
