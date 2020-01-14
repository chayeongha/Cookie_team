package com.cookie.basic.member;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class MemberVO {
		
	@NotEmpty
	private String id;
	
	@NotEmpty
	@Size(min =8, max=13)
	private String pw;
	
	private String name;
	private String nickname;
	private String phone;
	private Integer grade;
	
	private MemberFilesVO memberFilesVO;

}
