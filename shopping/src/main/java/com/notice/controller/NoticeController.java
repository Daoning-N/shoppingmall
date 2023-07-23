package com.notice.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mysql.cj.protocol.x.Notice;
import com.notice.dto.NoticeVO;
import com.notice.service.NoticeService;

@Controller
public class NoticeController {

		@Inject
		NoticeService service;
		
		@RequestMapping("noticeList.do")
		public String noticeList(Model model) throws Exception {
			List<NoticeVO> list = service.noticeList();
			model.addAttribute("list", list); //addAttribute-> model에 데이터를 추가하는 메서드, mav는 addobject
			
			return "noticeList";
		}
		
		@RequestMapping("noticeView.do")
		public String noticeView(int notice_id, Model model) throws Exception {
			NoticeVO notice = service.noticeView(notice_id);
			model.addAttribute("notice", notice);
			
			return "noticeView"; //반환
		}
		
		@RequestMapping("deleteNotice.do")
	    public String deleteNotice(int notice_id) throws Exception {
	    	service.deleteNotice(notice_id);
	    	
	        return "redirect:/noticeList.do"; // 게시물 목록으로 리다이렉트(=다시지시)
	    }
		@RequestMapping("insertNotice.do")
	    public String insertNotice(NoticeVO vo) throws Exception {
			service.insertNotice(vo);
			
	        return "redirect:/noticeList.do";
	    }
		
		@RequestMapping("updateNotice.do")
		public String updateNotice(NoticeVO vo, int notice_id) throws Exception {
		    vo.setNotice_id(notice_id); // vo객체에 notice_id 설정, notice_id값은 공지사항을 식별하는 용도
		    service.updateNotice(vo);
		    
		    return "redirect:/noticeView.do?notice_id=" + notice_id;
		}
}