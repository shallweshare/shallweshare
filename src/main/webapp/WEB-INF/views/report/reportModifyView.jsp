<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 조회</title>
<style>
@import
'../resources/css/detailed-table.css';

@import
'../resources/css/styles.css';
h3{
	text-aling:center;
}
</style>
</head>
<body>
	<h3><strong><<신고 수정>></strong></h3>
	<form method="post" name="rpt_frm" action="reportModify">
		<input type="hidden" name="u_id" value="${sessionScope.u_id}"> 
		<input type="hidden" name="report_id" value="${report.report_id}">

        	<h3>작성 대상 파티</h3>
		<table width="500 " border="1">
			<tr>
				<td>
					<select name="report_category" id="report_category">
						<option value="--" selected>선택</option>
						<option value="먹튀">먹튀</option>
						<option value="입금지연">입금지연</option>
						<option value="파삭요청">파티삭제요청</option>
						<option value="기타">기타</option>
					</select>
				</td>
			</tr>
		</table>
	    	<h3>신고 파티</h3>
	    <table width="500" border="1">
	        <tr>
	            <td><input type="number" name="report_p_id" value="${report.p_id}"></td>
	        </tr>
        </table>
			<h3>신고 할 유저</h3>
		<table width="500" border="1">
			<tr>
				<td><input type="number" name="report_u_id" value="${report.report_u_id}"></td>
			</tr>
		</table>
			<h3>신고 제목</h3>
		<table width="500" border="1">
			<tr>
				<td><input type="text" name="report_title" value="${report.report_title}"></td>
			</tr>
		</table>
			<h3>신고 내용</h3>
		<table width="500" border="1">
			<tr>
				<td>
					<textarea style="resize: none; border: none;" name="report_content" id="review_content" placeholder="내용을 입력해주세요." cols="60" rows="20">${report.report_content}</textarea>
				</td>
			</tr>
		</table>
		</form>
		<br>
			<div class="d-flex justify-content-center">
			&nbsp
			<input type="button" value="수정하기" onclick="reportCheck()" class="btn btn-warning">
			&nbsp
			<input type="button" value="취소" onclick="history.back()" class="btn btn-light">
			</div>
			<br>
</body>
<script type="text/javascript">

	$("#report_category").val(${report.report_category}).prop("selected", true);
	function reportCheck() {

		if (rpt_frm.report_category.value == "--") {
			alert("신고사유를 선택해주세요");
			return;
		}

		if (rpt_frm.report_title.value.length == 0) {
			alert("제목을 입력해야 합니다.");
			rpt_frm.report_title.focus();
			return;
		}

		if (rpt_frm.report_content.value.length == 0) {
			alert("내용을 써주세요.");
			rpt_frm.report_content.focus();
			return;
		}
		document.rpt_frm.submit();
	}
</script>
</html>