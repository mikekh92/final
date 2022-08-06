package com.kh.checkmate.location.model.vo;

import java.sql.Date;

public class Location {
	private int locationNo;
	private int userNo;
	private float locationLatitude;
	private float locationLongitude;
	private Date locationDate;
	public Location() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Location(int locationNo, int userNo, float locationLatitude, float locationLongitude, Date locationDate) {
		super();
		this.locationNo = locationNo;
		this.userNo = userNo;
		this.locationLatitude = locationLatitude;
		this.locationLongitude = locationLongitude;
		this.locationDate = locationDate;
	}
	public int getLocationNo() {
		return locationNo;
	}
	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public float getLocationLatitude() {
		return locationLatitude;
	}
	public void setLocationLatitude(float locationLatitude) {
		this.locationLatitude = locationLatitude;
	}
	public float getLocationLongitude() {
		return locationLongitude;
	}
	public void setLocationLongitude(float locationLongitude) {
		this.locationLongitude = locationLongitude;
	}
	public Date getLocationDate() {
		return locationDate;
	}
	public void setLocationDate(Date locationDate) {
		this.locationDate = locationDate;
	}
	@Override
	public String toString() {
		return "Location [locationNo=" + locationNo + ", userNo=" + userNo + ", locationLatitude=" + locationLatitude
				+ ", locationLongitude=" + locationLongitude + ", locationDate=" + locationDate + "]";
	}
	
	
	
}
