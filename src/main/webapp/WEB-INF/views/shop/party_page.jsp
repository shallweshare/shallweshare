<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set value="${party.p_max-fn:length(participant_list)}" var="a" />

<html>
<head>
<meta charset="UTF-8">
<title>ShallweShare - ${party.p_title}</title>
<script src="party_page.js"></script>
<link href="../resources/css/shop/party_page.css" rel="stylesheet" />
<link href="../resources/css/styles.css" rel="stylesheet" />
<%@ include file="include/modifyDeleteCheck.jsp"%>
<body>
	<header>
		<%@ include file="../header.jsp"%>
	</header>
	<section>
		<form method="post" action="*">
			<div class="width-container">
				<div class="item-row-pTitle">
				
						
							<div class="icon">
								<img src="../resources/img/shop/${party.p_platform}Icon.png"Icon.png" alt>
							</div>
					
					<div class="platform-title">
						<span class="text">${party.p_platform}</span>
						<div class="p_title">
							<strong>${party.p_title}</strong>
						</div>
						<!-- end of item-row-pTitle  -->
					</div>
				</div>
				<div class="item-row-master">
					<div style="display: inline-block;">
						<strong>파티장 </strong>
					</div>
					<div class="masterIcon">
						<img src="../resources/img/shop/userIcon.png" alt>
					</div>
					<c:choose>
						<c:when test="${master.u_nickname ne null }">
							<span><a id="userLink"
								href="../review/review_list?u_id=${master.u_id}">${master.u_nickname}</a></span>
						</c:when>
						<c:otherwise>
							<span>탈퇴한 회원</span>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="item-row-pid">
					<span><strong>파티번호 </strong>${party.p_id}</span>
				</div>
				<div class="item-row-pmax">
					<span><strong>파티인원 </strong>${fn:length(participant_list)}/${party.p_max}</span>
				</div>
				<!-- end of item-row-pid  -->
				<div class="item-row-finishDate">
					<span><strong>파티기간 </strong> <fmt:formatDate
							value="${party.p_finish_date}" pattern="yyyy-MM-dd" /> 까지</span>
				</div>
				<div class="item-row-participant-list">
					<c:choose>
						<c:when test="${fn:length(participant_list) eq 0}">
							<h2 class="position-absolute top-50 start-50 translate-middle">가입한
								인원이 없습니다.</h2>
						</c:when>
						<c:otherwise>
							<ul>
								<c:forEach items="${participant_list}" var="pp_list"
									varStatus="i">
									<li>
										<div class="picture">
											<img src="../resources/img/shop/userIcon.png">
										</div> <c:choose>
											<c:when test="${empty pp_list.u_nickname }">
												<div>

													<span>탈퇴한 회원</span>
												</div>
											</c:when>
											<c:otherwise>
												<div>
													<span><a id="userLink"
														href="../review/review_list?u_id=${pp_list.u_id}">
															${pp_list.u_nickname} </a></span>
												</div>
											</c:otherwise>

										</c:choose>
									</li>
								</c:forEach>
								<%
									for (int i = 0; i < Integer.parseInt(pageContext.getAttribute("a").toString()); i++) {
								%>
								<li>
									<div class="picture">
										<img src="../resources/img/shop/emptyUserIcon.png">
									</div>
									<div>

										<span>모집 대기중</span>
									</div>
								</li>
								<%
									}
								%>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="item-row-pContent">
					<div>${party.p_content}</div>
				</div>
				<div class="item-row-application-button ">

					<c:choose>
						<c:when test="${ fn:length(participant_list) < party.p_max}">
							<c:if test="${sessionScope.u_id ne party.u_id}">
								<input type="button" value="신청하기" onclick="goApplication()"
									class="btn btn-warning">
							</c:if>
						</c:when>

						<c:otherwise>
							<span><h2><strong>파티 모집이 완료되었습니다.</strong></h2></span>
							<br />
						</c:otherwise>
					</c:choose>

					<input type="hidden" name="pageNum" value="${pageMaker.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.amount }">
					<input type="button" value="목록" onclick="history.back()" class="btn btn-light">
						
					<c:if test="${sessionScope.u_id eq party.u_id}">
						<input type="button" value="삭제" onclick="deleteCheck()"
							class="btn btn-light">
						<input type="button" value="수정" onclick="modifyCheck()"
							class="btn btn-light">
					</c:if>
					<input type="button" value="신고하기" onclick="goReport()"
						class="btn btn-light">

				</div>
			</div>
		</form>
	</section>
	<footer>
		<%@ include file="../footer.jsp"%>
	</footer>
</body>
</html>

