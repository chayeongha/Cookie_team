package com.cookie.basic.member;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.print.DocFlavor.STRING;
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
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cookie.basic.pointList.PointListService;
import com.cookie.basic.pointList.PointListVO;
import com.cookie.basic.store.StoreVO;

import com.cookie.basic.util.Pager;

import net.bytebuddy.asm.Advice.Return;

@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	//이용약관
	@GetMapping("joinAgree")
	public void joinAgree()throws Exception{
		
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
			String path ="./memberLogin";
			
			if(result >0) {
			msg="회원가입 성공";
			}
			
			mv.addObject("path", path);
			mv.addObject("msg", msg);	
			mv.setViewName("common/result");	
		}
		return mv;
	}
	
	//아이디 중복체크
	@GetMapping("idCheck")
	public Model idCheck(MemberVO memberVO, Model model)throws Exception {
			if(memberVO.getMemId()!="") {
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
			System.out.println(result);
			return model;
	}
	
	//닉네임 중복체크
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
	
	//이메일 중복체크
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
	
	//연락처중복체체크
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
	
	//스토어미니리스트
	@GetMapping("storeMiniList")
	public ModelAndView sMiniList(StoreVO storeVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<StoreVO>ar = memberService.sMiniList(storeVO);
		
		mv.addObject("smList", ar);
		mv.setViewName("member/storeMiniList");
		
		return mv;
	}
	
	//멤버업데이트
	@GetMapping("memberUpdate")
	public void memberUpdate(HttpSession session )throws Exception{	
		
	}
	
	@PostMapping("memberUpdate")
	public ModelAndView memberUpdate(@Valid MemberVO memberVO,BindingResult bindingResult, MultipartFile files, HttpSession session )throws Exception {
	
		ModelAndView mv = new ModelAndView();
		
		//세션에 있는 닉네임가져오기
		MemberVO nick = new MemberVO();
		nick=(MemberVO) session.getAttribute("member");
		String getNick = nick.getNickname().toString();
		
		//이미있는 값이 세션에있는값이랑 같지않으면 검증 (같으면 검증안하게. 왜냐하면 변경을 안하고 다른정보만 수정할수도있기때문에.)
		if(!memberVO.getNickname().equals(getNick)) {
			MemberVO memberVO3 = new MemberVO();
			memberVO3= memberService.nickCheck(memberVO);
			if(memberVO3 != null) {
				bindingResult.rejectValue("nickname", "memberVO.nickname.nickCheck");
			}
			mv.setViewName("member/memberUpdate");
		}
		
		if(memberService.memberUpdateValidate(memberVO, bindingResult)) {
			mv.setViewName("member/memberUpdate");
		}else {
		
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
		}
		
		return mv;
	}
	
	//회원 정보수정-연락처중복체체크
	@ResponseBody//★@ResponseBody을 이용하면 자바 객체를 HTTP 응답 body로 전송할 수 있다.
	@GetMapping("phoneCheck2")
	public String phoneCheck2(MemberVO memberVO, String phone, HttpSession session)throws Exception{
		//이미 회원정보로 들어가있는 번호는 DB에 들어가있는 번호이기때문에 이미사용하고있는번호라고 뜸.
		//그래서 세션에있는 phone번호와 내가입력한 폰번호가 같으면 사용가능하도록 조건을 만들어줌.
		MemberVO memberVO2 = (MemberVO) session.getAttribute("member");
		
		String message= "이미 사용하고 있는 번호입니다.";
		
		String getPhone=memberVO2.getPhone().toString();
		//System.out.println("val:"+phone);
		//System.out.println("세션"+memberVO2.getPhone());
		
		Boolean check=false;
		
		if(phone.equals(getPhone)) {
			check= true;
			message="사용가능한 번호입니다.";
		}
		if(check == false) {
			memberVO= memberService.phoneCheck2(memberVO);
			if(memberVO == null ) {
				message="사용가능한 번호입니다.";
			}
		}
		return message;
	}
		
	//회원정보수정-닉네임중복체크
	@GetMapping("nickCheck2")
	public Model nickCheck2(MemberVO memberVO, Model model, String nickname , HttpSession session)throws Exception {
			
		MemberVO memberVO2 = new MemberVO();
		memberVO2=(MemberVO) session.getAttribute("member");
		String getNickname = memberVO2.getNickname().toString();
		//System.out.println(nickname);
		//System.out.println(getNickname);
		
		boolean check= false;
		
		int result =0;
		String msg= "중복된 닉네임입니다.";
		
		if(nickname.equals(getNickname)) {
			check=true;
			msg="사용가능한 닉네임입니다.";
			result =1;
		}
		if(check == false) {
			memberVO= memberService.nickCheck(memberVO);
			if(memberVO == null) {
				msg="사용가능한 닉네임입니다.";
				result =1;
			}
		}
		model.addAttribute("result", result);
		model.addAttribute("msg", msg);
		model.addAttribute("member", memberVO);
		
		return model;
	}
	
	//회원정보수정-이메일 중복체크
//	@GetMapping("emailCheck2")
//	public Model emailCheck2(MemberVO memberVO, Model model, String email, HttpSession session)throws Exception{
//		MemberVO memberVO2 = new MemberVO();
//		memberVO2=(MemberVO) session.getAttribute("member");
//		String getEmail = memberVO2.getEmail().toString();
//		
//		boolean check= false;
//		int result =0;
//		String msg= "중복된 이메일입니다.";
//		
//		if(email.equals(getEmail)) {
//			check=true;
//			msg="사용가능한 이메일입니다.";
//			result = 1;
//		}
//		if(check == false) {
//			memberVO= memberService.emailCheck(memberVO);
//			if(memberVO == null) {
//				msg="사용가능한 이메일입니다.";
//				result = 1;
//			}
//		}
//		model.addAttribute("result", result);
//		model.addAttribute("msg", msg);
//		model.addAttribute("member",memberVO);
//
//		return model;
//	}

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
	
	//아이디/비밀번호 찾기 페이지
	@GetMapping("searchIdPw")
	public void searchIdPw()throws Exception{
		
	}
	
	//아이디찾기: 입력한 이름과 휴대폰번호가 같은지
	@ResponseBody
	@PostMapping("idSearch")
	public String idSearch(MemberVO memberVO, String name, String phone , Model model)throws Exception{
		MemberVO memberVO2= new MemberVO(); 
		//System.out.println(name);잘나옴.
		//System.out.println(phone);잘나옴.
		memberVO2.setName(name);
		memberVO2.setPhone(phone);
		
		//이름과 휴대폰번호가 같은지
		MemberVO memberVO3= new MemberVO();
		memberVO3=memberService.idSearch(memberVO2);
		
		//찾은 아이디 출력
		MemberVO memberVO4 = new MemberVO();
		memberVO4.setPhone(phone);
		memberVO4.setName(name);
	
		String userId=memberService.findId(memberVO4);
		
		//int result =0;
		String msg="입력하신정보가 회원정보와 일치하지않습니다.";
		if(memberVO3 != null) {
			msg="입력하신 정보가 회원정보와 일치합니다.";
			//result= 1;
		}
		
		//System.out.println(msg);//아주잘나옴~
		//System.out.println(result);
		//System.out.println(userId);
		//model.addAttribute("result", result);
		//model.addAttribute("msg", msg);
		//model.addAttribute("userId", userId);
		
		return userId;
	}
	
	//인증번호보내기
	@ResponseBody 
	@RequestMapping("sendSms")
	 public int sendSms(String receiver ,HttpSession session){ 
		
		// 6자리 인증 코드 생성 
		int rand = (int) (Math.random() * 899999) + 100000; 
		
		// 인증 코드를 세션에저장
		session.setAttribute("rand", rand);
		
		//보내는 번호의 하이푼(특수문자)을 제거
		receiver = receiver.replaceAll("-", "");
		
		// 문자 보내기 
		String hostname = "api.bluehouselab.com"; 
		String url = "https://" + hostname + "/smscenter/v1.0/sendsms";
		
		CredentialsProvider credsProvider = new BasicCredentialsProvider(); 
		credsProvider.setCredentials(new AuthScope(hostname, 443, AuthScope.ANY_REALM), 

		// 청기와랩에 등록한 Application Id 와 API key 를 입력합니다. 
		new UsernamePasswordCredentials("hanna", "a1ceb7b647b611ea81cd0cc47a1fcfae")); 

		AuthCache authCache = new BasicAuthCache(); 
		authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme()); 
		
		HttpClientContext context = HttpClientContext.create(); context.setCredentialsProvider(credsProvider); 
		context.setAuthCache(authCache); 

		DefaultHttpClient client = new DefaultHttpClient(); 

		try { HttpPost httpPost = new HttpPost(url); httpPost.setHeader("Content-type", "application/json; charset=utf-8");

		 //문자에 대한 정보 
		String json = "{\"sender\":\"01071319540\",\"receivers\":[\"" + receiver + "\"],\"content\":\"쿠키입니다."+"인증번호 6자리를 입력해주세요 [인증번호 :"+rand+"]\"}"; 

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
	public String smsCheck(String code, HttpSession session, Integer SetTime){ 
		//세션에있는 보안문자를 불러옴.
		String saveCode =session.getAttribute("rand").toString();
		
		//유효시간을 파라미터로 받음.
		//세션에있는 보안문자와 내가 입력한 보안문자가 같은지 확인
		if(SetTime >0) {
			if(code.equals(saveCode)){
				return "ok"; 
			}else {
				return "no"; 
			}
		}else {
			//유효시간이 지나면 세션에있는 인증번호를 지우고 리턴을 no로보낸다.
			session.removeAttribute("rand");
			return "no";
		}
	}	
	//아이디찾기 끝
	
	//비밀번호찾기
	@Autowired
	private JavaMailSender mailSender;
	
	@ResponseBody
	@PostMapping("pwSearch")
	public String pwSearch(MemberVO memberVO,String memId, String email )throws Exception{
		memberVO.setMemId(memId);
		memberVO.setEmail(email);
		
		MemberVO memberVO2 = new MemberVO();
		
		memberVO2=memberService.pwSearch(memberVO);
		String msg="입력하신정보가 회원정보와 일치하지않습니다.";
		
		if(memberVO2 != null) {
			msg="입력하신 정보가 회원정보와 일치합니다.";
		}
		return msg;
	}
	
	//이메일로 임시비밀번호 보내기
	@RequestMapping(value ="/sendEmail" ,method=RequestMethod.GET)
	public ModelAndView sendEmail(@RequestParam Map<String, Object> paramMap, ModelMap model, MemberVO memberVO)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		String memId =(String)paramMap.get("memId");
		String email = (String)paramMap.get("email");
		
		//임시비밀번호 생성
		int pwLen =10; //임시번호 10자리 수 
		
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 
		'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 
		'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

		int idx=0;
		
		StringBuffer sb = new StringBuffer();

		//System.out.println("charSet.length :::: "+charSet.length);

		for (int i = 0; i < pwLen; i++) {

			idx = (int) (charSet.length * Math.random()); // 36 * 생성된 난수를 Int로 추출 (소숫점제거)
			//System.out.println("idx :::: "+idx);
	
			sb.append(charSet[idx]);
		}
		String pw =sb.toString();
		
		//난수를 이메일로 보내는 동시에 난수를 일치한 회원의 비밀번호로 업데이트시켜줌.
		memberVO.setMemId(memId);
		memberVO.setEmail(email);
		memberVO.setPw(pw);
	
		memberService.pwUpdate(memberVO);
		
		//System.out.println(memberVO.getMemId());
		//System.out.println(memberVO.getEmail());
		//System.out.println(memberVO.getPw());
		
		try {
            MimeMessage msg = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
             
            messageHelper.setSubject("쿠키에서발송:"+memId+"님의 임시비밀번호");
            messageHelper.setText("회원님의 임시 비밀번호는 "+pw+" 입니다.");
            messageHelper.setTo(email);
            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email));
            mailSender.send(msg);
        }catch(MessagingException e) {
            System.out.println("MessagingException");
            e.printStackTrace();
        }
		
		String message ="임시 비밀번호가 입력하신 메일로 발송되었습니다.";
		String path= "./searchIdPw";
		mv.addObject("message", message);
		mv.addObject("path", path);
		mv.setViewName("common/emailSuccess");
		return mv;
	}
	
	//pointList Page
	@Autowired
	private PointListService pointListService;
	
	@GetMapping("pointList")
	public ModelAndView pointList(PointListVO pointListVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<PointListVO> ar = pointListService.pointList(pointListVO);
		mv.addObject("pointListVO", pointListVO);
		mv.addObject("lists", ar);
		mv.setViewName("member/pointList");
		
		return mv;
		
	}
	
	
}
	

