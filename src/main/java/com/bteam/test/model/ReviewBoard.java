package com.bteam.test.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name="reviewboard")
public class ReviewBoard {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // auto_increment
	private int id;
	
	@Column(nullable = false, length = 100)
	private String title;
	
	@Lob 
	private String content; 
	
	private int count; 
	
	@ManyToOne(fetch = FetchType.EAGER) 
	@JoinColumn(name="userId")
	private User user; 
	
	@OneToMany(mappedBy = "board", fetch = FetchType.EAGER)
	private List<ReviewReply> reply;
	
	@CreationTimestamp
	private Timestamp createDate;
}
