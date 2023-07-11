<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>@import '../resources/css/detailed-table.css'</style>
<body>
<%@include file ="../header.jsp" %>

	<h3>회원닉네임</h3>
	<table width="500" border="1">
		<tr>
			<th style="border: none">회원 닉네임</th>
			<td>${users.u_nickname}</td>
		</tr>
		<tr>
			<th style="border: none">회원 아이디</th>
			<td>${users.u_id}</td>
		</tr>
		<tr>
			<th style="border: none">회원 온도</th>
			<td>${users.u_temperature}</td>
		</tr>
			</br>
			
			<div>
		<caption align="bottom" class="cap-bottom">			
			<input type="button" class="moveReview_list" value="작성한 리뷰 보기"
				onclick="location.href = 'review_list?u_id=${users.u_id}'">
			<input type="button" class="movweParty_list" value="가입한 파티 목록 보기"
				onclick="location.href = 'party_list?u_id=${users.u_id}'" />
			<input type="button" value="신고하기"
				onclick="location.href = '../report/write?report_u_id=${users.u_id}'" />
			<br/>
		</caption>
		</div>
	</table>
		
		<table width="500" border="1">
		<h3>받은 후기</h3>
		<c:forEach items="${list}" var="ReviewDto">
			<tr>
				<th width="200" style="border: none">후기번호</th>
				<td>${ReviewDto.review_id}</td>
			</tr>
			<tr>
				<th style="border: none">작성자 아이디</th>
				<td>${ReviewDto.u_id}</td>
			</tr>
			<tr>
				<th style="border: none">만족도</th>
				<td>${ReviewDto.review_satisfy}</td>
			</tr>
			<tr>
				<th style="border: none">내용</th>
				<td>${ReviewDto.review_content}</td>
			</tr>
			<tr>
				<th style="border: none">작성시간</th>
				<td>${ReviewDto.review_created}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
<script type="text/javascript">
//마우스 hover 색상 주황 or 흰색
let hoverColor = document.getElementById("cap-bottom"); 

hoverColor.addEventListener("mouseover", function (event) {
event.target.style.color = "#FF9800";
}, false);


hoverColor.addEventListener("mouseout", function(event){
event.target.style.color = "#000000";
}, false)

</script>
<%@include file ="../footer.jsp" %>
