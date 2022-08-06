package com.kh.checkmate.studyGroup.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.checkmate.common.model.vo.PageInfo;
import com.kh.checkmate.member.model.vo.Member;
import com.kh.checkmate.studyGroup.model.vo.StudyGroup;

public interface StudyGroupService {
	
	int nameCheck(String sgName);

	int insertStudyGroup(StudyGroup sg);
	
	//구대영
	StudyGroup studyGroupDetail(int sgNo);

	int selectListCount();

	ArrayList<StudyGroup> studyGroupList(PageInfo pi);
	
	ArrayList<StudyGroup> oneStudyGroupList();

	StudyGroup studyGroupNoSelect(StudyGroup sg);

	int searchListCount(String searchContent);

	ArrayList<StudyGroup> sgSearchList(PageInfo pi, String searchContent);

	int max(int sgNo);

	int deleteStudyGroup(Map<String, Object> map);

	int sgCurrent(int sgNo);

	ArrayList<StudyGroup> myStudyGroupList(String userNick);

	
}
