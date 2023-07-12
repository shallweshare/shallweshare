<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>shallweshare</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="../resources/assets/favicon.ico" />
<link
	href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" rel="stylesheet" />
<link href="../resources/css/font.css" rel="stylesheet" />


</head>
<body>
	<main class="flex-shrink-0">

		<!-- header-->
		<nav class="navbar navbar-expand-lg navbar-light bg-warning py-3">
			<div class="container px-10">
				<a class="navbar-brand" href="../shop/list"> <span
					class="fw-bolder text-primary"> <img
						src="../resources/img/shallweshare.png" alt="Bootstrap"
						width="250" height="50">
				</span>
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-0 ml-0 mb-lg-0 Large  fw-bolder">
						<li class="nav-item"><a class="nav-link" href="../shop/list">모집/신청</a></li>
						<li class="nav-item"><a class="nav-link " href="../mypage/">마이페이지</a></li>
						<c:if test="${sessionScope.u_role = 'ADMIN' }">
							<li class="nav-item"><a class="nav-link"
								href="../admin/main">관리자페이지</a></li>
						</c:if>
					</ul>

					<ul class="navbar-nav ms-auto mb-2 mb-lg-0 Large  fw-bolder">
						<li class="nav-item">
							<ul class="navbar-nav ms-0 ml-0 mb-lg-0 Large  fw-bolder">
								<li class="nav-item"><c:choose>
										<c:when test="${sessionScope.u_id eq null }">
											<a class="nav-link " onclick="return false;"></a>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${sessionScope.access_Token eq null }">
													<a class="nav-link " onclick="return false;">
														${sessionScope.u_nickname}님 환영합니다</a>
												</c:when>
												<c:otherwise>
													<a class="nav-link " onclick="return false;">
														${sessionScope.u_nickname}님 환영합니다</a>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose></li>
								<li class="nav-item"><c:choose>
										<c:when test="${sessionScope.u_id eq null }">
											<a class="nav-link " href="../users/userSignIn">로그인</a>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${sessionScope.access_Token eq null }">
													<a class="nav-link " href="../users/logout">로그아웃</a>
												</c:when>
												<c:otherwise>
													<a class="nav-link " href="../users/kakaologout">로그아웃</a>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</main>
</body>
</html>