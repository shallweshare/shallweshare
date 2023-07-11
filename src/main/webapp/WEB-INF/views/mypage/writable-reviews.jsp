<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShallWeShare - 내 파티 보기</title>
<style>
#content-container {
	padding: 20px;
}
#btn{
background-color: #FFFFFF;
	padding: 10px 10px;
	margin: 5px;
	font-size: 15px;
	
	font-weight : bolder;
	border : 3px;
}
</style>

</head>
<body>
	<header>
		<%@ include file="../header.jsp"%>
	</header>
	<section>
		<div class=" d-flex flex-row" id="sidebar-container">
			<%@ include file="mypageList.jsp"%>
			<div id="content-container">
				<h2>작성 가능한 리뷰</h2>
				<table width="700" border="1">
					<tr>
						<td>주문 번호</td>
						<td>파티 제목</td>
						<td>결제 정보</td>
						<td>후기 작성</td>
					</tr>
					<c:forEach items="${writableApplicationList}" var="writable">
						<form method="post" action="../review/write">

							<input type="hidden" name="a_id" value="${writable.a_id}">
							<input type="hidden" name="p_id" value="${writable.p_id}">
							<input type="hidden" name="u_id"
								value=<%=session.getAttribute("u_id")%>>
							<tr>
								<td>${writable.a_id}</td>
								<td>${writable.p_title}</td>
								<td>${writable.a_payment}<br /> ${writable.a_price}
								</td>
								<td><input type="submit" value="리뷰 작성" id="btn"></td>
							</tr>
						</form>
					</c:forEach>
				</table>

			</div>
		</div>
	</section>
	<footer>
		<%@ include file="../footer.jsp"%>
	</footer>
</body>
</html>
  <script type="text/javascript">
   let hoverColor = document.getElementById("btn"); 


	hoverColor.addEventListener("mouseover", function (event) {
	event.target.style.color = "#FF9800";
	}, false);


	hoverColor.addEventListener("mouseout", function(event){
	event.target.style.color = "#000000";
	}, false)
  </script>