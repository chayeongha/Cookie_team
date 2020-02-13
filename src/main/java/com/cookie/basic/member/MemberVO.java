package com.cookie.basic.member;

import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.cookie.basic.store.StoreVO;

import lombok.Data;

@Data
public class MemberVO {
	
	private Integer memNum;
	
	@NotEmpty
	private String memId;
	@Size(min=5, max=14, message = "비밀번호는 최소6글자이상 최대14글자이하입니다.")
	private String pw;
	@NotEmpty
	private String pwCheck;
	@NotEmpty
	private String name;
	@NotEmpty
	private String nickname;
	@NotEmpty
	private String phone;
	@NotEmpty
	private String email;
	private Integer grade;
	private Integer kind;

	private MemberFilesVO memberFilesVO;
	
	private Integer fnum;
	private String fname;
	private Integer memPoint;
	private Integer memTotal;


}