package com.kh.checkmate.board.faq.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmate.board.cs.model.vo.notice;
import com.kh.checkmate.board.faq.model.dao.faqDao;
import com.kh.checkmate.board.faq.model.vo.faq;
import com.kh.checkmate.common.model.vo.PageInfo;

@Service
public class faqServiceImpl implements faqService {
	@Autowired
	private faqDao faqDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int faqListCount() {
		
		return faqDao.faqListCount(sqlSession);
	}

	@Override
	public ArrayList<faq> faqSelectList(PageInfo pi) {
		
		return faqDao.faqSelectList(sqlSession,pi);
	}

	@Override
	public int insertfaq(faq f) {
		// TODO Auto-generated method stub
		return faqDao.insertFaq(sqlSession,f);
	}

	@Override
	public int faqIncreaseCount(int faqNo) {
		// TODO Auto-generated method stub
		return faqDao.faqIncreaseCount(sqlSession,faqNo);
	}

	@Override
	public faq faqDetail(int faqNo) {
		// TODO Auto-generated method stub
		return faqDao.faqDetail(sqlSession,faqNo);
	}

	@Override
	public int updateFaq(faq f) {
		// TODO Auto-generated method stub
		return faqDao.updateFaq(sqlSession,f);
	}

	@Override
	public int deletefaq(int faqNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("faqMapper.deleteFaq",faqNo);
	}
	
}
