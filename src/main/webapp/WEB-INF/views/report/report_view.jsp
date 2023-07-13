<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import
'../resources/css/detailed-table.css';

@import
'../resources/css/styles.css';
</style>
</head>
<script>
function goBack() {
  window.close();
}
</script>
<body>
		<h3>신고 번호</h3>
	<table width="500" border="1">
		<tr>
			<td>${report.report_id}</td>
		</tr>
	</table>
		<h3>피신고자</h3>
	<table width="500" border="1">
		<tr>
			<td>${report.report_u_id}</td>
		</tr>
	</table>
		<h3>파티 번호</h3>
	<table width="500" border="1">
		<tr>
			<td>${report.p_id}</td>
		</tr>
	</table>
		<h3>신고사유</h3>
	<table width="500" border="1">
		<tr>
			<td>${report.report_category}</td>
		</tr>
	</table>
		<h3>제 목</h3>
	<table width="500" border="1">
		<tr>
			<td>${report.report_title}</td>
		</tr>
	</table>
		<h3>내 용</h3>
	<table width="500" border="1">
		<tr>
			<td>${report.report_content}</td>
		</tr>
	</table>
		<h3>신고날짜</h3>
	<table width="500" border="1">
		<tr>
			<td>${report.report_created}</td>
		</tr>
	</table>
	<br>
	<div class="d-flex justify-content-center">
		<input type="button" value="수정하기" onclick="javascript: location.href='reportModifyView?report_id=${report.report_id}'" class="btn btn-warning">
		&nbsp
		<input type="button" value="닫 기" onclick="goBack()" class="btn btn-light">
		&nbsp
		<input type="button" value="삭제하기" onclick="deleteCheck()" class="btn btn-light">
	</div>

</body>
</html>
<script type="text/javascript">
function deleteCheck() {
	var result = confirm('삭제하시겠습니까? 삭제하면 다시 되돌릴 수 없습니다.');

	if (result) {
		window.location = 'reportDelete?report_id=${report.report_id}';
		alert('삭제되었습니다.');
		window.opener.location.reload();
		window.close();
	} else {
		//no
	}
}
</script>