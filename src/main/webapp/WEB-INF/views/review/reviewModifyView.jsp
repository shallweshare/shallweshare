<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet">

<style>
@import '../resources/css/style.css';
@import
'../resources/css/detailed-table.css';	
.width-container{
	padding-top: 20px;
	padding-bottom: 20px;
	max-width: 720px;
	margin: 0 auto;
}
h3{
	text-align:center;
}

.btn_reviewWrite {
    background-color: #FFFFFF;
    padding: 10px 10px;
    margin-left: 0%;
    font-size: 15px;
    font-size: large;
    font-weight: bolder;
    outline: none;
    border: none;
}
h2{
	text-align:center;
}
</style>
<!-- <link href="/css/style.css" rel="stylesheet" type="text/css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	/***********************게시판 내용 유효성 검사*************************/
	function fn_submit() {
		var review_content = document.getElementsByName("review_content")
		//        게시판 내용
		if (review_content[0].value.length == 0) {
			alert("게시판 내용을 적어주세요")

			return false;
		} else {
			if (review_content[0].value.length > 700) {
				alert('줄여서 적어주세요.');
				return false;
			}
		}
		//form 요소 자체
		var formData = $("#frm").serialize();

		$.ajax({
			type : "post",
			data : formData,
			url : "modify_process",

			success : function(data) {
				alert("저장완료");
				location.href = "../mypage/written-reviews?u_id=${sessionScope.u_id}";
			},
			error : function() {
				alert("오류발생");
			}

		});
	}
</script>
</head>
<body>
	<header>
		<%@include file="../header.jsp"%>
	</header>
	<div class="width-container">
	<h2><strong><<리뷰 수정>></strong></h2>
	<form id="frm" method="post" action="modify_process">
        <input type="hidden" name="review_id" value="${review.review_id}"> 
			<input type="hidden" name="review_u_id" value="${review.review_u_id}"> 
        <h3>작성 대상 파티</h3>
		<table width="700" border="1">
            <tr>
                <td>${party.p_title}</td>
            </tr>
        </table>
        <h3>파티장</h3>
        <table width="700" border="1">
            <tr>
                <td>${master.u_nickname}</td>
            </tr>
        </table>
        <h3>만족도</h3>
        <table width="700" border="1">
            <tr>
                <td>
                    <label><input type="radio" name="review_satisfy" value="T">만족했어요</label> 
					<label><input type="radio" name="review_satisfy" value="F">별로예요</label>
                </td>
			</tr>            
        </table>
        <h3>내용</h3>
        <table width="700" border="1">
            <tr>
                <td>
                	<textarea style="resize: none;" placeholder="내용을 입력해주세요." cols="60" rows="20" name="review_content" id="review_content">${review.review_content}</textarea>
                </td> 
			</tr>
			<tr>
       	 		  <td>
       	 		  	<input type="button" onclick="fn_submit()" value="접수하기" id="hoverColor" style="color: rgb(0, 0, 0);" class="btn_reviewWrite">
					<input type="button" onclick="history.back()" value="취소" id="hoverColor" style="color: rgb(0, 0, 0);" class="btn_reviewWrite">
				</td>
       		</tr>
        </table>
    </form>
    </div>
	 <footer>
		<%@include file="../footer.jsp"%>
	</footer>
</body>
</div>
</html>
<script type='text/javascript'>
if(${review.review_satisfy eq 'T'}){
	$("input:radio[name='review_satisfy']:radio[value='T']").prop('checked', true); 
}else{
	$("input:radio[name='review_satisfy']:radio[value='F']").prop('checked', true); 
	
}
</script>












