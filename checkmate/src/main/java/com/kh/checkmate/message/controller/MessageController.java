package com.kh.checkmate.message.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.checkmate.common.model.vo.PageInfo;
import com.kh.checkmate.common.template.Pagination;
import com.kh.checkmate.member.model.vo.Member;
import com.kh.checkmate.message.model.service.MessageService;
import com.kh.checkmate.message.model.vo.Message;
import com.kh.checkmate.studyGroup.controller.StudyGroupController;

@Controller
public class MessageController {

	@Autowired
	private MessageService messageService;
	
	@Autowired
	private StudyGroupController studyGroupController;

	@RequestMapping("messageList.msg")
	public String messageList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, HttpSession session,
			Model model) {

		Member member = (Member) session.getAttribute("loginUser");
		Map<String, Object> map = new HashMap<>();
		map.put("userNick", member.getUserNick());

		int listCount = messageService.selectListCount(map);
		int pageLimit = 10;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		List<Message> messageList = messageService.messageList(map, pi);

		model.addAttribute("messageList", messageList);
		model.addAttribute("pi", pi);

		System.out.println();

		return "message/messageList";
	}

	@RequestMapping("messageDetail.msg")
	public ModelAndView messageDetail(String msgno, HttpSession session, ModelAndView mv) {
		Member member = (Member) session.getAttribute("loginUser");

		Message message = messageService.selectMessageOne(msgno);

		mv.addObject("message", message).setViewName("message/messageDetail");

		return mv;
	}

	@RequestMapping("messageForm.msg")
	public String messageForm() {
		return "message/messageEnroll";
	}

	@RequestMapping("messageInsert.msg")
	public String insertMessage(Message message, MultipartFile upfile, HttpSession session, Model model) {

		if (!upfile.getOriginalFilename().equals("")) {

			String changeName = saveFile(upfile, session);

			message.setMsgOriginName(upfile.getOriginalFilename());
			message.setMsgChangeName("resources/uploadFiles/" + changeName);
		}

		int result = messageService.insertMessage(message);

		return "redirect:messageList.msg";
	}
	
	@RequestMapping("sgDetailMessageInsert.msg")
	public String sgDetailMessageInsert(int sgNo, Message message, MultipartFile upfile, HttpSession session, Model model) {

		if (!upfile.getOriginalFilename().equals("")) {

			String changeName = saveFile(upfile, session);

			message.setMsgOriginName(upfile.getOriginalFilename());
			message.setMsgChangeName("resources/uploadFiles/" + changeName);
		}
		
		int result = messageService.insertMessage(message);

		return studyGroupController.studyGroupDetail(sgNo, session, model);
	}
	
	

	@RequestMapping(value = "messageDelete.msg", method = RequestMethod.POST)
	@ResponseBody
	public int deleteMessage(@RequestParam(value = "msgNo") int msgNo, HttpSession session) {
		Member member = (Member) session.getAttribute("loginUser");

		Map<String, Object> map = new HashMap<>();

		map.put("msgNo", msgNo);

		int result = messageService.deleteMessage(map);

		return result;
	}

	@RequestMapping(value = "checkedMessageDelete.msg", method = RequestMethod.POST)
	@ResponseBody
	public int checkedMessageDelete(@RequestParam(value = "arr[]") List<String> arr, HttpSession session) {
		Member member = (Member) session.getAttribute("loginUser");

		Map<String, Object> map = new HashMap<>();

		map.put("arr", arr);

		int result = messageService.checkedMessageDelete(map);

		return result;
	}

	@RequestMapping(value = "messageReport.msg", method = RequestMethod.POST)
	@ResponseBody
	public int reportMessage(@RequestParam(value = "msgNo") int msgNo, HttpSession session) {
		Member member = (Member) session.getAttribute("loginUser");

		Map<String, Object> map = new HashMap<>();

		map.put("msgNo", msgNo);

		int result = messageService.reportMessage(map);

		return result;
	}

	@RequestMapping(value = "checkedMessageReport.msg", method = RequestMethod.POST)
	@ResponseBody
	public int checkedMessageReport(@RequestParam(value = "arr[]") List<String> arr, HttpSession session) {
		Member member = (Member) session.getAttribute("loginUser");

		Map<String, Object> map = new HashMap<>();

		map.put("arr", arr);

		int result = messageService.checkedMessageReport(map);

		return result;
	}

	@RequestMapping("messageSendList.msg")
	public String messageSendList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			HttpSession session, Model model) {

		Member member = (Member) session.getAttribute("loginUser");
		Map<String, Object> map = new HashMap<>();
		map.put("userNick", member.getUserNick());

		int listCount = messageService.selectSendListCount(map);
		int pageLimit = 10;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		List<Message> messageList = messageService.messageSendList(map, pi);

		model.addAttribute("messageList", messageList);
		model.addAttribute("pi", pi);

		System.out.println();

		return "message/messageSendList";
	}

	@RequestMapping("messageReply.msg")
	public String replyMessage(@RequestParam(value = "reply") String reply, Message message, MultipartFile upfile, HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("loginUser");
		Map<String, Object> map = new HashMap<>();
		map.put("userNick", member.getUserNick());
		model.addAttribute("reply", reply);
		
		return "message/messageReplyEnroll";
	}

	@RequestMapping("messageSendDetail.msg")
	public ModelAndView messageSendDetail(String msgno, HttpSession session, ModelAndView mv) {
		Member member = (Member) session.getAttribute("loginUser");

		Message message = messageService.selectMessageOne(msgno);

		mv.addObject("message", message).setViewName("message/messageSendDetail");

		return mv;
	}

	public String saveFile(MultipartFile upfile, HttpSession session) {

		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		int ranNum = (int) (Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));

		String changeName = currentTime + ranNum + ext;

		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");

		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println(savePath);

		return changeName;
	}

}
