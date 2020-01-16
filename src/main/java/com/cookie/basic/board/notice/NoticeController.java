package com.cookie.basic.board.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cookie.basic.util.Pager;

@Controller
@RequestMapping("/notice/**")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	/////////////////////////////////////////////////////////////
	
	//summernote 파일 삭제
	@PostMapping("summerFileDelete")
	public ModelAndView summerFileDelete(String file, HttpSession session) throws Exception {
		boolean check = boardNoticeService.summerFileDelete(file, session);
		String result = "Delete Fail";
		
		if(check) {
			result = "Delete Success";
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("common/common_ajaxResult");
		mv.addObject("result", result);
		
		return mv;
	}
	
	//summernote 파일 추가
	@PostMapping("summerFile")
	public ModelAndView summerFile(MultipartFile file, HttpSession session) throws Exception {
		//System.out.println(file.getOriginalFilename());
		String fileName = boardNoticeService.summerFile(file, session);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/common_ajaxResult");
		mv.addObject("result", fileName);
		
		return mv;
	}
	
	//글 작성 폼
	@GetMapping("noticeWrite")
	public String noticeWrite(NoticeVO noticeVO) throws Exception {
		return "board/boardWrite";
	}
	
	//글 하나 조회
	@GetMapping("noticeSelect")
	public ModelAndView noticeSelect(NoticeVO noticeVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		noticeVO = noticeService.noticeSelect(noticeVO);
		
		mv.addObject("select", noticeVO);
		mv.addObject("boardName", "공지사항");
		mv.setViewName("board/boardSelect");
		
		return mv;
	}
	
	//리스트
	@GetMapping("noticeList")
	public ModelAndView noticeList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<NoticeVO> list = noticeService.noticeList(pager);
		
		mv.addObject("list", list);
		mv.addObject("pager", pager);
		mv.addObject("boardName", "공지사항");
		mv.setViewName("board/boardList");
		
		return mv;
	}
	
}
