package com.kh.checkmate.studyGroupMember.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.checkmate.member.model.vo.Member;
import com.kh.checkmate.studyGroup.model.vo.StudyGroup;
import com.kh.checkmate.studyGroupMember.model.vo.StudyGroupMember;

public interface StudyGroupMemberService {

	int insertStudyGroupMember(Map<String, Object> map);

	int insertOwner(Map<String, Object> map);

	ArrayList<StudyGroupMember> memberList(int sgNo);

	int memberCount(int sgNo);

}
