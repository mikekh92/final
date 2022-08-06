package com.kh.checkmate.reservation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmate.reservation.model.dao.ReservationDao;
import com.kh.checkmate.reservation.model.vo.Reservation;
@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDao reservationDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Reservation> selectMyReservation(Reservation r) {
		return reservationDao.selectMyReservation(sqlSession,r);
	}

	@Override
	public int insertReservation(Reservation r) {
		return reservationDao.insertReservation(sqlSession,r);
	}

	@Override
	public int deleteReservation(int[] ReservationNoDelete) {
		return reservationDao.deleteReservation(sqlSession,ReservationNoDelete);
	}

	@Override
	public ArrayList<Reservation> home() {
		return reservationDao.home(sqlSession);
	}

	@Override
	public ArrayList<Reservation> selectRoomSize(String roomCenterName) {
		return reservationDao.selectRoomSize(sqlSession,roomCenterName) ;
	}

	@Override
	public ArrayList<Reservation> selectRoomName(Reservation r) {
		return reservationDao.selectRoomName(sqlSession,r);
	}

	@Override
	public int selectRoomNo(Reservation r) {
		return reservationDao.selectRoomNo(sqlSession,r);
	}

	@Override
	public ArrayList<Reservation> selectReservationList(Reservation r) {
		return reservationDao.selectReservationList(sqlSession,r);
	}

	@Override
	public int selectListCount(Reservation r) {
		return reservationDao.selectListCount(sqlSession,r);
	}

}
