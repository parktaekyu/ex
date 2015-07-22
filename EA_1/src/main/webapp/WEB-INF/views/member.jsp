<%@page import="com.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
member.jsp


<table border="2" >
	<tr>
		<th>회원번호</th>
		<th>ID</th>
		<th>이름</th>
		<th>주소</th>
		<th>생년월일</th>
		<th>전화번호</th>
	</tr>
	<%  //request 는 자동생성 객체
	List<MemberDTO> list = (List<MemberDTO>)request.getAttribute("list");

	for(MemberDTO dto  : list){
		int num = dto.getNum();
		String id = dto.getId();
		String name = dto.getName();
		String addr = dto.getAddr();
		String birth = dto.getBirth();
		String tel = dto.getTel();

	%>
	<tr>
		<td><%=num %></td>
		<td><%=id %></td>
		<%-- <td><a href="retrieve?num=<%=num %>"><%=title %></a></td> --%>
		<td><%=name %></td>
		<td><%=addr %></td>
		<td><%=birth %></td>
		<td><%=tel %></td>
	</tr>
	<%
	}
	%>

</table>



</body>
</html>