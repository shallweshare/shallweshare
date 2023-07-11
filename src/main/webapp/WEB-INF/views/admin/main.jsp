<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../resources/css/admin.css"/>        <link href="../resources/css/font.css" rel="stylesheet" />
<link href="../resources/css/font.css" rel="stylesheet" />
<%@include file="../header.jsp" %>
</head>
<body>
	<div align="center" class="admin-menu">
	<h1 align="center"><a href="http://localhost:8181/shallweshare/admin/main">관리자 페이지</a></h1>
	<hr>
		<ul>
			<li><a class="users clicked" href="#" onclick="changeIframeSrc('http://localhost:8181/shallweshare/admin/adUserInfo', 'users')">회원정보</a></li>
			<li><a class="report" href="#" onclick="changeIframeSrc('http://localhost:8181/shallweshare/admin/adReport', 'report')">신고내역</a></li>
		</ul>
	</div>
	<div>
		<iframe src="http://localhost:8181/shallweshare/admin/adUserInfo" id="iframe" width="95%" height="500"></iframe>
	</div>
	<script>
		function changeIframeSrc(src, linkType) {
			document.getElementById("iframe").src = src;
			document.querySelectorAll("a.users, a.report").forEach(function(link) {
				link.classList.remove("clicked");
			});
			document.querySelector("a." + linkType).classList.add("clicked");
		}
	</script>
</body>
<%@include file="../footer.jsp" %>
</html>