package com.cookie.basic.board.notice;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@ResponseBody
	@PostMapping("summerFileDelete")
	public ModelAndView summerFileDelete(String fileName) throws Exception {
		boolean check = noticeService.summerFileDelete(fileName);
		String result = "Delete Fail";
		
		if(check) {
			result = "Delete Success";
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", result);
		
		return mv;
	}
	
	//summernote 파일 추가
	@ResponseBody
	@PostMapping("summerFile")
	public ModelAndView summerFile(MultipartFile file) throws Exception {
		//System.out.println(file.getOriginalFilename());
		
		String fileName = noticeService.summerFile(file);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", fileName);
		//System.out.println("fileName:"+fileName);
		
		return mv;
	}
	/////////////////////////////////////////////////////////////
	//파일 다운
	@GetMapping("fileDown")
	public ModelAndView noticeFileDown(NoticeFilesVO noticeFilesVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		noticeFilesVO = noticeService.noticeFileSelect(noticeFilesVO);
		
		if(noticeFilesVO != null) {
			mv.addObject("noticeFiles", noticeFilesVO);
			mv.addObject("path", "notice");
			mv.setViewName("fileDown");
		}else {
			mv.addObject("msg", "없써!!!!");
			mv.addObject("path", "./");
			mv.setViewName("common/result");
		}
		
		return mv;
	}
	//이전글, 다음글
	@ResponseBody
	@PostMapping("noticeIndex")
	public NoticeVO noticeIndex(NoticeVO noticeVO) throws Exception {
		noticeVO = noticeService.noticeIndex(noticeVO);
		
		System.out.println(noticeVO.getNext());
		System.out.println(noticeVO.getNextT());
		System.out.println(noticeVO.getPrev());
		System.out.println(noticeVO.getPrevT());
		
		return noticeVO;
	}
	/////////////////////////////////////////////////////////////
	//글 작성 폼
	@GetMapping("noticeWrite")
	public String noticeWrite(NoticeVO noticeVO) throws Exception {
		return "board/boardWrite";
	}
	
	//글 등록
	@PostMapping("noticeWrite")
	public ModelAndView noticeWrite(@Valid NoticeVO noticeVO, BindingResult bindingResult, MultipartFile[] files) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if(bindingResult.hasErrors()) {
			mv.setViewName("board/boardWrite");
		}else {
			int result = noticeService.noticeWrite(noticeVO, files);
			String msg = "Write Fail";
			
			if(result>0) {
				msg = "Write Success";
			}
			mv.setViewName("common/result");
			mv.addObject("msg", msg);
			mv.addObject("path", "./noticeList");
		}
		
		return mv;
	}
	
	//글 하나 조회
	@GetMapping("noticeSelect")
	public ModelAndView noticeSelect(NoticeVO noticeVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		noticeVO = noticeService.noticeSelect(noticeVO);
		//System.out.println(noticeVO.getNoticeFilesVO().get(0).getFnum());
		
		System.out.println(noticeVO.getNum());
		System.out.println(noticeVO.getNext());
		System.out.println(noticeVO.getNextT());
		System.out.println(noticeVO.getPrev());
		System.out.println(noticeVO.getPrevT());
		
		
		if(noticeVO != null) {
			mv.addObject("select", noticeVO);
			mv.addObject("boardName", "공지사항");
			mv.setViewName("board/boardSelect");
		}
		
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
