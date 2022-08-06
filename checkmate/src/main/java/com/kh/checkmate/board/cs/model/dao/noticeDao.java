package com.kh.checkmate.board.cs.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmate.board.cs.model.vo.notice;
import com.kh.checkmate.common.model.vo.PageInfo;

@Repository
public class noticeDao {

	public int noticeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.noticeListCount");
	}

	public ArrayList<notice> noticeSelectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("noticeMapper.noticeSelectList",null,rowBounds);
	}

	public int insertNotice(SqlSessionTemplate sqlSession, notice n) {
		// TODO Auto-generated method stub
		return sqlSession.insert("noticeMapper.insertNotice",n);
	}

	public int noticeIncreaseCount(SqlSessionTemplate sqlSession, int noticeNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeMapper.increaseCount",noticeNo);
	}

	public notice noticeDetail(SqlSessionTemplate sqlSession, int noticeNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeMapper.noticeDetail",noticeNo);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, notice n) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeMapper.updateNotice",n);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeMapper.deleteNotice",noticeNo);
	}

}
