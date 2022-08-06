package com.kh.checkmate.board.sharingInformation.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Reply {
	   private int replyNo;
	   private String replyContent;
	   private String editContent;
	   private int refBno;
	   private int refUno;
	   private String replyProfile;
	   private String replyWriter;
	   private Date replyDate;
	   private String replyStatus;
	}