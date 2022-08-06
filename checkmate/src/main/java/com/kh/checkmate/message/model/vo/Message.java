package com.kh.checkmate.message.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;
import lombok.Getter;


@Data
public class Message implements Serializable{
	
	private int msgNo;
	private String msgSend;
	private String msgRecv;
	private String msgSendtime;
	private String msgContent;
	private String msgOriginName;
	private String msgChangeName;
	private String msgStatus;
	
}
