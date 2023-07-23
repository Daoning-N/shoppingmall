package com.reply.dao;

import java.util.List;

import com.reply.dto.ReplyVO;

public interface ReplyDAO {

   public void createReply(ReplyVO vo);

   public List<ReplyVO> replyList(Integer bno, int start, int end);

   public ReplyVO replyDetail(Integer rno);

   public void updateReply(ReplyVO vo);

   public void deleteReply(Integer rno);

   public int countReply(Integer bno);

}