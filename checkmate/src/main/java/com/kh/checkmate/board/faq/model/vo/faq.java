package com.kh.checkmate.board.faq.model.vo;

import java.sql.Date;

import com.kh.checkmate.board.sharingInformation.model.vo.SharingInformation;

import lombok.Data;

@Data
public class faq {
//	NOTICE_NO
//	USER_NO
//	NOTICE_TITLE
//	NOTICE_CONTENT
//	NOTICE_DATE
//	NOTICE_CATEGORY
//	NOTICE_VIEW
//	NOTICE_STATUS
//	NOTICE_REPLY
	private int faqNo;
	private int userNo;
	private String faqTitle;
	private String faqContent;
	private Date date;
	private String category;
	private int view;
	private String status;
	private String reply;
	private String userNick;
	private String userId;
}
