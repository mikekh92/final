package com.kh.checkmate.board.cs.model.service;

import java.util.ArrayList;

import com.kh.checkmate.board.cs.model.vo.notice;
import com.kh.checkmate.common.model.vo.PageInfo;

public interface noticeService {

	int noticeListCount();

	ArrayList<notice> noticeSelectList(PageInfo pi);

	int insertNotice(notice n);

	int noticeIncreaseCount(int noticeNo);

	notice noticeDetail(int noticeNo);

	int updateNotice(notice n);

	int deleteNotice(int noticeNo);

}
