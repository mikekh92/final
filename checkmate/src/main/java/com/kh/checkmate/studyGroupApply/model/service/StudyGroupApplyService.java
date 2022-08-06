package com.kh.checkmate.studyGroupApply.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.checkmate.studyGroupApply.model.vo.StudyGroupApply;

public interface StudyGroupApplyService {

	int insertStudyGroupApply(StudyGroupApply studyGroupApply);

	ArrayList<StudyGroupApply> studyGroupApplyList(int sgNo);

	int acceptStudyGroup(Map<String, Object> map);

	int rejectStudyGroup(Map<String, Object> map);

	int applyCount(int sgNo);

}
