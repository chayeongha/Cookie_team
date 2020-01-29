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
	
	//@NotEmpty(message = "\"아이디\" 항목이 필요합니다.")
	@NotEmpty
	private String memId;
	@Size(min=5, max=14, message = "비밀번호는 최소6글자이상 최대14글자이하입니다.")
	private String pw;
	//@NotEmpty
	@NotEmpty(message = "\"비밀번호 확인\" 항목이 필요합니다.")
	private String pwCheck;
	@NotEmpty(message = "\"이름\" 항목이 필요합니다.")
	private String name;
	@NotEmpty(message = "\"닉네임\" 항목이 필요합니다.")
	private String nickname;
	private String phone;
	private Integer grade;
	private Integer kind;

	private MemberFilesVO memberFilesVO;
	
	private Integer fnum;
	private String fname;
	



}