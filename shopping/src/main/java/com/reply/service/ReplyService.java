package com.reply.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.reply.dto.ReplyVO;

public interface ReplyService {

   public void createReply(ReplyVO vo);

   public List<ReplyVO> replyList(Integer bno, int start, int end, HttpSession session);

   public ReplyVO replyDetail(Integer rno);

   public void updateReply(ReplyVO vo);

   public void deleteReply(Integer rno);

   public int countReply(Integer bno);

}