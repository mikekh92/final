package com.kh.checkmate.message.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmate.common.model.vo.PageInfo;
import com.kh.checkmate.message.model.dao.MessageDao;
import com.kh.checkmate.message.model.vo.Message;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDao messageDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount(Map<String, Object> map) {
		return messageDao.selectListCount(map, sqlSession);
	}

	@Override
	public List<Message> messageList(Map<String, Object> map, PageInfo pi) {
		return messageDao.messageList(map, pi);
	}

	@Override
	public Message selectMessageOne(String msgno) {
		return messageDao.selectMessageOne(msgno);
	}

	@Override
	public int insertMessage(Message message) {
		return messageDao.insertMessage(message);
	}

	@Override
	public int deleteMessage(Map<String, Object> map) {
		return messageDao.deleteMessage(map);
	}

	@Override
	public int checkedMessageDelete(Map<String, Object> map) {
		return messageDao.checkedMessageDelete(map);
	}

	@Override
	public int reportMessage(Map<String, Object> map) {
		return messageDao.reportMessage(map);
	}

	@Override
	public int checkedMessageReport(Map<String, Object> map) {
		return messageDao.checkedMessageReport(map);
	}

	@Override
	public List<Message> messageSendList(Map<String, Object> map, PageInfo pi) {
		return messageDao.messageSendList(map, pi);
	}

	@Override
	public int selectSendListCount(Map<String, Object> map) {
		return messageDao.selectSendListCount(map, sqlSession);
	}

	@Override
	public int sendAcceptMessage(Map<String, Object> map) {
		return messageDao.sendAcceptMessage(map, sqlSession);
	}

	@Override
	public int sendRejectMessage(Map<String, Object> map) {
		return messageDao.sendRejectMessage(map, sqlSession);
	}

}
