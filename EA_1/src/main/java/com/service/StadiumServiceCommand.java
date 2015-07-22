package com.service;




import java.util.List;



import org.springframework.stereotype.Service;








import com.dao.Stadium;
import com.dto.ApplyTeamDTO;
import com.dto.StadiumDTO;

@Service
public class StadiumServiceCommand implements StadiumService  {

	
	Stadium dao;
	
	public StadiumServiceCommand() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void setDao(Stadium dao) {
		this.dao = dao;
	}
	
	
	
	/* (non-Javadoc)
	 * @see com.service.StadiumService#getList()
	 */
	@Override
	public List<StadiumDTO> getList(){
			return dao.getList();
	}
	
	@Override
	public void insertApplyTeam(ApplyTeamDTO dto) {
		
		dao.insertApplyTeam(dto);
		
	}

	@Override
	public void insertStadium(StadiumDTO dto) {
		// TODO Auto-generated method stub
		
		dao.insertStadium(dto);
	}

	@Override
	public String getAddr(int userNo) {
		
		return dao.getAddr(userNo);
	}


	

	
	
}
