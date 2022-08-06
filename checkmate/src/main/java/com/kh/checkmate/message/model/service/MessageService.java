package com.kh.checkmate.message.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kh.checkmate.common.model.vo.PageInfo;
import com.kh.checkmate.message.model.vo.Message;

public interface MessageService {
	
	//전체 메세지 수 구하기
	int selectListCount(Map<String,Object> map);
	
	//Message List
	List<Message> messageList(Map<String,Object> memberId, PageInfo pi);
	
	//Message Detail
	Message selectMessageOne(String msgno);

	//Message Send
	int insertMessage(Message message);

	//Message Delete
	int deleteMessage(Map<String, Object> map);

	int checkedMessageDelete(Map<String, Object> map);

	int reportMessage(Map<String, Object> map);

	int checkedMessageReport(Map<String, Object> map);

	List<Message> messageSendList(Map<String, Object> map, PageInfo pi);

	int selectSendListCount(Map<String, Object> map);

	int sendAcceptMessage(Map<String, Object> map);

	int sendRejectMessage(Map<String, Object> map);

	

	


}
