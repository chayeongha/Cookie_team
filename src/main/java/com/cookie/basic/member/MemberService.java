package com.cookie.basic.member;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
	
}
