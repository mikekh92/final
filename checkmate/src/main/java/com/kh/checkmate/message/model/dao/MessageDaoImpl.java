package com.kh.checkmate.message.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.checkmate.common.model.vo.PageInfo;
import com.kh.checkmate.message.model.vo.Message;

@Repository
public class MessageDaoImpl implements MessageDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount(Map<String, Object> map, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("message.selectListCount", map);
	}

	@Override
	public List<Message> messageList(Map<String, Object> map, PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("message.messageList", map, rowBounds);
	}

	@Override
	public Message selectMessageOne(String msgno) {
		return sqlSession.selectOne("message.selectMessageOne", msgno);
	}

	@Override
	public int insertMessage(Message message) {
		return sqlSession.insert("message.insertMessage", message);
	}

	@Override
	public int deleteMessage(Map<String, Object> map) {
		return sqlSession.update("message.deleteMessage", map);
	}

	@Override
	public int checkedMessageDelete(Map<String, Object> map) {
		return sqlSession.update("message.deleteCheckedMessage", map);
	}

	@Override
	public int reportMessage(Map<String, Object> map) {
		return sqlSession.update("message.reportMessage", map);
	}

	@Override
	public int checkedMessageReport(Map<String, Object> map) {
		return sqlSession.update("message.reportCheckedMessage", map);
	}

	@Override
	public List<Message> messageSendList(Map<String, Object> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("message.messageSendList", map, rowBounds);
	}

	@Override
	public int selectSendListCount(Map<String, Object> map, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("message.selectSendListCount", map);
	}

	@Override
	public int sendAcceptMessage(Map<String, Object> map, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("message.sendAcceptMessage", map);
	}

	@Override
	public int sendRejectMessage(Map<String, Object> map, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("message.sendRejectMessage", map);
	}

}
