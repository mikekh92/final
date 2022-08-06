package com.kh.checkmate.board.sharingInformation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmate.board.sharingInformation.model.dao.SharingInformationDao;
import com.kh.checkmate.board.sharingInformation.model.vo.Reply;
import com.kh.checkmate.board.sharingInformation.model.vo.SharingInformation;
import com.kh.checkmate.common.model.vo.PageInfo;
import com.kh.checkmate.studyGroup.model.vo.StudyGroup;

@Service
public class SharingInformationServiceImpl implements SharingInformationService{
	
	@Autowired
	private SharingInformationDao sid;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		
		return sid.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<SharingInformation> selectList(PageInfo pi) {
		
		return sid.selectList(sqlSession,pi);
	}

	@Override
	public int insertBoard(SharingInformation b) {
		
		return sid.insertBoard(sqlSession,b);
	}

	@Override
	public int increaseCount(int informationNo) {
		return sid.increaseCount(sqlSession,informationNo);
	}

	@Override
	public SharingInformation selectBoard(int informationNo) {
		return sid.selectBoard(sqlSession,informationNo);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return sid.deleteBoard(sqlSession,boardNo);
	}

	@Override
	public int updateBoard(SharingInformation b) {
		return sid.updateBoard(sqlSession,b);
	}

	@Override
	public ArrayList<SharingInformation> searchList(PageInfo pi, SharingInformation b) {
		return sid.searchList(sqlSession, pi, b);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int informationNo) {
		return sid.selectReplyList(sqlSession,informationNo);
	}

	@Override
	public int insertReply(Reply r) {
		return sid.insertReply(sqlSession,r);
	}

	@Override
	public Reply checkNo(Reply r) {
		return sid.checkNo(sqlSession,r);
	}
	@Override
	public ArrayList<SharingInformation> topBoard() {
		return sid.topBoard(sqlSession);
	}
	
	@Override
	public ArrayList<SharingInformation> topReply() {
		return sid.topReply(sqlSession);
	}

	@Override
	public int replyCount(Reply r) {
		return sid.replyCount(sqlSession,r);
	}

	@Override
	public int deleteReply(Reply r) {
		return sid.deleteReply(sqlSession,r);
	}

	@Override
	public int editReply(Reply r) {
		return sid.editReply(sqlSession,r);
	}
	

	@Override
	public Reply checkNick(Reply r) {
		return sid.checkNick(sqlSession,r);
	}

	
	// 취업정보공유 게시판
	@Override
	public int jobSelectListCount() {
		return sid.jobSelectListCount(sqlSession);
	}

	@Override
	public ArrayList<SharingInformation> jobSelectList(PageInfo pi) {
		return sid.jobSelectList(sqlSession,pi);
	}

	@Override
	public int jobInsertBoard(SharingInformation b) {
		return sid.jobInsertBoard(sqlSession,b);
	}

	@Override
	public int jobIncreaseCount(int informationNo) {
		return sid.jobIncreaseCount(sqlSession,informationNo);
	}

	@Override
	public SharingInformation jobSelectBoard(int informationNo) {
		return sid.jobSelectBoard(sqlSession,informationNo);
	}

	@Override
	public int jobDeleteBoard(int informationNo) {
		return sid.jobDeleteBoard(sqlSession,informationNo);
	}

	@Override
	public int jobUpdateBoard(SharingInformation b) {
		return sid.jobUpdateBoard(sqlSession,b);
	}

	@Override
	public ArrayList<SharingInformation> jobSearchList(PageInfo pi, SharingInformation b) {
		return sid.jobSearchList(sqlSession, pi, b);
	}

	@Override
	public ArrayList<Reply> jobSelectReplyList(int informationNo) {
		return sid.jobSelectReplyList(sqlSession,informationNo);
	}

	@Override
	public int jobInsertReply(Reply r) {
		return sid.jobInsertReply(sqlSession,r);
	}
	
	@Override
	public ArrayList<SharingInformation> jobTopBoard() {
		return sid.jobTopBoard(sqlSession);
	}

	@Override
	public ArrayList<SharingInformation> jobTopReply() {
		return sid.jobTopReply(sqlSession);
	}

	@Override
	public int jobReplyCount(Reply r) {
		return sid.jobReplyCount(sqlSession,r);
	}

	@Override
	public int jobDeleteReply(Reply r) {
		return sid.jobDeleteReply(sqlSession,r);
	}

	@Override
	public Reply jobCheckNick(Reply r) {
		return sid.jobCheckNick(sqlSession,r);
	}

	@Override
	public int jobEditReply(Reply r) {
		return sid.jobEditReply(sqlSession,r);
	}

	//구대영
	@Override
	public int searchListCount(String searchContent) {
		return sid.searchListCount(sqlSession, searchContent);
	}

	@Override
	public int searchListCount2(String searchContent) {
		return sid.searchListCount2(sqlSession, searchContent);
	}

	@Override
	public ArrayList<SharingInformation> siSearchList(PageInfo pi, String searchContent) {
		return sid.siSearchList(sqlSession, pi, searchContent);
	}

	@Override
	public ArrayList<SharingInformation> jsiSearchList(PageInfo pi, String searchContent) {
		return sid.jsiSearchList(sqlSession, pi, searchContent);
	}
	
	
	
	

}
