package com.dao;

import java.util.List;

import com.dto.ApplyTeamDTO;
import com.dto.StadiumDTO;

public interface Stadium {

	public abstract List<StadiumDTO> getList();
	
	public abstract void insertApplyTeam(ApplyTeamDTO dto);

	public abstract void insertStadium(StadiumDTO dto);
	
	public abstract String getAddr(int userNo);
	
}