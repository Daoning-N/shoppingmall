package com.reply.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.reply.dao.ReplyDAO;
import com.reply.dto.ReplyVO;


@Service
public class ReplyServiceImpl implements ReplyService {

   @Inject
   ReplyDAO dao;

   @Override
   public void createReply(ReplyVO vo) {
      dao.createReply(vo);
   }

   @Override
   public List<ReplyVO> replyList(Integer bno, int start, int end, HttpSession session) {
      List<ReplyVO> items = dao.replyList(bno, start, end);
      String user_id = (String) session.getAttribute("user_id");
      for(ReplyVO vo : items) {
         if(vo.getSecretReply().equals("y")) {
            if(user_id==null) {
               vo.setReplytext("비밀 댓글입니다.");
            } else {
               String writer = vo.getWriter();
               String replyer = vo.getReplyer();
               if(!user_id.equals(writer) && !user_id.equals(replyer)) {
                  vo.setReplytext("비밀 댓글입니다.");
               }
            }
         }
      }
      return items;
   }

   @Override
   public ReplyVO replyDetail(Integer rno) {
      return dao.replyDetail(rno);
   }

   @Override
   public void updateReply(ReplyVO vo) {
      dao.updateReply(vo);
   }

   @Override
   public void deleteReply(Integer rno) {
      dao.deleteReply(rno);

   }

   @Override
   public int countReply(Integer bno) {
      return dao.countReply(bno);
   }

}