<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>@import '../resources/css/detailed-table.css'</style>
<style>@import '../resources/css/font.css'</style>


<body>
<%@include file ="../header.jsp" %>
	<h3>회원닉네임</h3>
	<table width="500" border="3">
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
		
			
			</table>
			
			<div id="hoverColor">
				<input type="button" class="moveReview_list" value="작성한 리뷰 보기"
					onclick="location.href = 'review_list?u_id=${users.u_id}'">
				
				<input type="button" class="movweParty_list" value="가입한 파티 목록 보기"
					onclick="location.href = 'party_list?u_id=${users.u_id}'" />
				
				<input type="button" value="신고하기" class="report"
					onclick="location.href = '../report/write?report_u_id=${users.u_id}'" />
		
			</div>
			
	<table>
	<h3>만든 파티</h3>
	<c:forEach items="${party}" var="party" varStatus="i">
		<table width="500" border="3">
			<tr>
				<th style="border: none">파티 번호</th>
				<td>${party.p_id}</td>
			</tr>
			<tr>
				<th style="border: none">파티 플랫폼</th>
				<td>${party.p_platform}</td>
			</tr>
			<tr>
				<th style="border: none">파티 제목</th>
				<td><a href="../shop/party_page?p_id=${party.p_id}">${party.p_title}</a></td>
			</tr>
			<tr>
				<th style="border: none">파티 생성 시간</th>
				<td><fmt:formatDate value="${party.p_created}"
						pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<th style="border: none">파티 인원</th>
				<td>${party.p_max}</td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>
<script type="text/javascript">
//마우스 hover 색상 주황 or 흰색
let hoverColor = document.getElementById("hoverColor"); 

hoverColor.addEventListener("mouseover", function (event) {
event.target.style.color = "#FF9800";
}, false);


hoverColor.addEventListener("mouseout", function(event){
event.target.style.color = "#000000";
}, false)

</script>
<%@include file ="../footer.jsp" %>