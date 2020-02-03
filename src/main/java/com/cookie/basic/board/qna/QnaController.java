package com.cookie.basic.board.qna;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cookie.basic.util.Pager;

@Controller
@RequestMapping("/qna/**")
public class QnaController {

	@Autowired
	private QnaService qnaService;
	/////////////////////////////////////////////////////////////
	//글 삭제
	@GetMapping("qnaDelete")
	public ModelAndView qnaDelete(QnaVO qnaVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = qnaService.qnaDelete(qnaVO);
		
		String msg = "Delete Fail";
		
		if(result>0) {
			msg = "Delete Success";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("path", "qnaList");
		mv.setViewName("common/result");
		
		return mv;
	}
	
	//글 수정 폼
	@GetMapping("qnaUpdate")
	public ModelAndView qnaUpdate(QnaVO qnaVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		qnaVO = qnaService.qnaSelect(qnaVO);
		
		mv.addObject("update", qnaVO);
		mv.addObject("boardName", "문의사항");
		mv.setViewName("board/boardUpdate");
		
		return mv;
	}
	
	//글 수정
	@PostMapping("qnaUpdate")
	public ModelAndView qna(@Valid QnaVO qnaVO, BindingResult bindingResult, MultipartFile[] files, int[] fnums) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("fnum 들어왔냡");
		//System.out.println(qnaVO.getNum());
		
		if(bindingResult.hasErrors()) {//에러가 생겼을 때 다시 form으로 돌아가게끔
			qnaVO = qnaService.qnaSelect(qnaVO);
			mv.addObject("update", qnaVO);
			mv.addObject("boardName", "문의사항");
			mv.setViewName("board/boardUpdate");// '/WEB-INF/views/'와 '.jsp'를 붙여줌
		}else {
			int result = qnaService.qnaUpdate(qnaVO, files, fnums);
			String msg = "Update Fail";
			
			if(result>0) {
				msg = "Update Success";
			}
			mv.setViewName("common/result");
			mv.addObject("msg", msg);
			mv.addObject("path", "./qnaSelect?num="+qnaVO.getNum());
		}
		
		return mv;
	}
	
	//글 작성 폼
	@GetMapping("qnaWrite")
	public String qnaWrite(QnaVO qnaVO) throws Exception {
		return "board/boardWrite";
	}
	
	//글 등록
	@PostMapping("qnaWrite")
	public ModelAndView qnaWrite(@Valid QnaVO qnaVO, BindingResult bindingResult, MultipartFile[] files) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		if(bindingResult.hasErrors()) {
			mv.setViewName("board/boardWrite");
		}else {
			System.out.println(files.length);
			int result = qnaService.qnaWrite(qnaVO, files);
			String msg = "Write Fail";
			 
			if(result>0) {
				msg = "Write Success";
			}
			mv.setViewName("common/result");
			mv.addObject("msg", msg);
			mv.addObject("path", "./qnaList");
		}
		
		return mv;
	}
	
	//글 하나 조회
	@GetMapping("qnaSelect")
	public ModelAndView qnaSelect(QnaVO qnaVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		qnaVO = qnaService.qnaSelect(qnaVO);
		//System.out.println(qnaVO.getqnaFilesVO().get(0).getFnum());
		
//		System.out.println(qnaVO.getNum());
//		System.out.println(qnaVO.getNext());
//		System.out.println(qnaVO.getNextT());
//		System.out.println(qnaVO.getPrev());
//		System.out.println(qnaVO.getPrevT());
		
		if(qnaVO != null) {
			mv.addObject("select", qnaVO);
			mv.addObject("boardName", "문의사항");
			mv.setViewName("board/boardSelect");
		}
		
		return mv;
	}
	
	//리스트
	@GetMapping("qnaList")
	public void qnaList(Model model, Pager pager) throws Exception {
		
		List<QnaVO> list = qnaService.qnaList(pager);
		
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		
	}
	
}
