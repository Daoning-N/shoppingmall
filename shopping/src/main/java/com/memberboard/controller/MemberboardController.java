package com.memberboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.memberboard.dto.MemberboardVO;
import com.memberboard.service.BoardPager;
import com.memberboard.service.MemberboardService;
import com.reply.service.ReplyService;

@Controller
public class MemberboardController {
   
   // 의존관계 주입 => BoardServiceImpl 생성
   // IoC 의존관계 역전

   @Inject
   MemberboardService service;
   
   @Inject // ReplyService 주입(ReplyService의 댓글의 갯수를 구하는 메서드 호출하기 위해)
   ReplyService replyservice;

   
   // 게시글 목록
   @RequestMapping("memberboardList.do")
   // @RequestParam(defaultValue="") ==> 기본값 할당 : 현재페이지를 1로 초기화
   public ModelAndView memberboardList(@RequestParam(defaultValue="title")
   String searchOption,            @RequestParam(defaultValue="")
   String keyword,                  @RequestParam(defaultValue="1")
   int curPage) {
      
      // 레코드의 갯수 계산
      int count = service.countArticle(searchOption, keyword);
      
      // 페이지 나누기 관련 처리
      BoardPager boardPager = new BoardPager(count, curPage);
      int start = boardPager.getPageBegin()-1;
      int end = boardPager.getPageEnd();

      List<MemberboardVO> list = service.memberboardList(start, end,
   searchOption, keyword);

      
      // 데이터를 맵에 저장
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("list", list); // list
      map.put("count", count); // 레코드의 갯수
      map.put("searchOption", searchOption); // 검색옵션
      map.put("keyword", keyword); // 검색키워드
      map.put("boardPager", boardPager);

      ModelAndView mav = new ModelAndView();
      mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
      mav.setViewName("memberboardList"); // 뷰를 memberboardList.jsp로 설정
      
      return mav; //memberboardList.jsp로 List가 전달
   }

   // 게시글 작성화면
   // @RequestMapping("writeMemberboard.do")
   // value="", method="전송방식"
   @RequestMapping(value="memberboardWrite.do", method=RequestMethod.GET)
   public String memberboardWrite() {
      return "memberboardWrite"; // memberboardWrite.jsp로 이동
   }

   // 게시글 작성
   @RequestMapping(value="memberboardInsert.do", method=RequestMethod.POST)
   public String memberboardInsert(@ModelAttribute MemberboardVO vo, HttpSession session) {
      // session에 저장된 user_id를 writer에 저장
      String writer = (String) session.getAttribute("user_id");
      // vo에 writer를 세팅
      vo.setWriter(writer);
      service.memberboardInsert(vo);
      return "redirect:/memberboardList.do";
   }

   // 게시글 상세조회, 게시글 조회수 증가
   @RequestMapping(value="memberboardView.do", method=RequestMethod.GET)
   public ModelAndView memberboardView(@RequestParam int bno, @RequestParam int curPage,
@RequestParam String searchOption, @RequestParam String keyword, HttpSession session) {
      service.increaseViewcnt(bno, session);
      ModelAndView mav = new ModelAndView();
      mav.setViewName("memberboardView");
      // 댓글의 수를 맵에 저장 : 댓글이 존재하는 게시물의 삭제를 방지
      mav.addObject("count", replyservice.countReply(bno));
      mav.addObject("dto", service.memberboardView(bno));
      mav.addObject("curPage", curPage);
      mav.addObject("searchOption", searchOption);
      mav.addObject("keyword", keyword);
      // logger.info("mav:", mav);
      return mav;
   }

   // 게시글 수정
   // 폼에서 이력한 내용들은 @ModelAttribute BoardVO vo로 전달
   @RequestMapping(value="memberboardUpdate.do", method=RequestMethod.POST)
   public String memberboardUpdate(@ModelAttribute MemberboardVO vo) {
      service.memberboardUpdate(vo);
      return "redirect:/memberboardList.do";
   }

   // 게시글 삭제
   @RequestMapping("memberboardDelete.do")
   public String memberboardDelete(@RequestParam int bno) throws Exception {
      service.memberboardDelete(bno);
      return "redirect:/memberboardList.do";
   }
}