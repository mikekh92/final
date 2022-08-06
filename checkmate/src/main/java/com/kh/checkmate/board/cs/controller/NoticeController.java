package com.kh.checkmate.board.cs.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.checkmate.board.cs.model.service.noticeService;
import com.kh.checkmate.board.cs.model.vo.notice;
import com.kh.checkmate.board.sharingInformation.model.vo.SharingInformation;
import com.kh.checkmate.common.model.vo.PageInfo;
import com.kh.checkmate.common.template.Pagination;

@Controller
public class NoticeController {
	@Autowired
	private noticeService noticeService;
	
	@RequestMapping("noticeList.no")
	public String jobSelectList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {
		int listCount = noticeService.noticeListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<notice> list = noticeService.noticeSelectList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "board/notice/notice";
	}
	
	@RequestMapping("noticeEnrollForm.no")
	public String noticeEnrollForm() {
		return "board/notice/noticeEnrollForm";
	}
	
	@RequestMapping("noticeInsert.no")
	public String noticeInsert(notice n, MultipartFile upfile, HttpSession session, Model model) {
		
		
		
		int result = noticeService.insertNotice(n);
		if(result>0) {
			session.setAttribute("alertMsg", "게시글을 작성하셨습니다.");
			return "redirect:noticeList.no";
		}else { 
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("noticeDetail.no")
	public ModelAndView noticeDetail(int noticeNo, ModelAndView mv) {
		int result = noticeService.noticeIncreaseCount(noticeNo);

		if (result > 0) {
			notice n = noticeService.noticeDetail(noticeNo);
			mv.addObject("n", n).setViewName("board/notice/noticeDetail");
		} else {
			mv.addObject("errorMsg", "게시글 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("updateForm.no")
	public String updateForm(int noticeNo, Model model) {
		notice n = noticeService.noticeDetail(noticeNo);
		
		model.addAttribute("n", n);
		
		return "board/notice/noticeUpdateForm";
	}
	
	@RequestMapping("update.no")
	public ModelAndView updateNotice(ModelAndView mv,notice n, HttpSession session) {
		
		
		int result = noticeService.updateNotice(n);
		System.out.println(n);
		if(result>0) {
			session.setAttribute("alertMsg", "게시글 수정 성공");
			mv.setViewName("redirect:noticeDetail.no?noticeNo="+n.getNoticeNo());
		}else {
			mv.addObject("errorMsg","게시글 수정 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("delete.no")
public ModelAndView deleteNotice(ModelAndView mv, int noticeNo, HttpSession session) {
		
		int result = noticeService.deleteNotice(noticeNo);
		
		if(result>0) {
			
			
			session.setAttribute("alertMsg", "게시글 삭제 성공");
			mv.setViewName("redirect:noticeList.no");
		}else {
			mv.addObject("errorMsg", "게시글 삭제 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	public String saveFile(MultipartFile upfile,HttpSession session) {
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime+ranNum+ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
}
