package com.bteam.test.model;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
public class ApiForm {
	
	private String title;
	private String address;
	private String instruction;
	private double latitude;
	private double longitude;
	private String imgpath;
	private String thumbnailpath;
	
	@Builder
	public ApiForm(String title, String address, String instruction, double latitude, double longitude, String imgpath,
			String thumbnailpath) {
		super();
		this.title = title;
		this.address = address;
		this.instruction = instruction;
		this.latitude = latitude;
		this.longitude = longitude;
		this.imgpath = imgpath;
		this.thumbnailpath = thumbnailpath;
	}

}
