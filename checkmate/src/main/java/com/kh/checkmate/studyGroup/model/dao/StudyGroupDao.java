package com.kh.checkmate.studyGroup.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmate.common.model.vo.PageInfo;
import com.kh.checkmate.member.model.vo.Member;
import com.kh.checkmate.studyGroup.model.vo.StudyGroup;

@Repository
public class StudyGroupDao {

	public int nameCheck(SqlSessionTemplate sqlSession, String sgName) {
		return sqlSession.selectOne("studyGroupMapper.nameCheck", sgName);
	}

	public int insertStudyGroup(SqlSessionTemplate sqlSession, StudyGroup sg) {
		return sqlSession.insert("studyGroupMapper.insertStudyGroup", sg);
	}

	// 구대영
	public StudyGroup studyGroupDetail(SqlSessionTemplate sqlSession, int sgNo) {
		return sqlSession.selectOne("studyGroupMapper.studyGroupDetail", sgNo);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("studyGroupMapper.selectListCount");
	}

	public ArrayList<StudyGroup> studyGroupList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("studyGroupMapper.studyGroupList", null, rowBounds);
	}
	
	public ArrayList<StudyGroup> oneStudyGroupList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("studyGroupMapper.oneStudyGroupList");
	}

	public StudyGroup studyGroupNoSelect(SqlSessionTemplate sqlSession, StudyGroup sg) {
		return sqlSession.selectOne("studyGroupMapper.studyGroupNoSelect", sg);
	}

	public int searchListCount(SqlSessionTemplate sqlSession, String searchContent) {
		return sqlSession.selectOne("studyGroupMapper.searchListCount", searchContent);
	}

	public ArrayList<StudyGroup> sgSearchList(SqlSessionTemplate sqlSession, PageInfo pi, String searchContent) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("studyGroupMapper.sgSearchList", searchContent, rowBounds);
	}

	public int max(SqlSessionTemplate sqlSession, int sgNo) {
		return sqlSession.selectOne("studyGroupMapper.max", sgNo);
	}

	public int deleteStudyGroup(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.update("studyGroupMapper.deleteStudyGroup", map);
	}

	public int sgCurrent(SqlSessionTemplate sqlSession, int sgNo) {
		return sqlSession.update("studyGroupMapper.sgCurrent", sgNo);
	}

	public ArrayList<StudyGroup> myStudyGroupList(SqlSessionTemplate sqlSession, String userNick) {
		return (ArrayList) sqlSession.selectList("studyGroupMapper.myStudyGroupList", userNick);
	}

	
}
