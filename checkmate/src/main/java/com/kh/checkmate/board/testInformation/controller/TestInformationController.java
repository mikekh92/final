package com.kh.checkmate.board.testInformation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestInformationController {

	@RequestMapping("calender.ca")
	   public String Calendar() {
		
	      return "calender/tiView";
	   }
	}