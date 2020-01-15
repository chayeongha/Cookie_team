package com.cookie.basic.member;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

import com.cookie.basic.util.FilePathGenerator;
import com.cookie.basic.util.FileSaver;

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
			bindingResult.rejectValue("id", "memberVO.id.idCheck");
		}
		
		return check;
		
	}
	
	
	//회원가입
	public int memberJoin(MemberVO memberVO, MultipartFile files)throws Exception{
	
		File file = filePathGenerator.getUseClassPathResource("upload");
		String fileName=fileSaver.save(file, files);
		
		System.out.println(fileName);

		int result = memberMapper.memberJoin(memberVO);
		
		MemberFilesVO memberFilesVO = new MemberFilesVO();
		memberFilesVO.setId(memberVO.getId());
		memberFilesVO.setFname(fileName);
		memberFilesVO.setOname(files.getOriginalFilename());
		
		result =memberFilesMapper.memberFilesInsert(memberFilesVO);
		
		return result;
	
	}
	
	//로그인
	public MemberVO memberLogin(MemberVO memberVO)throws Exception{
		
		return memberMapper.memberLogin(memberVO);
	}
	
	//수정
	public int memberUpdate(MemberVO memberVO)throws Exception{
		
//		File file = filePathGenerator.getUseClassPathResource("upload");
//		String fileName=fileSaver.save(file, files);
//		
//		System.out.println(fileName);

		//int result = memberMapper.memberUpdate(memberVO);
		
//		MemberFilesVO memberFilesVO = new MemberFilesVO();
//		
//		memberFilesVO.setId(memberVO.getId());
//		memberFilesVO.setFname(fileName);
//		memberFilesVO.setOname(files.getOriginalFilename());
//		
//		result =memberFilesMapper.memberFilesInsert(memberFilesVO);
//		
		return  memberMapper.memberUpdate(memberVO);
		
	}
}
