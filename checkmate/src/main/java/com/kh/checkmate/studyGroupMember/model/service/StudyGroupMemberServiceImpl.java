package com.kh.checkmate.studyGroupMember.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmate.studyGroup.model.vo.StudyGroup;
import com.kh.checkmate.studyGroupMember.model.dao.StudyGroupMemberDao;
import com.kh.checkmate.studyGroupMember.model.vo.StudyGroupMember;

@Service
public class StudyGroupMemberServiceImpl implements StudyGroupMemberService{

	@Autowired
	private StudyGroupMemberDao studyGroupMemberDao;

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertStudyGroupMember(Map<String, Object> map) {
		return studyGroupMemberDao.insertStudyGroupMember(sqlSession,map);
	}

	@Override
	public int insertOwner(Map<String, Object> map) {
		return studyGroupMemberDao.insertOwner(sqlSession, map);
	}

	@Override
	public ArrayList<StudyGroupMember> memberList(int sgNo) {
		return studyGroupMemberDao.memberList(sqlSession, sgNo);
	}

	@Override
	public int memberCount(int sgNo) {
		return studyGroupMemberDao.memberCount(sqlSession, sgNo);
	}

}
