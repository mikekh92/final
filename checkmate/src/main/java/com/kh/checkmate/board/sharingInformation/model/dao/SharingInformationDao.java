package com.kh.checkmate.board.sharingInformation.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmate.board.sharingInformation.model.vo.Reply;
import com.kh.checkmate.board.sharingInformation.model.vo.SharingInformation;
import com.kh.checkmate.common.model.vo.PageInfo;
import com.kh.checkmate.studyGroup.model.vo.StudyGroup;

@Repository
public class SharingInformationDao {
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("sharingInformationMapper.selectListCount");
	}

	public ArrayList<SharingInformation> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
 		return (ArrayList)sqlSession.selectList("sharingInformationMapper.selectList",null,rowBounds);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int informationNo) {
		return sqlSession.update("sharingInformationMapper.increaseCount",informationNo);
	}

	public SharingInformation selectBoard(SqlSessionTemplate sqlSession, int informationNo) {
		return sqlSession.selectOne("sharingInformationMapper.selectBoard",informationNo);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, SharingInformation b) {
		return sqlSession.update("sharingInformationMapper.updateBoard",b);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, SharingInformation b) {
		return sqlSession.insert("sharingInformationMapper.insertBoard",b);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("sharingInformationMapper.deleteBoard",boardNo);
	}

	public ArrayList<SharingInformation> searchList(SqlSessionTemplate sqlSession, PageInfo pi, SharingInformation b) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset,limit);
		
 		return (ArrayList)sqlSession.selectList("sharingInformationMapper.searchList",b,rowBounds);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int informationNo) {
		return (ArrayList)sqlSession.selectList("sharingInformationMapper.selectReplyList",informationNo);
	}

	public Reply checkNo(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.selectOne("sharingInformationMapper.checkNo", r);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("sharingInformationMapper.insertReply",r);
	}
	
	public ArrayList<SharingInformation> topBoard(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("sharingInformationMapper.topBoard");
	}
	
	public ArrayList<SharingInformation> topReply(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("sharingInformationMapper.topReply");
	}

	public int replyCount(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("sharingInformationMapper.replyCount",r);
	}
	
	public int deleteReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("sharingInformationMapper.deleteReply",r);
	}
	
	public int editReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("sharingInformationMapper.editReply",r);
	}
	
	public Reply checkNick(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.selectOne("sharingInformationMapper.checkNick", r);
	}
	
	
	// 취업정보공유 게시판
	public int jobSelectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("jobSharingInformationMapper.jobSelectListCount");
	}

	public ArrayList<SharingInformation> jobSelectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("jobSharingInformationMapper.jobSelectList",null,rowBounds);
	}

	public int jobInsertBoard(SqlSessionTemplate sqlSession, SharingInformation b) {
		return sqlSession.insert("jobSharingInformationMapper.jobInsertBoard",b);
	}

	public int jobIncreaseCount(SqlSessionTemplate sqlSession, int informationNo) {
		return sqlSession.update("jobSharingInformationMapper.jobIncreaseCount",informationNo);
	}

	public SharingInformation jobSelectBoard(SqlSessionTemplate sqlSession, int informationNo) {
		return sqlSession.selectOne("jobSharingInformationMapper.jobSelectBoard",informationNo);
	}

	public int jobDeleteBoard(SqlSessionTemplate sqlSession, int informationNo) {
		return sqlSession.update("jobSharingInformationMapper.jobDeleteBoard",informationNo);
	}

	public int jobUpdateBoard(SqlSessionTemplate sqlSession, SharingInformation b) {
		return sqlSession.update("jobSharingInformationMapper.jobUpdateBoard",b);
	}

	public ArrayList<SharingInformation> jobSearchList(SqlSessionTemplate sqlSession, PageInfo pi,
			SharingInformation b) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset,limit);
		
 		return (ArrayList)sqlSession.selectList("jobSharingInformationMapper.jobSearchList",b,rowBounds);
	}

	public ArrayList<Reply> jobSelectReplyList(SqlSessionTemplate sqlSession, int informationNo) {
		return (ArrayList)sqlSession.selectList("jobSharingInformationMapper.jobSelectReplyList",informationNo);
	}

	public int jobInsertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("jobSharingInformationMapper.jobInsertReply",r);
	}
	
	public ArrayList<SharingInformation> jobTopBoard(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("jobSharingInformationMapper.jobTopBoard");
	}

	public ArrayList<SharingInformation> jobTopReply(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("jobSharingInformationMapper.jobTopReply");
	}

	public int jobReplyCount(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("jobSharingInformationMapper.jobReplyCount",r);
	}

	public int jobDeleteReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("jobSharingInformationMapper.jobDeleteReply",r);
	}

	public Reply jobCheckNick(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.selectOne("jobSharingInformationMapper.jobCheckNick", r);
	}

	public int jobEditReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("jobSharingInformationMapper.jobEditReply",r);
	}

	//구대영
	public int searchListCount(SqlSessionTemplate sqlSession, String searchContent) {
		return sqlSession.selectOne("sharingInformationMapper.searchListCount", searchContent);
	}

	public int searchListCount2(SqlSessionTemplate sqlSession, String searchContent) {
		return sqlSession.selectOne("jobSharingInformationMapper.searchListCount2", searchContent);
	}

	public ArrayList<SharingInformation> siSearchList(SqlSessionTemplate sqlSession, PageInfo pi, String searchContent) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("sharingInformationMapper.siSearchList", searchContent, rowBounds);
	}

	public ArrayList<SharingInformation> jsiSearchList(SqlSessionTemplate sqlSession, PageInfo pi, String searchContent) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("jobSharingInformationMapper.jsiSearchList", searchContent, rowBounds);
	}

	
}
