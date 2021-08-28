package com.bteam.test.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="tourdata")
public class TourData {
	
	@Id
	private String title;
	
	@Column
	private String address;

	@Column
	private String instruction;

	@Column
	private double latitude;

	@Column
	private double longitude;

	@Column
	private String imgpath;

	@Column
	private String thumbnailpath;
}
