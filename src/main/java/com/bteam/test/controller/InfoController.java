package com.bteam.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.bteam.test.model.Infodto;
import com.bteam.test.service.InfoService;


@Controller
public class InfoController {

	
	@Autowired
	InfoService infoService;
	
	@GetMapping("/search/{title}")
	public String showContent(@PathVariable String title, Model model) {
		Infodto content = infoService.readContent(title);
		
		model.addAttribute("content",content);
		
		
		return "detailcopy";
	}
}
