package com.kh.checkmate.board.sharingInformation.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class SharingInformation {
	private int informationNo;	//	INFORMATION_NO	NUMBER
	private int userNo;	//	USER_NO	NUMBER
	private String userNick;
	private String userId;
	private String informationCategory;	//	INFORMATION_CATEGORY	VARCHAR2(1 BYTE)
	private String informationTitle;	//	INFORMATION_TITLE	VARCHAR2(100 BYTE)
	private String informationContent;	//	INFORMATION_CONTENT	VARCHAR2(4000 BYTE)
	private Date informationDate;	//	INFORMATION_DATE	DATE
	private int informationView;	//	INFORMATION_VIEW	NUMBER
	private String informationStatus;	//	INFORMATION_STATUS	VARCHAR2(1 BYTE)
	private String informationOriginName;
	private String informationChangeName;
	private String searchContent;
	private int informationListNum;
}
