package com.kh.checkmate.location.model.service;

import java.util.ArrayList;

import com.kh.checkmate.location.model.vo.Location;

public interface LocationService {
	// 존재여부 확인
	int selectListCount(Location l);
	
	// 좌표 저장
	int insertCoordinate(Location l);

	// 좌표 업데이트
	int updateCoordinate(Location l);
	
	// 좌표 리스트 검색
	ArrayList<Location> selectMapList();
}
