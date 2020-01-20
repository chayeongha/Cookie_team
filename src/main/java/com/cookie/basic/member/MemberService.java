package com.cookie.basic.member;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

import com.cookie.basic.util.FilePathGenerator;
import com.cookie.basic.util.FileSaver;
import com.cookie.basic.util.Pager;

@Service
public class MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private MemberFilesMapper memberFilesMapper;
	
	@Autowired
	private FilePathGenerator filePathGenerator;
	
	@Autowired 
	private FileSaver fileSaver;
	
	//검증
	public boolean memberJoinValidate(MemberVO memberVO, BindingResult bindingResult)throws Exception{
		boolean check= false;//ture면 에러
		
		//검증결과
		if(bindingResult.hasErrors()) {
			check=true;
		}
		
		//비번이 일치하는지 검증
		if(!memberVO.getPw().equals(memberVO.getPw2())) {
			check=true;
			//form의 path명, 출력하고싶은 properties의키 
			bindingResult.rejectValue("pw2", "memberVO.pw.notEqual");
		}
		
		//id가 중복인지 검증
		memberVO = memberMapper.memberIdCheck(memberVO);
		
		if(memberVO != null) {
			check= true;
			bindingResult.rejectValue("memId", "memberVO.memId.idCheck");
		}
		
		return check;
		
	}
	
	//회원가입
	public int memberJoin(MemberVO memberVO, MultipartFile files)throws Exception{
	
		File file = filePathGenerator.getUseClassPathResource("upload");
		String fileName=fileSaver.save(file, files);
		
		System.out.println(fileName);

		int result = memberMapper.memberJoin(memberVO);
		
		boolean check= false;
		
		if(files.getSize()>0) {
		 
			check=true;			
		}
		
	
		if(check) {
			
			MemberFilesVO memberFilesVO2 = new MemberFilesVO();
			memberFilesVO2.setMemNum(memberVO.getMemNum());
			memberFilesVO2.setFname(fileName);
			memberFilesVO2.setOname(files.getOriginalFilename());
			
			result =memberFilesMapper.memberFilesInsert(memberFilesVO2);
			
		}
		
		return result;
	
	}
	
	//네이버 회원가입
	public int naverJoin(MemberVO memberVO) throws Exception{
		return memberMapper.naverJoin(memberVO);
	}
	
	//네이버(로그인)
	public MemberVO memberNaver(MemberVO memberVO) throws Exception{
		return memberMapper.memberNaver(memberVO);
	}
	
	//카카오 회원가입
	public int kakaoJoin(MemberVO memberVO) throws Exception{
		return memberMapper.kakaoJoin(memberVO);
	}
		
	//카카오(로그인)
	public MemberVO memberKakao(MemberVO memberVO) throws Exception{
		return memberMapper.memberKakao(memberVO);
	}
	
	
	//로그인
	public MemberVO memberLogin(MemberVO memberVO)throws Exception{
		
		return memberMapper.memberLogin(memberVO);
	}
	
	//수정
	public int memberUpdate(MemberVO memberVO,MultipartFile files)throws Exception{
		
		File file = filePathGenerator.getUseClassPathResource("upload");
		
		String fileName=fileSaver.save(file, files);		
		
		System.out.println(fileName);

		int result = memberMapper.memberUpdate(memberVO);
		
		System.out.println(memberVO.getMemNum());
		
		MemberFilesVO memberFilesVO = new MemberFilesVO();
		
		
		//이미지를 안넣고 회원가입을 했을때 
		//나중에 이미지를 넣으면 fnum없어서 null오류가 뜨기때문에 
		//fnum이 없을 때 파일을 인서트하는 조건을 줌.
		
		if(memberVO.getFnum() ==null) {
			memberFilesVO.setMemNum(memberVO.getMemNum());
			memberFilesVO.setFname(fileName);
			memberFilesVO.setOname(files.getOriginalFilename());
			
			result=memberFilesMapper.memberFilesInsert(memberFilesVO);
		}else {
		//fnum이 있을때 파일을 업데이트하는 조건을 줌.
		memberFilesVO.setMemNum(memberVO.getMemNum());
		memberFilesVO.setFnum(memberVO.getFnum());
		memberFilesVO.setFname(fileName);
		memberFilesVO.setOname(files.getOriginalFilename());
		
		result =memberFilesMapper.memberFilesUpdate(memberFilesVO);
		
		}
		return  result;
		
	}
	
	//회원탈퇴
	public int memberDelete(MemberVO memberVO)throws Exception{
		
		return memberMapper.memberDelete(memberVO);
	}
	
	//회원리스트
	public List<MemberVO> memberList(Pager pager)throws Exception{
		
		pager.makeRow();
		pager.makePage(memberMapper.listCount(pager));
	
		 return memberMapper.pmemberList(pager);
	}
	
	
}
