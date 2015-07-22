<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 로그인 실패시 보여줄 값 설정 -->
<c:if test="${!empty param.Login_error}">
	로그인 실패입니다.
</c:if>




<form action="<c:url value='/j_spring_security_check'/>" method="POST">

아이디 <input type="text" name="j_username"><br>
비번  <input type="text" name="j_password"><br>
<input type="submit" value="로그인">

</form>

</body>
</html>