package com.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;




import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dto.ApplyTeamDTO;
import com.dto.MemberDTO;
import com.dto.StadiumDTO;
import com.service.MemberService;
import com.service.StadiumService;

@Controller
public class StadiumController {
	
   StadiumService Stadiumservice;
 
   
   public void setStadiumservice(StadiumService stadiumservice) {
	Stadiumservice = stadiumservice;
	}
	
   
   @RequestMapping("/stadium") // http://~8090/07SpringMVC/xxx
   public String stadium(HttpSession session){
      List<StadiumDTO> list=Stadiumservice.getList();
      int num = (Integer)session.getAttribute("userNum");
      String userAddr = Stadiumservice.getAddr(num);
      session.setAttribute("userAddr", userAddr);
      System.out.println(userAddr);
      session.setAttribute("stadium", list);
      return "Stadium";
   }
   
   @RequestMapping("/addApplyTeam")
   public String addApplyTeam(ApplyTeamDTO dto){
      System.out.println(dto.getStadiumName());
      Stadiumservice.insertApplyTeam(dto);
      return "redirect:stadium";
   }
   
   @RequestMapping("/sendNewStadidum")
	public String sendNewStadidum(@ModelAttribute StadiumDTO dto){
		
		Stadiumservice.insertStadium(dto);
		return "redirect:stadium";
	}


}