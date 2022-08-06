package com.kh.checkmate.board.cs.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmate.board.cs.model.dao.noticeDao;
import com.kh.checkmate.board.cs.model.vo.notice;
import com.kh.checkmate.common.model.vo.PageInfo;

@Service
public class noticeServiceImpl implements noticeService {
	@Autowired
	private noticeDao noticeDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int noticeListCount() {
		
		return noticeDao.noticeListCount(sqlSession);
	}

	@Override
	public ArrayList<notice> noticeSelectList(PageInfo pi) {
		
		return noticeDao.noticeSelectList(sqlSession,pi);
	}

	@Override
	public int insertNotice(notice n) {
		// TODO Auto-generated method stub
		return noticeDao.insertNotice(sqlSession,n);
	}

	@Override
	public int noticeIncreaseCount(int noticeNo) {
		// TODO Auto-generated method stub
		return noticeDao.noticeIncreaseCount(sqlSession,noticeNo);
	}

	@Override
	public notice noticeDetail(int noticeNo) {
		// TODO Auto-generated method stub
		return noticeDao.noticeDetail(sqlSession,noticeNo);
	}

	@Override
	public int updateNotice(notice n) {
		// TODO Auto-generated method stub
		return noticeDao.updateNotice(sqlSession,n);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		// TODO Auto-generated method stub
		return noticeDao.deleteNotice(sqlSession,noticeNo);
	}
	
}
