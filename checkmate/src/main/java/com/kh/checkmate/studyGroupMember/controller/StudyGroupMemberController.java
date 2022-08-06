package com.kh.checkmate.studyGroupMember.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.kh.checkmate.studyGroup.controller.StudyGroupController;
import com.kh.checkmate.studyGroup.model.service.StudyGroupService;
import com.kh.checkmate.studyGroup.model.vo.StudyGroup;
import com.kh.checkmate.studyGroupMember.model.service.StudyGroupMemberService;

@Controller
public class StudyGroupMemberController {
	
	@Autowired
	private StudyGroupMemberService studyGroupMemberService;
	
	@Autowired
	private StudyGroupService studyGroupService;
	
	@Autowired StudyGroupController studyGroupController;
	
	public String insertOwner(StudyGroup sg, HttpSession session, Model model) {
		
		//스터디그룹 생성시 STUDYGROUPMEMBER테이블에 OWNER의 NICK 추가
		StudyGroup studyGroup = studyGroupService.studyGroupNoSelect(sg);
		Map<String, Object> map = new HashMap<>();
		map.put("sg", sg);
		map.put("studyGroup", studyGroup);

		int result = studyGroupMemberService.insertOwner(map);

		if (result > 0) {
			return "redirect:/";
		} else {
			model.addAttribute("errorMsg", "관리자에게 문의해주세요");
			return "common/errorPage";
		}
	}

}
