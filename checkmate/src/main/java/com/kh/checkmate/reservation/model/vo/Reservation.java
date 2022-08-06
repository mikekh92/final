package com.kh.checkmate.reservation.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Reservation {

	private int reservationNo;
	private Date reservationDate;
	private int reservationUser;
	private int reservationStartTime;
	private int reservationUsedTime;
	private int roomNo;
	private String roomCenterName;
	private String roomName;
	private int roomSize;
	private int[] reservationNoDelete;	
}
