<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="../resources/css/admin.css"/>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보(관리자)</title>
</head>
<body>
	<table width="90%" border="3" align="center">
		<div style="float: right; margin-right: 124">
			<caption id="cap-top">
				<form method="post" action="uSearchList">
					<input name="u_name" type="text" placeholder="이름이나 닉네임 입력">&nbsp;&nbsp;
					<input type="submit" value="검색">
				</form>
			</caption>	
		</div>
		<div style="width: 450px; margin: 0 auto;">
			<c:if test="${searchResult != null && not empty searchResult}">
				<tr align="center" class="main-table">
					<td>회원번호</td>
					<td>닉네임</td>
					<td>이름</td>
					<td>가입날짜</td>
					<td>역할</td>
					<td colspan="2">등&nbsp;&nbsp;급</td>
				</tr>
				<c:forEach var="dto" items="${searchResult}" varStatus="status">
					<form method="post" action="searchModify">
						<input type="hidden" name="currentPage" value="${currentPage}">
						<input type="hidden" name="searchResult" value="${searchResult}">
						<input type="hidden" name="totalCount" value="${totalCount}">
						<input type="hidden" name="totalPages" value="${totalPages}">
						<input type="hidden" name="u_name" value="${u_name}">
						<input type="hidden" name="prev" value="${prev}">
						<input type="hidden" name="next" value="${next}">
						<input type="hidden" name="startPage" value="${startPage}">
						<input type="hidden" name="endPage" value="${endPage}">
					<tr align="center" class="${status.count % 2 == 0 ? 'users-table' : 'odd-row'}">
						<td>${dto.u_id}</td>
						<td><a href="user_view?u_id=${dto.u_id}"
							onclick="window.open(this.href, '_blank', 'width=650, height=1500'); return false;">${dto.u_nickname}</a>
						</td>
						<td>${dto.u_name}</td>
						<td><fmt:formatDate value="${dto.u_created}"
								pattern="yyyy-MM-dd" /></td>
						<td>${dto.u_role}</td>
							<td><select name="u_role">
									<c:choose>
										<c:when test="${dto.u_role=='USER'}">
											<option value="ADMIN" selected>ADMIN</option>
											<option value="RESTRICT">RESTRICT</option>
										</c:when>
										<c:when test="${dto.u_role=='ADMIN'}">
											<option value="USER" selected>USER</option>
											<option value="RESTRICT">RESTRICT</option>
										</c:when>
										<c:when test="${dto.u_role=='RESTRICT'}">
											<option value="USER" selected>USER</option>
											<option value="ADMIN">ADMIN</option>
										</c:when>
										<c:otherwise>
											<option value="USER" selected>USER</option>
											<option value="ADMIN">ADMIN</option>
											<option value="RESTRICT">RESTRICT</option>
										</c:otherwise>
									</c:choose>
							</select></td>
							<td><input type="hidden" name="u_id" value="${dto.u_id}">
								<input type="submit" value="수정"></td>
						</tr>
					</form>
				</c:forEach>
			</c:if>
		</div>
	<c:if test="${searchResult == null || empty searchResult}">
		<p>검색결과가 없습니다.</p>
	</c:if>
	<caption id="cap-bottom">
	<div class="user_page">
		<ul>
		<c:choose>
			<c:when test="${totalPages > 1}">
				<c:if test="${prev}">
					<li class="paginate_button">
						<c:url value="uSearchList" var="pageUrl">
							<!-- 				시작페이지 -1 하면 이전의 10개 페이지 표시 -->
							<c:param name="u_name" value="${u_name}" />
							<c:param name="page" value="${startPage-1}" />
						</c:url>
						<a href="${pageUrl}">
							[Prev]
						</a>
						&nbsp;
					</li>
				</c:if>
				<c:forEach var="pageNumber" begin="${startPage}" end="${endPage}" step="1">
					<li>
						<c:url value="uSearchList" var="pageUrl">
							<c:param name="u_name" value="${u_name}" />
							<c:param name="page" value="${pageNumber}" />
						</c:url>
						<a href="${pageUrl}"
							${currentPage == pageNumber ? "style='font-weight: 900; font-size: larger; color:#FFC147;'":""}>
							[${pageNumber}]
						</a>
					</li>
					&nbsp;
                </c:forEach>
				<c:if test="${next}">
					<li class="paginate_button">
						<c:url value="uSearchList" var="pageUrl">
							<c:param name="u_name" value="${u_name}" />
							<c:param name="page" value="${endPage+1}" />
							<!-- 				끝페이지 +1 하면 이후의 10개 페이지 표시 -->
						</c:url>
						<a href="${pageUrl}"> [Next] </a>
					</li>
				</c:if>
				</c:when>
				<c:otherwise>
					<p>Page 1 of 1</p>
				</c:otherwise>
			</c:choose>
			</ul>
		</div>
	</caption>
</table>
</body>
</html>