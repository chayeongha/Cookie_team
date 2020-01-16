package com.cookie.basic.member;

import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class MemberVO {
		
	@NotEmpty(message = "비우지마시오!!")
	private String id;
	
	@NotEmpty
	@Size(min = 4, max = 12)
	private String pw;
	@Transient
	private String pw2;
	
	private String name;
	private String nickname;
	private String phone;
	private Integer grade;
	
	private String kind;
	
	private MemberFilesVO memberFilesVO;
	
	private Integer fnum;

}
