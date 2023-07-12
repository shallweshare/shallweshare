<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>sidebar</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="../resources/assets/favicon.ico" />
<!-- Custom Google font-->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet" />
<!-- Bootstrap icons-->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet" />
         -->
<!-- Core theme CSS (includes Bootstrap)-->
<!-- <link href="../resources/css/styles.css" rel="stylesheet" />
 -->


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%
	String session_u_id = String.valueOf(session.getAttribute("u_id"));
String session_u_nickname = String.valueOf(session.getAttribute("u_nickname"));
%>
<script>
	if (
<%=session_u_id%>
	== null) {
		alert("로그인이 필요합니다.");
		history.back();
	}
</script>
<style>
@import
'../resources/css/mypage/mypage_table.css'
</style>
</head>
<body>
	
		<!--       SideBar  -->
		<div class="d-flex flex-column flex-shrink-0 p-5 text-white bg-dark"
			style="width: 250px; height: 600px; margin-left: 16%; float: left;">
			<div>
				<a href="#"
					class="d-flex align-items-center text-white text-decoration-none"
					id="dropdownUser1">
					<img src="../resources/img/shop/emptyUserIcon.png" alt="" width="50" height="50"
					class="rounded-circle me-2"> <strong><%=session_u_nickname%>님</strong>
				</a>
			</div>
			<a href="/"
				class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
				<svg class="bi me-2" width="40" height="32">
					<use xlink:href="#bootstrap"></use></svg> <span class="fs-4"></span>
			</a>

			<hr>

			<ul class="nav nav-pills flex-column mb-auto ">

				<li><a href="userModify" class="nav-link text-white "> <svg
							class="bi me-2" width="16" height="16">
							<use xlink:href="../resources/img/NETFLIX.png"></use></svg> 회원 정보 수정
				</a></li>

				<li><a href="my_partyList" class="nav-link text-white"> <svg
							class="bi me-2" width="16" height="16">
							<use xlink:href="#table"></use></svg> 내 파티 보기
				</a></li>

				<li><a href="my_reportList" class="nav-link text-white"> <svg
							class="bi me-2" width="16" height="16">
							<use xlink:href="#grid"></use></svg> 내 신고 내역
				</a></li>

				<li><a href="writable-reviews" class="nav-link text-white">
						<svg class="bi me-2" width="16" height="16">
							<use xlink:href="#people-circle"></use></svg> 작성 가능 후기
				</a></li>

				<li><a href="written-reviews" class="nav-link text-white">
						<svg class="bi me-2" width="16" height="16">
							<use xlink:href="#people-circle"></use></svg> 적은 후기 보기
				</a></li>
				<li><a href="withdrawal" class="nav-link text-white"> <svg
							class="bi me-2" width="16" height="16">
							<use xlink:href="#people-circle"></use></svg> 회원 탈퇴
				</a></li>

			</ul>
			<hr>
		</div>
	
</body>

</html>
