package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.ApplyTeamDTO;
import com.dto.StadiumDTO;

@Repository
public class StadiumDAO implements Stadium {
	
	SqlSessionTemplate template;
	
	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
	}

	
	@Override
	public List<StadiumDTO>	getList(){
		 return  template.selectList("stadium.select");
		 
		 
	}


	@Override
	public void insertApplyTeam(ApplyTeamDTO dto) {
		// TODO Auto-generated method stub
		System.out.println(dto.getStadiumName());
		int n = template.insert("stadium.insert", dto);
		
	}


	@Override
	public void insertStadium(StadiumDTO dto) {
		int n = template.insert("stadium.insertStadium", dto);
		
	}


	@Override
	public String getAddr(int userNo) {
		
		return template.selectOne("stadium.getAddr", userNo);
		
		
	}



	


}
