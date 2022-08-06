package com.kh.checkmate.common.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.checkmate.board.sharingInformation.model.service.SharingInformationService;
import com.kh.checkmate.board.sharingInformation.model.vo.SharingInformation;
import com.kh.checkmate.common.model.service.CommonService;
import com.kh.checkmate.common.model.vo.PageInfo;
import com.kh.checkmate.common.template.Pagination;
import com.kh.checkmate.studyGroup.model.service.StudyGroupService;
import com.kh.checkmate.studyGroup.model.vo.StudyGroup;

@Controller
public class CommonController {

	@Autowired
	private CommonService commonService;

	@Autowired
	private StudyGroupService studyGroupService;

	@Autowired
	private SharingInformationService sharingInformationService;

//	@Autowired
//	private NoticeService noticeService;

	@RequestMapping("mainSearch.co")
	public String mainSearch(@RequestParam(value = "searchContent") String searchContent,
			@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {

		model.addAttribute("searchContent", searchContent); // 검색한 단어 들고가기

		int pageLimit = 10;
		int boardLimit = 10;

		// 검색결과 수(COUNT)
		int sgSearchCount = studyGroupService.searchListCount(searchContent);
		model.addAttribute("sgSearchCount", sgSearchCount);
		int siSearchCount = sharingInformationService.searchListCount(searchContent);
		model.addAttribute("siSearchCount", siSearchCount);
		int jsiSearchCount = sharingInformationService.searchListCount2(searchContent);
		model.addAttribute("jsiSearchCount", jsiSearchCount);
//		int NoticeSearchCount = NoticeService.searchListCount(searchContent); 

		int totalListCount = sgSearchCount + siSearchCount + jsiSearchCount;

		PageInfo pi = Pagination.getPageInfo(totalListCount, currentPage, pageLimit, boardLimit);

		// 검색결과 리스트
		ArrayList<StudyGroup> sgSearchList = studyGroupService.sgSearchList(pi, searchContent);
		ArrayList<SharingInformation> siSearchList = sharingInformationService.siSearchList(pi, searchContent);
		ArrayList<SharingInformation> jsiSearchList = sharingInformationService.jsiSearchList(pi, searchContent);
		model.addAttribute("sgSearchList", sgSearchList);
		model.addAttribute("siSearchList", siSearchList);
		model.addAttribute("jsiSearchList", jsiSearchList);

		// 테스트
		System.out.println(sgSearchCount);
		System.out.println(totalListCount);
		System.out.println(sgSearchList);
		System.out.println(siSearchList);
		System.out.println(jsiSearchList);

//		model.addAttribute("studyGroupList", studyGroupList);
		model.addAttribute("pi", pi);

		return "common/searchResult";
	}
}
