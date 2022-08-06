package com.kh.checkmate.reservation.model.service;

import java.util.ArrayList;

import com.kh.checkmate.reservation.model.vo.Reservation;

public interface ReservationService {

	//스타디센터 조회
	ArrayList<Reservation> home();
	//방인원 조회
	ArrayList<Reservation> selectRoomSize(String roomCenterName);
	//방이름 조회
	ArrayList<Reservation> selectRoomName(Reservation r);
	//예약
	int insertReservation(Reservation r);
	//방번호 조회
	int selectRoomNo(Reservation r);
	//전체 조회
	ArrayList<Reservation> selectReservationList(Reservation r);	
	//유저 예약조회
	ArrayList<Reservation> selectMyReservation(Reservation r);
	//유저 예약갯수조회
	int selectListCount(Reservation r);
	//예약취소
	int deleteReservation(int[] reservationNoDelete);
}
