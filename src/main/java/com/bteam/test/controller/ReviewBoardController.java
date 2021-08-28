package com.bteam.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.bteam.test.model.ReviewBoard;
import com.bteam.test.service.ReviewBoardService;

@Controller
public class ReviewBoardController {
	
	@Autowired
	private ReviewBoardService boardService;
	
	@GetMapping("/board")
	public String index(Model model, @PageableDefault(size=3, sort="id", direction = Sort.Direction.DESC) Pageable pageable) {
		//model.addAttribute("boards", boardService.글목록(pageable));
		
		model.addAttribute("boards", boardService.reviewIndex());
//		model.addAttribute("board", new ReviewBoard());	
		return "reviewindex"; 
	}
	@GetMapping("/board/{id}")
	public String findById(@PathVariable int id, Model model) {
		model.addAttribute("board", boardService.글상세보기(id));
		return "board/detail";
	}
	
	@GetMapping("/board/{id}/updateForm")
	public String updateForm(@PathVariable int id, Model model) {
		model.addAttribute("board", boardService.글상세보기(id));
		return "board/updateForm";
	}
	
	@GetMapping("/board/saveForm")
	public String saveForm() {
		return "reviewboard/reviewWrite";
	}
	
}
