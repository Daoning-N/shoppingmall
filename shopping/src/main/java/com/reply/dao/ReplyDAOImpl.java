package com.reply.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.reply.dto.ReplyVO;



@Repository
public class ReplyDAOImpl implements ReplyDAO {

   @Inject
   SqlSession sqlsession;

      @Override
      public void createReply(ReplyVO vo) {
         sqlsession.insert("reply.insertReply", vo);
      }

   @Override
   public List<ReplyVO> replyList(Integer bno, int start, int end) {
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("bno", bno);
      map.put("start", start);
      map.put("end", end);
      return sqlsession.selectList("reply.replyList", map);
   }

   @Override
   public ReplyVO replyDetail(Integer rno) {
      return sqlsession.selectOne("reply.replyDetail", rno);
   }

   @Override
   public void updateReply(ReplyVO vo) {
      sqlsession.update("reply.updateReply", vo);
   }

   @Override
   public void deleteReply(Integer rno) {
      sqlsession.delete("reply.deleteReply", rno);
   }

   @Override
   public int countReply(Integer bno) {
      return sqlsession.selectOne("reply.countReply", bno);
   }

}