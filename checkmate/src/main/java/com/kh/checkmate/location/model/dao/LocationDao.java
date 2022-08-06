package com.kh.checkmate.location.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmate.location.model.vo.Location;

@Repository
public class LocationDao {

	public int insertCoordinate(SqlSessionTemplate sqlSession, Location l) {
		return sqlSession.insert("locationMapper.insertCoordinate",l);
	}

	public int selectListCount(SqlSessionTemplate sqlSession, Location l) {
		return sqlSession.selectOne("locationMapper.selectListCount",l);
	}
	public int updateCoordinate(SqlSessionTemplate sqlSession, Location l) {
		return sqlSession.update("locationMapper.updateCoordinate",l);
	}

	public ArrayList<Location> selectMapList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("locationMapper.selectMapList");
	}
}
