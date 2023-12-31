<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../resources/css/admin.css"/>
<html>
<head>
<meta charset="UTF-8">
<title>신고 게시판(관리자)</title>
</head>
<body>
	<table width = "90%" border = "3" align="center">
		<div style="float: right; margin-right: 48">
			<caption id="cap-top">	
				<form method="post" action="rSearchList">
					<input name="report_search" type="text" placeholder="제목이나 사유를 입력">&nbsp;&nbsp;
					<input type="submit" value="검색">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				</form>
			</caption>
		</div>
		<div style="width: 700px; margin: 0 auto;">
			<tr align="center" class="main-table">
				<td>번호</td>
				<td>파티번호</td>
				<td>신고자</td>
				<td>피신고자</td>
				<td>신고사유</td>
				<td>제목</td>
				<td>날짜</td>
			</tr>
			<c:forEach items="${rlist}" var = "dto" varStatus="status">
				<tr class="${status.count % 2 == 0 ? 'users-table' : 'odd-row'}">
					<td>${dto.report_id}</td>
					<td>${dto.p_id}</td>
					<td>${dto.u_id}</td>
					<td>${dto.report_u_id}</td>
					<td>${dto.report_category}</td>
					<td>
						<a href="report_view?report_id=${dto.report_id}" onclick="window.open(this.href, '_blank', 'width=600, height=1280'); return false;">${dto.report_title}</a>
					</td>
					<td><fmt:formatDate value="${dto.report_created}" pattern="yyyy-MM-dd"/></td>
				</tr>
			</c:forEach>
		</div>
    <caption id="cap-bottom">
	    <div class="report_page">
			<ul>
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button">
	<!-- 				시작페이지 -1 하면 이전의 10개 페이지 표시 -->
						<a href="${pageMaker.startPage-1}">
							[Prev]
						</a>
					</li>
					&nbsp;
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	<%-- 			<li>${num}</li> --%>
	<%-- 			<li ${pageMaker.cri.pageNum == num ? "style='color:red'":""}> --%>
	<!-- 				현재 페이지는 배경색 노란색으로 표시 -->
					<li class="paginate_button">
	<!-- 				클릭한 현재 페이지 번호를 링크로 연결 -->
						<a href="${num}" ${pageMaker.cri.pageNum == num ? "style='font-weight: 900; font-size: larger; color:#FFC147;'":""}>
							[${num}]
						</a>
					</li>
					&nbsp;
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="paginate_button">
	<!-- 				끝페이지 +1 하면 이후의 10개 페이지 표시 -->
						<a href="${pageMaker.endPage+1}">
							[Next]
						</a>
					</li>				
				</c:if>
				<form method="get" id="actionForm" action="#">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				</form>	
			</ul>
		</div>
	</table>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var actionForm = $("#actionForm");
// 	페이지 번호 처리	
	$(".paginate_button a").on("click", function(e){
// 		기본 동작 막음 : 페이지 이동
		e.preventDefault();
		console.log("click~!!!");
		console.log("@@@@### href ===> "+$(this).attr("href"));
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
// 	게시글 처리
	$(".move_link").on("click",function(e){
		e.preventDefault();
		var targetBno = $(this).attr("href");
// 		console.log("move click~!!"));
// 		console.log("@# href ===>"$(this).attr("href"));

// 		게시글 클릭 후 뒤로가기 누를 때 &bid=번호 계속 누적되는거 방지
		var bno = actionForm.find("input[name='bid']").val();
		if (bno != ''){
			actionForm.find("input[name='bid']").remove();
		}
		
		actionForm.append("<input type='hidden' name='bid' value='"+targetBno+"'>")
		actionForm.attr("action","content_view").submit();
// 		"content_view?bid=${dto.bid}" 에 있는 ?bid= 의 bid와 name 을 매칭
	});
</script>
</html>