package com.cookie.basic.member;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.core.Config;
import javax.validation.Valid;
import javax.websocket.Session;

import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.cookie.basic.store.StoreVO;

import com.cookie.basic.util.Pager;

import net.bytebuddy.asm.Advice.Return;

@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("memberIndex")
	public void memberIndex()throws Exception{
		
	}
	
	//가입 선택 
	@GetMapping("selectJoin")
	public void selectJoin(MemberVO memberVO)throws Exception{	
		
	}
	
	//getMemberVO
	@ModelAttribute
	public MemberVO getMemberVO()throws Exception{
		return new MemberVO();	
	}

	//회원가입
	@GetMapping("memberJoin")
	public ModelAndView memberJoin(Pager pager)throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO= new MemberVO();
		//pager있는 그레이드를 vo안에 셋해줌.
		memberVO.setGrade(pager.getGrade());
		mv.addObject("memberVO", memberVO);
		mv.setViewName("member/memberJoin");
		return mv;
	}
	
	@PostMapping("memberJoin")							
	public ModelAndView memberJoin(@Valid MemberVO memberVO,BindingResult bindingResult, MultipartFile files)throws Exception {
		ModelAndView mv= new ModelAndView();
		//System.out.println(memberVO.getGrade());잘나옴~~
		
		if(memberService.memberJoinValidate(memberVO, bindingResult)) {
			mv.setViewName("member/memberJoin");
		}else {
			
			int result= memberService.memberJoin(memberVO, files);
			String msg = "회원가입 실패";
			String path ="./memberIndex";
			
			if(result >0) {
			msg="회원가입 성공";
			}
			
			mv.addObject("path", path);
			mv.addObject("msg", msg);	
			mv.setViewName("common/result");	
		}
		return mv;
	}
	
	//프론트아이디 중복체크
	@GetMapping("idCheck")
	public Model idCheck(MemberVO memberVO, Model model)throws Exception {
			if(memberVO.getNickname()!="") {
				memberVO= memberService.idCheck(memberVO);
			}
			int result =0;
			String msg= "중복된 아이디입니다.";
			if(memberVO == null) {
				msg="사용가능한 아이디입니다.";
				result =1;
			}
			model.addAttribute("result", result);
			model.addAttribute("msg", msg);
			model.addAttribute("member", memberVO);
			
			return model;
	}
	
	//프론트닉네임 중복체크
	@GetMapping("nickCheck")
	public Model nickCheck(MemberVO memberVO, Model model)throws Exception {
			if(memberVO.getNickname()!="") {
				memberVO= memberService.nickCheck(memberVO);
			}
			int result =0;
			String msg= "중복된 닉네임입니다.";
			if(memberVO == null) {
				msg="사용가능한 닉네임입니다.";
				result =1;
			}
			model.addAttribute("result", result);
			model.addAttribute("msg", msg);
			model.addAttribute("member", memberVO);
			
			return model;
	}
	
	//프론트이메일 중복체크
	@GetMapping("emailCheck")
	public Model emailCheck(MemberVO memberVO, Model model)throws Exception{
		//""이아닐때 서비스에서 이메일체크를 실행한다.
		if(memberVO.getEmail()!="") {
			memberVO= memberService.emailCheck(memberVO);
		}
		int result = 0;
		String msg= "중복된 이메일입니다.";
		if(memberVO == null) {
			msg="사용가능한 이메일입니다.";
			result = 1;
		}
		model.addAttribute("result", result);
		model.addAttribute("msg", msg);
		model.addAttribute("member",memberVO);
	
		return model;
	}
	
	//프론트 연락처중복체체크
	@ResponseBody//★@ResponseBody을 이용하면 자바 객체를 HTTP 응답 body로 전송할 수 있다.
	@GetMapping("phoneCheck")
	public String phoneCheck(MemberVO memberVO)throws Exception{
		memberVO= memberService.phoneCheck(memberVO);
		
		String msg= "이미 사용하고 있는 번호입니다.";
		if(memberVO == null) {
			msg="사용가능한 번호입니다.";
		}
		
		return msg;
	}
	
	//로그인
	@GetMapping("memberLogin")
	public void memberLogin()throws Exception {
		
	}
	
	@PostMapping("memberLogin")
	public ModelAndView memberLogin(MemberVO memberVO, HttpSession session)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		memberVO=memberService.memberLogin(memberVO);
		
		String msg="로그인 실패!!";
		String path="./memberLogin";
		
		if(memberVO != null) {
			msg="로그인 성공!!";
			path="../";
			session.setAttribute("member", memberVO);

		}
		
		mv.addObject("msg", msg);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		
		return mv;
	}
	//로그아웃
	@GetMapping("memberLogout")
	public ModelAndView memberLogout(HttpSession session)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		session.invalidate();
		
		String msg= "로그아웃";
		String path="../";
		
		mv.addObject("msg", msg);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		
		return mv;
	}
	
	//네이버회원가입
	@GetMapping("memberNaver")
	public String memberNaver(String name) throws Exception{
		return "member/memberNaver";
	}
	
	@PostMapping("memberNaver")
	public void memberNaver(HttpSession session, String email, String nickname,String name) throws Exception{
		
		MemberVO memberVO = new MemberVO();
		memberVO.setMemId(email);
		memberVO = memberService.memberNaver(memberVO);
		
		if(name==null) {
			name=nickname;
		}
		if(memberVO == null) {
			MemberVO memberVO2 = new MemberVO();
			memberVO2.setMemId(email);
			memberVO2.setName(name);
			memberVO2.setNickname(nickname);
			int result= memberService.naverJoin(memberVO2);
			session.setAttribute("member", memberVO2);

		}else {
			session.setAttribute("member", memberVO);
		}
		
	}
	
	//카카오회원가입
	@ResponseBody
	@PostMapping("memberKakao")
	public void memberKakao(HttpSession session,String nickname,String email) throws Exception{
		
		MemberVO memberVO = new MemberVO();
		memberVO.setMemId(email);
		memberVO = memberService.memberKakao(memberVO);
		
		if(memberVO == null) {
			System.out.println("hi");
			MemberVO memberVO2 = new MemberVO();
			memberVO2.setMemId(email);
			memberVO2.setName(nickname);
			memberVO2.setNickname(nickname);
			int result= memberService.kakaoJoin(memberVO2);
			session.setAttribute("member", memberVO2);
			System.out.println(result);
		}else {
			session.setAttribute("member", memberVO);
		}
		
	}
	
	//멤버마이페이지
	@GetMapping("memberMypage")
	public void memberMypage() throws Exception{
		
	}
	
	//멤버업데이트
	@GetMapping("memberUpdate")
	public void memberUpdate(HttpSession session)throws Exception{	
		
	}
	
	@PostMapping("memberUpdate")
	public ModelAndView memberUpdate(MemberVO memberVO, MultipartFile files, HttpSession session)throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		int result = memberService.memberUpdate(memberVO,files);
		
		String msg="실패";
		
		if(result>0) {
			memberVO=memberService.memberLogin(memberVO);
			session.setAttribute("member", memberVO);
			msg="성공";
		}
		mv.addObject("msg", msg);
		mv.addObject("path","./memberMypage");
		mv.setViewName("common/result");
			
		return mv;
	}
	
	//마이페이지에서 회원 스스로 탈퇴
	@GetMapping("memberDelete")
	public ModelAndView memberDelete(MemberVO memberVO, HttpSession session)throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		int result =memberService.memberDelete(memberVO);
		
		String msg = "0";
		if (result>0) {
			msg = "1";
			session.invalidate();
		}
		mv.addObject("msg", msg);
		mv.setViewName("common/ajax_result");
		
		return mv;
		}
	
	//idSearch jsp
	@GetMapping("searchIdPw")
	public void searchIdPw()throws Exception{
		
	}
	
	//아이디찾기: 입력한 이름과 휴대폰번호가 같은지
	@PostMapping("idSearch")
	public String idSearch(MemberVO memberVO, String name, String phone)throws Exception{
		MemberVO memberVO2= new MemberVO(); 
		//System.out.println(name);잘나옴.
		//System.out.println(phone);잘나옴.
		memberVO2.setName(name);
		memberVO2.setPhone(phone);
		MemberVO memberVO3= new MemberVO();
		memberVO3=memberService.idSearch(memberVO2);
		
		String msg="입력하신정보가 회원정보와 일치하지않습니다.";
		//int resultId =0;
		if(memberVO3 != null) {
			msg="입력하신 정보가 회원정보와 일치합니다.";
			//resultId =1;
		}
		System.out.println(msg);//아주잘나옴~
		
		return msg;
	}
	
	//인증번호보내기
	@ResponseBody 
	@RequestMapping("sendSms")
	 public int sendSms(String receiver ,HttpSession session) { 
		
		// 6자리 인증 코드 생성 
		int rand = (int) (Math.random() * 899999) + 100000; 
		// 인증 코드를 세션에저장
		session.setAttribute("rand", rand);
		
		// 문자 보내기 
		String hostname = "api.bluehouselab.com"; 
		String url = "https://" + hostname + "/smscenter/v1.0/sendsms";
		
		CredentialsProvider credsProvider = new BasicCredentialsProvider(); 
		credsProvider.setCredentials(new AuthScope(hostname, 443, AuthScope.ANY_REALM), 

		// 청기와랩에 등록한 Application Id 와 API key 를 입력합니다. 
		new UsernamePasswordCredentials("ckdudgk123", "d7d1195443be11eabc5c0cc47a1fcfae")); 

		AuthCache authCache = new BasicAuthCache(); 
		authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme()); 
		
		HttpClientContext context = HttpClientContext.create(); context.setCredentialsProvider(credsProvider); 
		context.setAuthCache(authCache); 

		DefaultHttpClient client = new DefaultHttpClient(); 

		try { HttpPost httpPost = new HttpPost(url); httpPost.setHeader("Content-type", "application/json; charset=utf-8");

		 //문자에 대한 정보 
		String json = "{\"sender\":\"01022923481\",\"receivers\":[\"" + receiver + "\"],\"content\":\"쿠키입니다."+"인증번호 6자리를 입력해주세요 [인증번호 :"+rand+"]\"}"; 

		StringEntity se = new StringEntity(json, "UTF-8");
		 httpPost.setEntity(se); 

		HttpResponse httpResponse = client.execute(httpPost, context);

		 InputStream inputStream = httpResponse.getEntity().getContent(); 

		if (inputStream != null) { 
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
			String line = ""; 
			while ((line = bufferedReader.readLine()) != null) 
			
			inputStream.close(); 
				
			return rand;
		}else {
			return rand;
		}		
		} catch (Exception e) { 
				System.err.println("Error: " + e.getLocalizedMessage()); 
		} finally {
				client.getConnectionManager().shutdown();
		}
		return rand; 
	} 
	
	//입력한번호가 저장된 코드가 맞는지 확인
	@ResponseBody 
	@RequestMapping("smsCheck") 
	public String smsCheck(String code, HttpSession session) { 
		//세션에있는 보안문자를 불러옴.
		String saveCode =session.getAttribute("rand").toString();
		//System.out.println(saveCode);아주잘나옴~
		
		//세션에있는 보안문자와 내가입력한 보안문자가 같은지 확인
		if(code.equals(saveCode)){
			return "ok"; 
		}else {
			return "no"; 
		}
				
	}	
	
	
}