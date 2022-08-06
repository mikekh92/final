package com.kh.checkmate.message.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmate.common.model.vo.PageInfo;
import com.kh.checkmate.message.model.vo.Message;

public interface MessageDao {

	int selectListCount(Map<String,Object> map, SqlSessionTemplate sqlSession);

	List<Message> messageList(Map<String, Object> map, PageInfo pi);

	Message selectMessageOne(String msgno);

	int insertMessage(Message message);

	int deleteMessage(Map<String, Object> map);

	int checkedMessageDelete(Map<String, Object> map);

	int reportMessage(Map<String, Object> map);

	int checkedMessageReport(Map<String, Object> map);

	List<Message> messageSendList(Map<String, Object> map, PageInfo pi);

	int selectSendListCount(Map<String, Object> map, SqlSessionTemplate sqlSession);

	int sendAcceptMessage(Map<String, Object> map, SqlSessionTemplate sqlSession);

	int sendRejectMessage(Map<String, Object> map, SqlSessionTemplate sqlSession);

	

}
