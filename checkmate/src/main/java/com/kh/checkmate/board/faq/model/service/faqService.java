package com.kh.checkmate.board.faq.model.service;

import java.util.ArrayList;

import com.kh.checkmate.board.cs.model.vo.notice;
import com.kh.checkmate.board.faq.model.vo.faq;
import com.kh.checkmate.common.model.vo.PageInfo;

public interface faqService {

	int faqListCount();

	ArrayList<faq> faqSelectList(PageInfo pi);

	int insertfaq(faq f);

	int faqIncreaseCount(int faqNo);

	faq faqDetail(int faqNo);

	int updateFaq(faq f);

	int deletefaq(int faqNo);


}

