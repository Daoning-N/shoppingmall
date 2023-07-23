package com.reply.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.reply.dto.ReplyVO;
import com.reply.service.ReplyPager;
import com.reply.service.ReplyService;


@RestController
@RequestMapping
public class ReplyController {

   @Inject
   ReplyService service;
   
   // 1_1. 댓글입력 controller
   @RequestMapping("insertReply.do")
   public void insert(@ModelAttribute ReplyVO vo, HttpSession session) {
      // 세션에 저장된 회원아디디를 댓글 작성지에 세팅
      String user_id = (String) session.getAttribute("user_id");
      vo.setReplyer(user_id);
      // 댓글 입력 메서드 호출
      service.createReply(vo);
   }
   // 1_2. 댓글입력(@RestController방식으로 json전달하여 댓글입력)
   // ResponseEntity : 데이터 + http status code
   // ResponseBody : 객체를 json으로 (json -String)   
   @RequestMapping(value="insertRestReply.do", method=RequestMethod.POST)
   public ResponseEntity<String> insertRest(@RequestBody ReplyVO vo, HttpSession session) {
   ResponseEntity<String> entity = null;
   try {
      // 세션에 저장된 회원아아디를 댓글작성자에 세팅
      String user_id = (String)session.getAttribute("user_id");
      vo.setReplyer(user_id);
      //댓글 입력 메서드 호출
      service.createReply(vo);
      // 댓글입력이 성공하면 성공메시지 저장
      entity = new ResponseEntity<String>("success", HttpStatus.OK);
   } catch (Exception e) {
      e.printStackTrace();
      // 댓글입력이 실패하면 실패 메시지 저장 String넣었음
      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
   }
   // 입력 처리 HTTP 상태 메시지 리턴
   return entity;
}
   // 2.1. 댓글목록 controller
   @RequestMapping("replyList.do")
   public ModelAndView list(@RequestParam int bno,
@RequestParam(defaultValue="1") int curPage, ModelAndView mav, HttpSession session) {
   //페이징 처리
   int count = service.countReply(bno); //댓글 개수 
   ReplyPager replyPager = new ReplyPager(count, curPage);
   // 현재 페이지의 페이징 시작 번호
   int start = replyPager.getPageBegin();
   // 현재 페이지의 페이징 끝 번호
   int end = replyPager.getPageEnd();
   List<ReplyVO> list = service.replyList(bno, start, end, session);
   //뷰 이름 지정
   mav.setViewName("replyList");
   //뷰에 전달할 데이터 지정
   mav.addObject("list", list);
   mav.addObject("replyPager", replyPager);
   // replyList.jsp로 포워딩
   return mav;
}
   //2_2. 댓글 목록
   @RequestMapping("replyListJson.do")
   @ResponseBody //리턴 데이트를 json으로 변환
   public List<ReplyVO> listJson(@RequestParam int bno,
@RequestParam(defaultValue="1") int curPage, HttpSession session) {
   int count = service.countReply(bno); //댓글 갯수
   ReplyPager pager = new ReplyPager(count, curPage);
   // 현재 페이지의 페이징 싲가 번호
   int start = pager.getPageBegin();
   //현재 페이지의 페이징 끝 번호
   int end = pager.getPageEnd();
   List<ReplyVO> list = service.replyList(bno, start, end, session);
   // list를 리턴
   return list;
}
   // 2_3. 댓글 목록
   @RequestMapping(value="/replyList/{bno}/{curPage}", method=RequestMethod.GET)
   public ModelAndView replyList(@PathVariable("bno") int bno, @PathVariable int curPage, ModelAndView mav, HttpSession session) {
      //페이징 처리
   int count = service.countReply(bno); // 댓글 갯수
   ReplyPager replyPager = new ReplyPager(count, curPage);
   //현재 페이지의 페이징 시작 번호
   int start = replyPager.getPageBegin();
   // 현재 페이지의 페이징 끝 번호
   int end = replyPager.getPageEnd();
   List<ReplyVO> list = service.replyList(bno, start, end, session);
   // 뷰이름 지정
   mav.setViewName("replyList");
   //뷰에 전달할 데이터 ㅂ지정
   mav.addObject("list", list);
   mav.addObject("replyPager", replyPager);
   // replyList.jsp로 포워딩
   return mav;
}
   
   // 3. 댓글 상세 보기
   @RequestMapping(value="replyDetail.do/{rno}", method=RequestMethod.GET)
   public ModelAndView replyDetail(@PathVariable("rno") Integer rno, ModelAndView mav) {
   ReplyVO vo = service.replyDetail(rno);
   // 뷰이름 지정
   mav.setViewName("replyDetail");
   // 뷰에 전달할 데이터 지정
   mav.addObject("vo", vo);
   // replyDetail.jsp로 포워딩
   return mav;
}
   // 4. 댓글 수정 처리 - put:전체 수정, PATCH:일부수정

   @RequestMapping(value="updateReply/{rno}", method={RequestMethod.PUT, RequestMethod.PATCH})
   public ResponseEntity<String> replyUpdate(@PathVariable("rno") Integer rno, @RequestBody ReplyVO vo) {

      ResponseEntity<String> entity = null;
      try {
         vo.setRno(rno);
         service.updateReply(vo);
         //댓글 수정이 성공하면 성공 상태 메시지 저장
         entity = new ResponseEntity<String>("success", HttpStatus.OK);
      } catch (Exception e) {
         // 댓글 수정이 실패하면 실패 상태매시지 저장
         e.printStackTrace();
         
         entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
      }
      // 수정 처리 HTTP 상태 메시ㅣㅈ 리턴
   return entity;
}
   // 5. 댓글 삭제처리
   @RequestMapping(value="deleteReply/{rno}")
   public ResponseEntity<String> deleteReply(@PathVariable("rno") Integer rno) {
      ResponseEntity<String> entity = null;
      try {
         service.deleteReply(rno);
         // 댓글 삭제가 성공하면 성공 상태메시지 저장
         entity = new ResponseEntity<String>("success", HttpStatus.OK);
      } catch (Exception e) {
         e.printStackTrace();
         // 댓글 삭제가 실패하면 실패 상테메시지 저장
         entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
      }
      // 삭제 처리 hTTP 상태 메시지 리턴
   return entity;
   }
}