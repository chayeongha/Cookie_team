package com.cookie.basic.board.qna;

import java.util.Enumeration;
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

import com.cookie.basic.member.MemberVO;
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
//	@GetMapping("captcha")
//	public String Captcha() {
//		return "captcha";
//	}
//	
	//captcha 이미지 가져오는 메서드
	@GetMapping("captchaImg")
	@ResponseBody
	public void captchaImg(HttpServletRequest req, HttpServletResponse res) throws Exception {
		new CaptchaUtil().getImgCaptCha(req, res);
	}
	
	//전달받은 문자열로 음성 가져오는 메서드
	@GetMapping("captchaAudio")
	@ResponseBody
	public void captchaAudio(HttpServletRequest req, HttpServletResponse res) throws Exception {
		Enumeration<String> e =req.getSession().getAttributeNames();
		while (e.hasMoreElements()) {
			String string = (String) e.nextElement();
			System.out.println(string);
			
		}
		Captcha captcha = (Captcha)req.getSession().getAttribute(Captcha.NAME);
		String getAnswer = captcha.getAnswer();
		System.out.println(getAnswer);
		new CaptchaUtil().getAudioCaptCha(req, res, getAnswer);
	}
	
	//사용자가 입력한 보안문자 체크하는 메서드
	@PostMapping("chkAnswer")
	@ResponseBody
	public String chkAnswer(HttpServletRequest req, HttpServletResponse res) {
		String result = "";
		Captcha captcha = (Captcha)req.getSession().getAttribute(Captcha.NAME);
		String answer = req.getParameter("answer");
		System.out.println(answer);
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
	//답변 삭제
	@GetMapping("qnaAnswerDelete")
	public ModelAndView qnaAnswerDelete(QnaVO qnaVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		qnaVO.setAcheck(0);
		int result = qnaService.qnaAnswerDelete(qnaVO);
		
		String msg = "Delete Fail";
		
		if(result>0) {
			msg = "Delete Success";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("path", "qnaList");
		mv.setViewName("common/result");
		
		return mv;
	}
	
	//답변 수정 폼
	@GetMapping("qnaAnswerUpdate")
	public void qnaAnswerUpdate(QnaVO qnaVO, Model model) throws Exception {

		qnaVO = qnaService.qnaSelect(qnaVO);
		model.addAttribute("question", qnaVO);
		
		qnaVO.setRef(qnaVO.getNum());
		qnaVO.setStep(1);
		QnaVO qnaVO2 = qnaService.qnaRefSelect(qnaVO);
		model.addAttribute("answer", qnaVO2);
	}
	
	//답변 수정
	@ResponseBody
	@PostMapping("qnaAnswerUpdate")
	public int qnaAnswerUpdate(QnaVO qnaVO) throws Exception {
		
		int result = qnaService.qnaUpdate(qnaVO);
		
		return result;
	}
	
	//답변 폼
	@GetMapping("qnaAnswer")
	public void qnaAnswer(QnaVO qnaVO, Model model, HttpSession session) throws Exception {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		qnaVO = qnaService.qnaSelect(qnaVO);
		
		model.addAttribute("answer", qnaVO);
		model.addAttribute("member", memberVO);
	}
	
	//답변 등록
	@ResponseBody
	@PostMapping("qnaAnswer")
	public int qnaAnswer(QnaVO qnaVO) throws Exception{
		
		int result = qnaService.qnaAnswer(qnaVO);
		
		return result;
	}
	
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
	public void qnaUpdate(HttpSession session, QnaVO qnaVO, Model model) throws Exception {
		
		qnaVO = qnaService.qnaSelect(qnaVO);
		
		model.addAttribute("update", qnaVO);
	}
	
	//글 수정
	@ResponseBody
	@PostMapping("qnaUpdate")
	public int qna(QnaVO qnaVO) throws Exception{
		
		int result = qnaService.qnaUpdate(qnaVO);
		
		return result;
	}
	
	//글 작성 폼
	@GetMapping("qnaWrite")
	public void qnaWrite(HttpSession session, Model model) throws Exception {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		model.addAttribute("writer", memberVO.getNickname());
	}
	
	//글 등록
	@ResponseBody
	@PostMapping("qnaWrite")
	public int qnaWrite(QnaVO qnaVO) throws Exception {

		int result = qnaService.qnaWrite(qnaVO);
		
		return result;
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
	public void qnaList(Model model, Pager pager, HttpSession session) throws Exception {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		List<QnaVO> list = qnaService.qnaList(pager);

		model.addAttribute("lists", list);
		model.addAttribute("pager", pager);
		model.addAttribute("member", memberVO);
	}
	
}
