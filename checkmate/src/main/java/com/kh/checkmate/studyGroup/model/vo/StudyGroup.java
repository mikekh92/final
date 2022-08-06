package com.kh.checkmate.studyGroup.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StudyGroup {
	
	private int sgNo;						//	SG_NO	NUMBER
	private String sgName;					//	SG_NAME	VARCHAR2(100 BYTE)
	private String sgGoal;					//	SG_GOAL	VARCHAR2(100 BYTE)
	private String sgContent;				//	SG_CONTENT	VARCHAR2(2000 BYTE)
	private String sgOwnerNick;				//	SG_OWNER_NICK	VARCHAR2(100 BYTE)
	private int sgMax;						//	SG_MAX	NUMBER
	private int sgCurrent;
	private Date sgEnrollDate;				//	SG_ENROLLDATE	DATE
	private String sgCategory;				//	SG_CATEGORY	VARCHAR2(100 BYTE)
	private String sgLocation;				//	SG_LOCATION	VARCHAR2(100 BYTE)
	private String sgStatus;				//	SG_STATUS	VARCHAR2(1 BYTE)
	
}
