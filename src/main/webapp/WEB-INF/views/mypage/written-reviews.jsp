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
				<h2>작성한 리뷰</h2>
				
				<table width="700" border="1">
				
					<c:forEach items="${written}" var="written" varStatus="status">
							<tr>
								<c:choose>
								<c:when test="${written.review_satisfy eq 'T'}">
								<td><h4><strong>👍만족했어요</strong></h4></td>
								</c:when>
								<c:otherwise>
								
								<td><h4>👎별로예요</h4></td>
								</c:otherwise>
								</c:choose>
								
							</tr>
							<tr>
								<td><h5><strong>파티명 </strong></h5>${partyInfo[status.index].p_title}</td>
							</tr>
							<tr>
								<td><h5><strong>작성 내용</strong></h5>
								${written.review_content}</td>
							</tr>
							<tr>
								<td><input type="button" value="수정" 
								onclick="javascript:window.location='../review/modify?review_id=${written.review_id}'" class="btn btn-warning"> <input
									type="button" value="삭제" onclick="deleteCheck()" class="btn btn-light"></td>
								<script>
									function deleteCheck() {
										var result = confirm('삭제하시겠습니까? 삭제하면 다시 되돌릴 수 없고, 새로운 리뷰를 적을 수 없습니다.');

										if (result) {
											window.location = '../review/delete_process?review_id=${written.review_id}';
											alert('삭제되었습니다.');
										} else {
											//no
										}
									}
								</script>
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

