package com.service;

import java.util.List;

import com.dto.MemberDTO;

public interface MemberService {

	public abstract int insert(MemberDTO dto);

	public abstract int check(String id);

	public abstract int login(MemberDTO dto);

	public abstract List<MemberDTO> getMemberList();

}