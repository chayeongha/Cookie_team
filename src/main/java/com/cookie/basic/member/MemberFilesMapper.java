package com.cookie.basic.member;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MemberFilesMapper {
	
	public int memberFilesInsert(MemberFilesVO memberFilesVO)throws Exception;
	
	public MemberFilesVO memberFilesSelect(MemberFilesVO memberFilesVO)throws Exception;

	public  int memberFilesUpdate(MemberFilesVO memberFilesVO)throws Exception;
}
