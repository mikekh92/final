package com.kh.checkmate.studyGroup.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.checkmate.common.model.vo.PageInfo;
import com.kh.checkmate.common.template.Pagination;
import com.kh.checkmate.member.model.service.MemberService;
import com.kh.checkmate.member.model.vo.Member;
import com.kh.checkmate.studyGroup.model.service.StudyGroupService;
import com.kh.checkmate.studyGroup.model.vo.StudyGroup;
import com.kh.checkmate.studyGroupApply.model.service.StudyGroupApplyService;
import com.kh.checkmate.studyGroupApply.model.vo.StudyGroupApply;
import com.kh.checkmate.studyGroupMember.controller.StudyGroupMemberController;
import com.kh.checkmate.studyGroupMember.model.service.StudyGroupMemberService;
import com.kh.checkmate.studyGroupMember.model.vo.StudyGroupMember;

@Controller
public class StudyGroupController {

	@Autowired
	private StudyGroupService studyGroupService;

	@Autowired
	private StudyGroupApplyService studyGroupApplyService;

	@Autowired
	private StudyGroupMemberService studyGroupMemberService;

	@Autowired
	private StudyGroupMemberController studyGroupMemeberController;

	@Autowired
	private MemberService memberService;

	@RequestMapping("studyGroupEnrollForm.sg")
	public String studyGroupEnrollForm() {
		return "studyGroup/studyGroupEnrollForm";
	}

	@ResponseBody
	@RequestMapping(value = "nameCheck.sg", produces = "text/html; charset=UTF-8")
	public String nickCheck(String sgName) {

		int result = studyGroupService.nameCheck(sgName);

		if (result > 0) {
			return "N";
		} else {
			return "Y";
		}
	}

	@RequestMapping("insert.sg")
	public String insertStudyGroup(StudyGroup sg, HttpSession session, Model model) {

		int result = studyGroupService.insertStudyGroup(sg);

		if (result > 0) {
			session.setAttribute("alertMsg", "스터디그룹 생성 성공");
			return studyGroupMemeberController.insertOwner(sg, session, model);
		} else {
			model.addAttribute("errorMsg", "스터디그룹 생성 실패");
			return "common/errorPage";
		}

	}

	// 구대영
	@RequestMapping("studyGroupDetail.sg")
	public String studyGroupDetail(int sgNo, HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("loginUser");

		ArrayList<StudyGroupApply> studyGroupApplyList = studyGroupApplyService.studyGroupApplyList(sgNo);
		model.addAttribute("studyGroupApplyList", studyGroupApplyList);
		int applyCount = studyGroupApplyService.applyCount(sgNo);
		model.addAttribute("applyCount", applyCount);

		StudyGroup studyGroup = studyGroupService.studyGroupDetail(sgNo);
		model.addAttribute("studyGroup", studyGroup);

		ArrayList<StudyGroupMember> studyGroupMember = studyGroupMemberService.memberList(sgNo);
		int memberCount = studyGroupMemberService.memberCount(sgNo);
		model.addAttribute("studyGroupMember", studyGroupMember);
		model.addAttribute("memberCount", memberCount);

		// 김승현
		Member member2 = memberService.userProfile(sgNo);
		String[] userAddress = member2.getUserAddress().split(" ");
		String userfullAddress = userAddress[0] + " " + userAddress[1];

		member2.setUserAddress(userfullAddress);
		model.addAttribute("member2", member2);

		return "studyGroup/studyGroupDetail";
	}

	@RequestMapping("studyGroupList.sg")
	public String studyGroupList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {

		int listCount = studyGroupService.selectListCount();

		int pageLimit = 10;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<StudyGroup> studyGroupList = studyGroupService.studyGroupList(pi);
		ArrayList<StudyGroup> oneStudyGroupList = studyGroupService.oneStudyGroupList();

		model.addAttribute("studyGroupList", studyGroupList);
		model.addAttribute("pi", pi);
		model.addAttribute("oneStudyGroupList", oneStudyGroupList);

		return "studyGroup/studyGroupList";
	}
	
	@RequestMapping("studyGroupExploration.sg")
	public String exStudyGroupList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {
		
		int listCount = studyGroupService.selectListCount();

		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<StudyGroup> studyGroupList = studyGroupService.studyGroupList(pi);
		ArrayList<StudyGroup> oneStudyGroupList = studyGroupService.oneStudyGroupList();
		
		model.addAttribute("oneStudyGroupList", oneStudyGroupList);
		model.addAttribute("studyGroupList", studyGroupList);
		
		return "studyGroup/studyGroupExploration";	
	}

	@RequestMapping("studyGroupSearch.sg")
	public String mainSearch(@RequestParam(value = "searchContent") String searchContent,
			@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {

		model.addAttribute("searchContent", searchContent);

		int pageLimit = 10;
		int boardLimit = 10;

		int sgSearchCount = studyGroupService.searchListCount(searchContent);
		model.addAttribute("sgSearchCount", sgSearchCount);

		int totalListCount = sgSearchCount;

		PageInfo pi = Pagination.getPageInfo(totalListCount, currentPage, pageLimit, boardLimit);

		//통합검색
		ArrayList<StudyGroup> studyGroupList = studyGroupService.sgSearchList(pi, searchContent);
		model.addAttribute("studyGroupList", studyGroupList);

		
		model.addAttribute("pi", pi);

		return "studyGroup/studyGroupList";
	}

	@RequestMapping("deleteStudyGroup.sg")
	public int deleteStudyGroup(@RequestParam(value = "sgNo") int sgNo, HttpSession session) {
		Member member = (Member) session.getAttribute("loginUser");
		Map<String, Object> map = new HashMap<>();
		map.put("userNick", member.getUserNick());
		map.put("sgNo", sgNo);

		System.out.println(map);

		int result = studyGroupService.deleteStudyGroup(map);
		System.out.println(member);

		System.out.println(result);

		return result;
	}

}
