package com.cookie.basic.board.qna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.cookie.basic.util.CaptchaUtil;
import com.cookie.basic.util.Pager;
import nl.captcha.Captcha;

@Controller
@RequestMapping("/qna/**")
public class QnaController {

	@Autowired
	private QnaService qnaService;
	/////////////////////////////////////////////////////////////
	//페이지 매핑
	@GetMapping("captcha")
	public String Captcha() {
		return "captcha";
	}
	
	//captcha 이미지 가져오는 메서드
	@GetMapping("captchaImg")
	@ResponseBody
	public void captchaImg(HttpServletRequest req, HttpServletResponse res) throws Exception {
		new CaptchaUtil().getImgCaptcha(req, res);
	}
	
	//전달받은 문자열로 음성 가져오는 메서드
	@GetMapping("captchaAudio")
	@ResponseBody
	public void captchaAudio(HttpServletRequest req, HttpServletResponse res) throws Exception {
		Captcha captcha = (Captcha)req.getSession().getAttribute(Captcha.NAME);
		String getAnswer = captcha.getAnswer();
		new CaptchaUtil().getAudioCaptcha(req, res, getAnswer);
	}
	
	//사용자가 입력한 보안문자 체크하는 메서드
	@PostMapping("chkAnswer")
	@ResponseBody
	public String chkAnswer(HttpServletRequest req, HttpServletResponse res) {
		String result = "";
		Captcha captcha = (Captcha)req.getSession().getAttribute(Captcha.NAME);
		String answer = req.getParameter("answer");
		
		if(answer != null && !"".equals(answer)) {
			if(captcha.isCorrect(answer)) {
				req.getSession().removeAttribute(Captcha.NAME);
				result = "200";
			}else {
				result = "300";
			}
		}
		return result;
	}
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
	public void qnaWrite() throws Exception {
		
	}
	
	//글 등록
	@PostMapping("qnaWrite")
	public ModelAndView qnaWrite(QnaVO qnaVO) throws Exception {
		ModelAndView mv = new ModelAndView();

		int result = qnaService.qnaWrite(qnaVO);
		String msg = "Write Fail";
		 
		if(result>0) {
			msg = "Write Success";
		}
		mv.setViewName("common/result");
		mv.addObject("msg", msg);
		mv.addObject("path", "./qnaList");
		
		return mv;
	}
	
	//글 하나 조회
	@GetMapping("qnaSelect")
	public ModelAndView qnaSelect(QnaVO qnaVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		qnaVO = qnaService.qnaSelect(qnaVO);
		
		if(qnaVO != null) {
			mv.addObject("select", qnaVO);
			mv.setViewName("qna/qnaList");
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
