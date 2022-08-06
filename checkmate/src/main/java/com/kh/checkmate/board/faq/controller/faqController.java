package com.kh.checkmate.board.faq.controller;

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

import com.kh.checkmate.board.cs.model.vo.notice;
import com.kh.checkmate.board.faq.model.service.faqService;
import com.kh.checkmate.board.faq.model.vo.faq;
import com.kh.checkmate.common.model.vo.PageInfo;
import com.kh.checkmate.common.template.Pagination;

@Controller
public class faqController {
	@Autowired
	private faqService faqService;
	
	@RequestMapping("faqList.no")
	public String jobSelectList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {
		int listCount = faqService.faqListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<faq> list = faqService.faqSelectList(pi);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "board/faq/faq";
	}
	
	@RequestMapping("faqEnrollForm.no")
	public String noticeEnrollForm() {
		return "board/faq/faqEnrollForm";
	}
	
	@RequestMapping("faqInsert.no")
	public String noticeInsert(faq f, MultipartFile upfile, HttpSession session, Model model) {
		
		
		
		int result = faqService.insertfaq(f);
		if(result>0) {
			session.setAttribute("alertMsg", "게시글을 작성하셨습니다.");
			return "redirect:faqList.no";
		}else { 
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("faqDetail.no")
	public ModelAndView noticeDetail(int faqNo, ModelAndView mv) {
		
		int result = faqService.faqIncreaseCount(faqNo);
		
		if (result > 0) {
			faq f = faqService.faqDetail(faqNo);

			mv.addObject("f", f).setViewName("board/faq/faqDetail");
		} else {
			mv.addObject("errorMsg", "게시글 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("faqupdateForm.no")
	public String updateForm(int faqNo, Model model) {
		faq f = faqService.faqDetail(faqNo);
		
		model.addAttribute("f", f);
		
		return "board/faq/faqUpdateForm";
	}
	
	@RequestMapping("faqupdate.no")
	public ModelAndView updateFaq(ModelAndView mv,faq f, HttpSession session) {
		
		int result = faqService.updateFaq(f);
		
		if(result>0) {
			session.setAttribute("alertMsg", "게시글 수정 성공");
			mv.setViewName("redirect:faqDetail.no?faqNo="+f.getFaqNo());
		}else {
			mv.addObject("errorMsg","게시글 수정 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("faqdelete.no")
public ModelAndView deleteFaq(ModelAndView mv, int faqNo, HttpSession session) {
		System.out.println(faqNo);
		
		int result = faqService.deletefaq(faqNo);
		
		
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
