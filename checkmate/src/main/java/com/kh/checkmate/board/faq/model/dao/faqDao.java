package com.kh.checkmate.board.faq.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmate.board.cs.model.vo.notice;
import com.kh.checkmate.board.faq.model.vo.faq;
import com.kh.checkmate.common.model.vo.PageInfo;

@Repository
public class faqDao {

	public int faqListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("faqMapper.faqListCount");
	}

	public ArrayList<faq> faqSelectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("faqMapper.faqSelectList",null,rowBounds);
	}
	
	public int insertFaq(SqlSessionTemplate sqlSession, faq f) {
		// TODO Auto-generated method stub
		return sqlSession.insert("faqMapper.insertFaq",f);
	}

	public int faqIncreaseCount(SqlSessionTemplate sqlSession, int faqNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("faqMapper.increaseCount",faqNo);
	}

	public faq faqDetail(SqlSessionTemplate sqlSession, int faqNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("faqMapper.faqDetail",faqNo);
	}

	public int updateFaq(SqlSessionTemplate sqlSession, faq f) {
		// TODO Auto-generated method stub
		return sqlSession.update("faqMapper.updateFaq",f);
	}

	public int deleteFaq(SqlSessionTemplate sqlSession, int faqNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("faqMapper.deleteFaq",faqNo);
	}

}



