package com.kh.checkmate.studyGroupApply.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmate.studyGroupApply.model.vo.StudyGroupApply;

@Repository
public class StudyGroupApplyDao {

	public int insertStudyGroupApply(SqlSessionTemplate sqlSession, StudyGroupApply studyGroupApply) {
		return sqlSession.insert("studyGroupApplyMapper.insertStudyGroupApply", studyGroupApply);
	}

	public ArrayList<StudyGroupApply> studyGroupApplyList(SqlSessionTemplate sqlSession, int sgNo) {
		return (ArrayList)sqlSession.selectList("studyGroupApplyMapper.studyGroupApplyList", sgNo);
	}

	public int acceptStudyGroup(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.update("studyGroupApplyMapper.acceptStudyGroup", map);
	}

	public int rejectStudyGroup(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.update("studyGroupApplyMapper.rejectStudyGroup", map);
	}

	public int applyCount(SqlSessionTemplate sqlSession, int sgNo) {
		return sqlSession.selectOne("studyGroupApplyMapper.applyCount", sgNo);
	}

}
