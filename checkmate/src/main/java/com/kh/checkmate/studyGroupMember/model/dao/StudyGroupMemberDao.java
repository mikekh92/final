package com.kh.checkmate.studyGroupMember.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmate.studyGroup.model.vo.StudyGroup;
import com.kh.checkmate.studyGroupMember.model.vo.StudyGroupMember;

@Repository
public class StudyGroupMemberDao {

	public int insertStudyGroupMember(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.insert("studyGroupMemberMapper.insertStudyGroupMember", map);
	}

	public int insertOwner(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.insert("studyGroupMemberMapper.insertOwner", map);
	}

	public ArrayList<StudyGroupMember> memberList(SqlSessionTemplate sqlSession, int sgNo) {
		return (ArrayList)sqlSession.selectList("studyGroupMemberMapper.memberList", sgNo);
	}

	public int memberCount(SqlSessionTemplate sqlSession, int sgNo) {
		return sqlSession.selectOne("studyGroupMemberMapper.memberCount", sgNo);
	}

}
