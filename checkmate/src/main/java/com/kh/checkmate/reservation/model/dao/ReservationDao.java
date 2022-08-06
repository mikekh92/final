package com.kh.checkmate.reservation.model.dao;



import java.sql.Date;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmate.reservation.model.vo.Reservation;

@Repository
public class ReservationDao {

	public ArrayList<Reservation> home(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("reservationMapper.home");
	}

	public ArrayList<Reservation> selectRoomSize(SqlSessionTemplate sqlSession, String roomCenterName) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectRoomSize",roomCenterName);
	}

	public ArrayList<Reservation> selectRoomName(SqlSessionTemplate sqlSession,Reservation r) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectRoomName",r);
	}

	public int insertReservation(SqlSessionTemplate sqlSession,Reservation r) {
		return sqlSession.insert("reservationMapper.insertReservation",r);
	}

	public int selectRoomNo(SqlSessionTemplate sqlSession, Reservation r) {
		return sqlSession.selectOne("reservationMapper.selectRoomNo",r);
	}

	public ArrayList<Reservation> selectReservationList(SqlSessionTemplate sqlSession, Reservation r) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectReservationList",r);
	}

	public ArrayList<Reservation> selectMyReservation(SqlSessionTemplate sqlSession, Reservation r) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectMyReservationList",r);
	}

	public int selectListCount(SqlSessionTemplate sqlSession, Reservation r) {
		return sqlSession.selectOne("reservationMapper.selectListCount",r);
	}

	public int deleteReservation(SqlSessionTemplate sqlSession, int[] reservationNoDelete) {
		
		int result =0;
		for(int i=0; i<reservationNoDelete.length; i++) {
			result += sqlSession.delete("reservationMapper.deleteReservation", reservationNoDelete[i]);			
		}		
		return result;
	}



	
}
