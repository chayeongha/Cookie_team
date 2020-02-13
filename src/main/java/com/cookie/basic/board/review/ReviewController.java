package com.cookie.basic.board.review;

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
@RequestMapping("/review/**")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	/////////////////////////////////////////////////////////////
	
	//summernote 파일 삭제
	@ResponseBody
	@PostMapping("summerFileDelete")
	public ModelAndView summerFileDelete(String fileName) throws Exception {
		boolean check = reviewService.summerFileDelete(fileName);
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
		
		String fileName = reviewService.summerFile(file);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", fileName);
		//System.out.println("fileName:"+fileName);
		
		return mv;
	}
	/////////////////////////////////////////////////////////////
	//파일 다운
	@GetMapping("fileDown")
	public ModelAndView reviewFileDown(ReviewFilesVO reviewFilesVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		reviewFilesVO = reviewService.reviewFileSelect(reviewFilesVO);
		
		if(reviewFilesVO != null) {
			mv.addObject("reviewFiles", reviewFilesVO);
			mv.addObject("path", "review");
			mv.setViewName("fileDown");
		}else {
			mv.addObject("msg", "없써!!!!");
			mv.addObject("path", "./");
			mv.setViewName("common/result");
		}
		
		return mv;
	}
	/////////////////////////////////////////////////////////////
	//글 삭제
	@GetMapping("reviewDelete")
	public ModelAndView reviewDelete(ReviewVO reviewVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = reviewService.reviewDelete(reviewVO);
		
		String msg = "Delete Fail";
		
		if(result>0) {
			msg = "Delete Success";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("path", "reviewList");
		mv.setViewName("common/result");
		
		return mv;
	}
	
	//글 수정 폼
	@GetMapping("reviewUpdate")
	public ModelAndView reviewUpdate(ReviewVO reviewVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		reviewVO = reviewService.reviewSelect(reviewVO);
		
		mv.addObject("update", reviewVO);
		mv.addObject("boardName", "이용후기");
		mv.setViewName("board/boarddUpdate");
		
		return mv;
	}
	
	//글 수정
	@PostMapping("noticeUpdate")
	public ModelAndView noticeUpdate(@Valid ReviewVO reviewVO, BindingResult bindingResult,
										MultipartFile[] files, int[] fnums) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("fnum 들어왔냡");
		//System.out.println(noticeVO.getNum());
		
		if(bindingResult.hasErrors()) {//에러가 생겼을 때 다시 form으로 돌아가게끔
			reviewVO = reviewService.reviewSelect(reviewVO);
			mv.addObject("update", reviewVO);
			mv.addObject("boardName", "이용후기");
			mv.setViewName("board/boardUpdate");// '/WEB-INF/views/'와 '.jsp'를 붙여줌
		}else {
			int result = reviewService.reviewUpdate(reviewVO, files, fnums);
			String msg = "Update Fail";
			
			if(result>0) {
				msg = "Update Success";
			}
			mv.setViewName("common/result");
			mv.addObject("msg", msg);
			mv.addObject("path", "./reviewSelect?num="+reviewVO.getNum());
		}
		
		return mv;
	}
	
	//글 작성 폼
	@GetMapping("reviewWrite")
	public void reviewWrite(ReviewVO reviewVO) throws Exception {
		
	}
	
	//글 등록
	@PostMapping("reviewWrite")
	public ModelAndView reviewWrite(@Valid ReviewVO reviewVO, BindingResult bindingResult,
										MultipartFile[] files) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if(bindingResult.hasErrors()) {
			mv.setViewName("board/boardWrite");
		}else {
			System.out.println(files.length);
			int result = reviewService.reviewWrite(reviewVO, files);
			String msg = "Write Fail";
			 
			if(result>0) {
				msg = "Write Success";
			}
			mv.setViewName("common/result");
			mv.addObject("msg", msg);
			mv.addObject("path", "./reviewList");
		}
		
		return mv;
	}
	
	//글 하나 조회
	@GetMapping("reviewSelect")
	public ModelAndView noticeSelect(ReviewVO reviewVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		reviewVO = reviewService.reviewSelect(reviewVO);
		//System.out.println(noticeVO.getNoticeFilesVO().get(0).getFnum());
		
//		System.out.println(noticeVO.getNum());
//		System.out.println(noticeVO.getNext());
//		System.out.println(noticeVO.getNextT());
//		System.out.println(noticeVO.getPrev());
//		System.out.println(noticeVO.getPrevT());
		
		if(reviewVO != null) {
			mv.addObject("select", reviewVO);
			mv.addObject("boardName", "이용후기");
			mv.setViewName("board/boardSelect");
		}
		
		return mv;
	}
	
	//리스트
	@GetMapping("reviewList")
	public ModelAndView reviewList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<ReviewVO> list = reviewService.reviewList(pager);
		
		mv.addObject("list", list);
		mv.addObject("pager", pager);
		mv.addObject("boardName", "이용후기");
		mv.setViewName("board/boardList");
		
		return mv;
	}
	
}
