package com.kh.checkmate.board.sharingInformation.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.checkmate.board.sharingInformation.model.service.SharingInformationService;
import com.kh.checkmate.board.sharingInformation.model.vo.Reply;
import com.kh.checkmate.board.sharingInformation.model.vo.SharingInformation;
import com.kh.checkmate.common.model.vo.PageInfo;
import com.kh.checkmate.common.template.Pagination;

@Controller
public class JobSharingInformationController {
	@Autowired
	private SharingInformationService sharingInformationService;

	@RequestMapping("jobList.si")
	public String jobSelectList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {
		int listCount = sharingInformationService.jobSelectListCount();
		
		int pageLimit = 10;
		int boardLimit = 15;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<SharingInformation> list = sharingInformationService.jobSelectList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "board/jobSharingInformation/jobListView";
	}

	@RequestMapping("jobEnrollForm.si")
	public String jobEnrollForm() {
		return "board/jobSharingInformation/jobEnrollForm";
	}
	
	@RequestMapping("jobInsert.si")
	public String jobInsertBoard(SharingInformation b, MultipartFile upfile, HttpSession session, Model model) {
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile,session);
			b.setInformationOriginName(upfile.getOriginalFilename());
			b.setInformationChangeName("resources/uploadFiles/"+changeName);
		}
		
		int result = sharingInformationService.jobInsertBoard(b);
		if(result>0) {
			session.setAttribute("alertMsg", "게시글을 작성하셨습니다.");
			return "redirect:jobList.si";
		}else { 
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errorPage";
		}
	}

	@RequestMapping("jobDetail.si")
	public ModelAndView jobSelectBoard(int informationNo, ModelAndView mv) {
			int result = sharingInformationService.jobIncreaseCount(informationNo);
			
			if (result > 0) {
				ArrayList<SharingInformation> boardList = sharingInformationService.jobTopBoard();
				ArrayList<SharingInformation> replyList = sharingInformationService.jobTopReply();
				SharingInformation b = sharingInformationService.jobSelectBoard(informationNo);
				mv.addObject("b", b);
				mv.addObject("boardList", boardList);
				mv.addObject("replyList", replyList);
				mv.setViewName("board/jobSharingInformation/jobDetailView");
			} else {
				mv.addObject("errorMsg", "게시글 조회 실패").setViewName("common/errorPage");
			}
			return mv;
	}
	
	@RequestMapping("jobDelete.si")
	public ModelAndView jobDeleteBoard(ModelAndView mv, int informationNo, String filePath, HttpSession session) {
		
		int result = sharingInformationService.jobDeleteBoard(informationNo);
		
		if(result>0) {
			if(!filePath.equals("")) {
				String realPath = session.getServletContext().getRealPath(filePath);
				new File(realPath).delete();
			}
			
			session.setAttribute("alertMsg", "게시글 삭제 성공");
			mv.setViewName("redirect:jobList.si");
		}else {
			mv.addObject("errorMsg", "게시글 삭제 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("jobUpdateForm.si")
	public String jobUpdateForm(int informationNo, Model model) {
		SharingInformation b = sharingInformationService.jobSelectBoard(informationNo);
		
		model.addAttribute("b", b);
		
		return "board/jobSharingInformation/jobUpdateForm";
	}
	
	@RequestMapping("jobUpdate.si")
	public ModelAndView jobUpdateBoard(ModelAndView mv, MultipartFile upfile, SharingInformation b, HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			if(!b.getInformationOriginName().equals("")) {
				new File(session.getServletContext().getRealPath(b.getInformationChangeName())).delete();
			}
			
			String changeName = saveFile(upfile,session);
			
			b.setInformationOriginName(upfile.getOriginalFilename());
			b.setInformationChangeName("resources/uploadFiles/"+changeName);
		}
		
		int result = sharingInformationService.jobUpdateBoard(b);
		
		if(result>0) {
			session.setAttribute("alertMsg", "게시글 수정 성공");
			mv.setViewName("redirect:jobDetail.si?informationNo="+b.getInformationNo());
		}else {
			mv.addObject("errorMsg","게시글 수정 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("jobSearch.si")
	public String jobSearchList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model, SharingInformation b) {
		int listCount = sharingInformationService.jobSelectListCount();

		int pageLimit = 10;
		int boardLimit = 15;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<SharingInformation> list = sharingInformationService.jobSearchList(pi, b);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "board/jobSharingInformation/jobListView";
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
	
	@RequestMapping(value="jobrlist.si",produces="application/json; charset=UTF-8")
	@ResponseBody
	public String jobSelectReplyList(int informationNo) {
		
		ArrayList<Reply> list = sharingInformationService.jobSelectReplyList(informationNo);
		return new Gson().toJson(list);
	}
	
	@RequestMapping(value="jobrinsert.si",produces="html/text; charset=UTF-8")
	@ResponseBody
	public String jobInsertReply(Reply r) {
		Reply checkNo = sharingInformationService.checkNo(r);
		r.setRefUno(checkNo.getRefUno());
		int result = sharingInformationService.jobInsertReply(r);
		
		String ans="";
		
		if(result>0) { //성공
			ans="Y";
		}else {//실패 
			ans="N";
		}
		return ans;
	}
	@RequestMapping(value="jobrdelete.si",produces="html/text; charset=UTF-8")
	@ResponseBody
	public String jobDeleteReply(Reply r) {
		Reply checkNo = sharingInformationService.jobCheckNick(r);
		r.setRefUno(checkNo.getRefUno());
		int result = sharingInformationService.jobDeleteReply(r);
		
		String ans="";
		
		if(result>0) { //성공
			ans="Y";
		}else {//실패 
			ans="N";
		}
		return ans;
	}
	
	@RequestMapping(value="jobredit.si",produces="html/text; charset=UTF-8")
	@ResponseBody
	public String jobEditReply(Reply r) {
		Reply checkNo = sharingInformationService.jobCheckNick(r);
		r.setRefUno(checkNo.getRefUno());
		int result = sharingInformationService.jobEditReply(r);
		
		String ans="";
		
		if(result>0) { //성공
			ans="Y";
		}else {//실패 
			ans="N";
		}
		return ans;
	}
	
	// 구대영
	// 통합검색
	@RequestMapping("jsiSearchList.si")
	public String jsiSearchList(@RequestParam(value = "searchContent") String searchContent,
			@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model, SharingInformation b) {
		int jsearchListCount = sharingInformationService.searchListCount2(searchContent);

		int pageLimit = 10;
		int boardLimit = 15;

		PageInfo pi = Pagination.getPageInfo(jsearchListCount, currentPage, pageLimit, boardLimit);

		model.addAttribute("searchContent", searchContent);
		ArrayList<SharingInformation> list = sharingInformationService.jsiSearchList(pi, searchContent);
		model.addAttribute("list", list);

		model.addAttribute("pi", pi);

		return "board/jobSharingInformation/jobListView";
	}
	
}
