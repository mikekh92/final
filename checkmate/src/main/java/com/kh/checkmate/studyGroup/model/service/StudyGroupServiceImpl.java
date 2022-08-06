package com.kh.checkmate.studyGroup.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmate.common.model.vo.PageInfo;
import com.kh.checkmate.member.model.vo.Member;
import com.kh.checkmate.studyGroup.model.dao.StudyGroupDao;
import com.kh.checkmate.studyGroup.model.vo.StudyGroup;

@Service
public class StudyGroupServiceImpl implements StudyGroupService {

	@Autowired
	private StudyGroupDao studyGroupDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int nameCheck(String sgName) {
		return studyGroupDao.nameCheck(sqlSession, sgName);
	}

	@Override
	public int insertStudyGroup(StudyGroup sg) {
		return studyGroupDao.insertStudyGroup(sqlSession, sg);
	}

	// 구대영
	@Override
	public StudyGroup studyGroupDetail(int sgNo) {
		return studyGroupDao.studyGroupDetail(sqlSession, sgNo);
	}

	@Override
	public int selectListCount() {
		return studyGroupDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<StudyGroup> studyGroupList(PageInfo pi) {
		return studyGroupDao.studyGroupList(sqlSession, pi);
	}
	
	@Override
	public ArrayList<StudyGroup> oneStudyGroupList() {
		return studyGroupDao.oneStudyGroupList(sqlSession);
	}

	@Override
	public StudyGroup studyGroupNoSelect(StudyGroup sg) {
		return studyGroupDao.studyGroupNoSelect(sqlSession, sg);
	}

	@Override
	public int searchListCount(String searchContent) {
		return studyGroupDao.searchListCount(sqlSession, searchContent);
	}

	@Override
	public ArrayList<StudyGroup> sgSearchList(PageInfo pi, String searchContent) {
		return studyGroupDao.sgSearchList(sqlSession, pi, searchContent);
	}

	@Override
	public int max(int sgNo) {
		return studyGroupDao.max(sqlSession, sgNo);
	}

	@Override
	public int deleteStudyGroup(Map<String, Object> map) {
		return studyGroupDao.deleteStudyGroup(sqlSession, map);
	}

	@Override
	public int sgCurrent(int sgNo) {
		return studyGroupDao.sgCurrent(sqlSession, sgNo);
	}

	@Override
	public ArrayList<StudyGroup> myStudyGroupList(String userNick) {
		return studyGroupDao.myStudyGroupList(sqlSession,userNick);
	}

}
