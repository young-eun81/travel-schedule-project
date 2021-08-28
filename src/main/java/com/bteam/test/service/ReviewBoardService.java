package com.bteam.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bteam.test.model.ReviewBoard;
//import com.cos.blog.model.RoleType;
import com.bteam.test.model.User;
import com.bteam.test.ReviewBoardRepository;
import com.bteam.test.UserRepository;

@Service
public class ReviewBoardService {
	
	@Autowired
	private ReviewBoardRepository boardRepository;
	
	@Transactional
	public void 글쓰기(ReviewBoard board, User user) { //title, content
		board.setCount(0);
		board.setUser(user);
		boardRepository.save(board);
	}
	
//	@Transactional(readOnly = true)
//	public Page<ReviewBoard> 글목록(Pageable pageable) {
//		return boardRepository.findAll(pageable);
//	}
	
	public List<ReviewBoard> reviewIndex() {
		
		return boardRepository.findAll();
	}
	
	@Transactional(readOnly = true)
	public ReviewBoard 글상세보기(int id) {
		return boardRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글  상세보기 실패 : 아이디를 찾을 수 없습니다.");
				});
	}
	
	@Transactional
	public void 글삭제하기(int id) {
		System.out.println("글삭제하기 : "+id);
		boardRepository.deleteById(id);
	}
	
	@Transactional
	public void 글수정하기(int id, ReviewBoard requestBoard) {
		ReviewBoard board = boardRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 찾기 실패 : 아이디를 찾을 수 없습니다.");
				}); 
		board.setTitle(requestBoard.getTitle());
		board.setContent(requestBoard.getContent());
		
	}
}
