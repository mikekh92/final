package com.kh.checkmate.studyGroupApply.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.checkmate.member.model.vo.Member;
import com.kh.checkmate.message.model.service.MessageService;
import com.kh.checkmate.studyGroup.controller.StudyGroupController;
import com.kh.checkmate.studyGroup.model.service.StudyGroupService;
import com.kh.checkmate.studyGroupApply.model.service.StudyGroupApplyService;
import com.kh.checkmate.studyGroupApply.model.vo.StudyGroupApply;
import com.kh.checkmate.studyGroupMember.model.service.StudyGroupMemberService;

@Controller
public class StudyGroupApplyController {

	@Autowired
	private StudyGroupApplyService studyGroupApplyService;

	@Autowired
	private StudyGroupService studyGroupService;

	@Autowired
	private MessageService messageService;

	@Autowired
	private StudyGroupMemberService studyGroupMemberService;

	@Autowired
	private StudyGroupController studyGroupController;

	@RequestMapping("studyGroupApply.sga")
	public String studyGroupApply(StudyGroupApply studyGroupApply, HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("loginUser");
		Map<String, Object> map = new HashMap<>();
		map.put("userNick", member.getUserNick());

		int result = studyGroupApplyService.insertStudyGroupApply(studyGroupApply);

		if (result > 0) {
			session.setAttribute("alertMsg", "스터디그룹 지원 성공");
			return studyGroupController.studyGroupList(1, model);
		} else {
			model.addAttribute("alertMsg", "스터디그룹 지원 실패");
			return studyGroupController.studyGroupList(1, model);
		}
	}

	@RequestMapping("acceptStudyGroup.sga")
	@ResponseBody
	public int acceptStudyGroup(@RequestParam(value = "sgaApplyNo") int sgaApplyNo,
			@RequestParam(value = "sgNo") int sgNo, HttpSession session) {
		Member member = (Member) session.getAttribute("loginUser");

		Map<String, Object> map = new HashMap<>();
		map.put("sgaApplyNo", sgaApplyNo);
		map.put("sgNo", sgNo);

		int max = studyGroupService.max(sgNo);
		int currentMember = studyGroupMemberService.memberCount(sgNo);
		
		if(max >= currentMember) {
			// SG_APPLY_STATUS = 'Y'로 변경
			int result = studyGroupApplyService.acceptStudyGroup(map);
			// StudyGroupMember에 추가
			int result1 = studyGroupMemberService.insertStudyGroupMember(map);
			//SG_CURRNET 추가
			int result2 = studyGroupService.sgCurrent(sgNo); 
			// 메세지 전송
			int message = messageService.sendAcceptMessage(map);
			return result;
		} else {
			return 0;
		}
	}

	@RequestMapping("rejectStudyGroup.sga")
	@ResponseBody
	public int rejectStudyGroup(@RequestParam(value = "sgaApplyNo") int sgaApplyNo,
			@RequestParam(value = "sgNo") int sgNo, HttpSession session) {
		Member member = (Member) session.getAttribute("loginUser");

		Map<String, Object> map = new HashMap<>();

		map.put("sgaApplyNo", sgaApplyNo);
		map.put("sgNo", sgNo);

		// SG_APPLY_STATUS = 'N'로 변경
		int result = studyGroupApplyService.rejectStudyGroup(map);

		// 메세지 전송
		int message = messageService.sendRejectMessage(map);

		return result;
	}

}
