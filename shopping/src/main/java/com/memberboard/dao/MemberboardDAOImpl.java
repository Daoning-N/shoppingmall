package com.memberboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.memberboard.dto.MemberboardVO;


@Repository
public class MemberboardDAOImpl implements MemberboardDAO {

   @Inject
   SqlSession sqlsession;

   
   // 게시글 작성
   @Override
   public void memberboardInsert(MemberboardVO vo) {
      sqlsession.insert("memberboard.memberboardInsert", vo);
   }

   // 게시글 상세보기
   @Override
   public MemberboardVO memberboardView(int bno) {
      return sqlsession.selectOne("memberboard.memberboardView", bno);
   }

   // 게시글 수정
   @Override
   public void memberboardUpdate(MemberboardVO vo) {
      sqlsession.update("memberboard.updateArticle", vo);
   }

   // 게시글 삭제
   @Override
   public void memberboardDelete(int bno) {
      sqlsession.delete("memberboard.deleteAtricle", bno);
   }

   // 게시글 목록
   @Override
   public List<MemberboardVO> memberboardList(int start, int end, String searchOption, String keyword) {
      Map<String, Object> map = new HashMap<>();
      map.put("searchOption", searchOption);
      map.put("keyword", keyword);
      // BETWEEN #{start}, #{end}에 입력될 값을 맵에
      map.put("start", start);
      map.put("end", end);
      return sqlsession.selectList("memberboard.memberboardList", map);
   }

   // 게시글 조회수 증가
   @Override
   public void increaseViewcnt(int bno) {
      sqlsession.update("memberboard.increaseViewcnt", bno);

   }

   // 게시글 레코드 갯수
   @Override
   public int countArticle(String searchOption, String keyword) {
      Map<String, String> map = new HashMap<>();
      map.put("searchOption", searchOption);
      map.put("keyword", keyword);
      return sqlsession.selectOne("memberboard.countArticle", map);
   }
}