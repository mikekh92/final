package com.kh.checkmate.studyGroupApply.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmate.studyGroupApply.model.dao.StudyGroupApplyDao;
import com.kh.checkmate.studyGroupApply.model.vo.StudyGroupApply;

@Service
public class StudyGroupApplyImpl implements StudyGroupApplyService {

	@Autowired
	private StudyGroupApplyDao studyGroupApplyDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertStudyGroupApply(StudyGroupApply studyGroupApply) {
		return studyGroupApplyDao.insertStudyGroupApply(sqlSession, studyGroupApply);
	}

	@Override
	public ArrayList<StudyGroupApply> studyGroupApplyList(int sgNo) {
		return studyGroupApplyDao.studyGroupApplyList(sqlSession, sgNo);
	}

	@Override
	public int acceptStudyGroup(Map<String, Object> map) {
		return studyGroupApplyDao.acceptStudyGroup(sqlSession,map);
	}

	@Override
	public int rejectStudyGroup(Map<String, Object> map) {
		return studyGroupApplyDao.rejectStudyGroup(sqlSession,map);
	}

	@Override
	public int applyCount(int sgNo) {
		return studyGroupApplyDao.applyCount(sqlSession,sgNo);
	}

}
