package com.dto;

public class StadiumDTO {
	
	int stadiumNo;
	String stadiumName;
	String stadiumAddr;
	String stadiumTell;
	
	
	public StadiumDTO() {
		super();
	}
	
	public StadiumDTO(int stadiumNo, String stadiumName, String stadiumAddr,
			String stadiumtell) {
		super();
		this.stadiumNo = stadiumNo;
		this.stadiumName = stadiumName;
		this.stadiumAddr = stadiumAddr;
		this.stadiumTell = stadiumtell;
	}
	public int getStadiumNo() {
		return stadiumNo;
	}
	public void setStadiumNo(int stadiumNo) {
		this.stadiumNo = stadiumNo;
	}
	public String getStadiumName() {
		return stadiumName;
	}
	public void setStadiumName(String stadiumName) {
		this.stadiumName = stadiumName;
	}
	public String getStadiumAddr() {
		return stadiumAddr;
	}
	public void setStadiumAddr(String stadiumAddr) {
		this.stadiumAddr = stadiumAddr;
	}
	public String getStadiumTell() {
		return stadiumTell;
	}
	public void setStadiumTell(String stadiumtell) {
		this.stadiumTell = stadiumtell;
	}
	
	

}
