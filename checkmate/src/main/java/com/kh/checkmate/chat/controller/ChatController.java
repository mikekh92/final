package com.kh.checkmate.chat.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.checkmate.studyGroup.model.service.StudyGroupService;
import com.kh.checkmate.studyGroup.model.vo.StudyGroup;


@Controller
public class ChatController {
	
	@RequestMapping("chat.do")
	public String chat(HttpSession session, Model model) {
		
		return "chat/chat";
	}
	
	
}
