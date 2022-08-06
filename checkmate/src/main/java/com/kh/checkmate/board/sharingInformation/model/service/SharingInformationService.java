package com.kh.checkmate.board.sharingInformation.model.service;

import java.util.ArrayList;

import com.kh.checkmate.board.sharingInformation.model.vo.Reply;
import com.kh.checkmate.board.sharingInformation.model.vo.SharingInformation;
import com.kh.checkmate.common.model.vo.PageInfo;
import com.kh.checkmate.common.template.Pagination;
import com.kh.checkmate.studyGroup.model.vo.StudyGroup;


public interface SharingInformationService {
	//게시판 리스트 조회 + 페이징처리
	//전체 게시글 수 구하기
	int selectListCount();
	//게시글 리스트 조회
	ArrayList<SharingInformation> selectList(PageInfo pi);
	
	//게시글 작성하기
	int insertBoard(SharingInformation b);
	
	//게시글 상세조회
	//게시글 조회수 증가
	int increaseCount(int boardNo);
	
	//게시글 상세조회
	public abstract SharingInformation selectBoard(int boardNo); 
	
	//게시글 삭제
	public abstract int deleteBoard(int boardNo);
	
	//게시글 수정
	public abstract int updateBoard(SharingInformation b);
	
	// 검색화면
	ArrayList<SharingInformation> searchList(PageInfo pi, SharingInformation b);
	
	//댓글 리스트 조회 
	ArrayList<Reply> selectReplyList(int informationNo);
	
	//댓글 작성
	public abstract int insertReply(Reply r);
	Reply checkNo(Reply r);
	ArrayList<SharingInformation> topBoard();
	ArrayList<SharingInformation> topReply();
	int replyCount(Reply r);
	int deleteReply(Reply r);
	int editReply(Reply r);
	Reply checkNick(Reply r);
	
	// 취업지원정보공유 게시판
	int jobSelectListCount();
	ArrayList<SharingInformation> jobSelectList(PageInfo pi);
	int jobInsertBoard(SharingInformation b);
	int jobIncreaseCount(int informationNo);
	SharingInformation jobSelectBoard(int informationNo);
	int jobDeleteBoard(int informationNo);
	int jobUpdateBoard(SharingInformation b);
	ArrayList<SharingInformation> jobSearchList(PageInfo pi, SharingInformation b);
	ArrayList<Reply> jobSelectReplyList(int informationNo);
	int jobInsertReply(Reply r);
	ArrayList<SharingInformation> jobTopBoard();
	ArrayList<SharingInformation> jobTopReply();
	int jobReplyCount(Reply r);
	int jobDeleteReply(Reply r);
	Reply jobCheckNick(Reply r);
	int jobEditReply(Reply r);
	
	//구대영
	int searchListCount(String searchContent);
	int searchListCount2(String searchContent);
	ArrayList<SharingInformation> siSearchList(PageInfo pi, String searchContent);
	ArrayList<SharingInformation> jsiSearchList(PageInfo pi, String searchContent);
}
