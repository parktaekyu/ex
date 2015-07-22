<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		var x;
	</script>
	<%
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
		String today = formatter.format(new java.util.Date());
		out.println(today);
		String date = today.substring(2,8);
		int hour = Integer.parseInt(today.substring(8, 10));
		int min = Integer.parseInt(today.substring(10, 12));
		out.println(date);
		out.println(hour);
		out.println(min);
		
		String time =today.substring(8, 12);
	%>

	<select name="hour">
<%
	for (int i=0;i<=24;i++){
		if(hour<i){
		%>
		<option value="<%=i%>"><%=i%></option>
		<% 
		}
	}

%>
	</select>

	<select name="min">
<%
	for (int i=0;i<=60;i=i+10){
		%>
		<option value="<%=i%>"><%=i%></option>
		<% 
	}

%>
	</select>





<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">경기장 등록</h4>
			</div>
			<form action="addApplyTeam" method="post">
				<div class="modal-body">

					<div class="form-group">
						<label for="id" class="control-label">경 기 장</label> <input
							type="text" class="form-control" value="" id="stadium_Name"
							name="stadium_Name" disabled> <input type="hidden"
							id="stadiumName" name="stadiumName" value="">
					</div>
					<div class="form-group">
						<label for="pass" class="control-label">소 속 팀</label> <input
							type="text" class="form-control" id="teamNo" name="teamNo">
					</div>
					<div class="form-group">
						<label for="name" class="control-label">경 기 인 원</label> <input
							class="form-control" id="applyPlayer" name="applyPlayer">
					</div>

					<div class="form-group">
						<label for="birth" class="control-label">시 작 시 간</label> <input
							class="form-control" id="startTime" name="startTime">
					</div>


					<div class="form-group">
						<label for="tel" class="control-label">종 료 시 간</label> <input
							class="form-control" id="endTime" name="endTime">
					</div>




				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<input type="reset" class="btn btn-default" value="다시 쓰기">
					<input type="submit" class="btn btn-primary" value="신청 하기">
				</div>
			</form>
		</div>
	</div>
</div>


</body>
</html>