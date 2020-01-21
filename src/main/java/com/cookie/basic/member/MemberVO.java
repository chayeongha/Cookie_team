package com.cookie.basic.member;

import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class MemberVO {


		
	private Integer memNum;
	
	@NotEmpty(message = "비우지마시오!!")
	private String memId;
	
	@NotEmpty
	@Size(min = 4, max = 12)
	private String pw;

	private String pw2;
	
	private String name;
	private String nickname;
	private String phone;
	private Integer grade;
	private Integer kind;

	//셀렉트조인 회원가입종류
	private String jkind;
	
	private MemberFilesVO memberFilesVO;
	
	private Integer fnum;
	private String fname;


}