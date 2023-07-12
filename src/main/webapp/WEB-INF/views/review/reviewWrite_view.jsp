<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet">
<style>
@import'../resources/css/detailed-table.css';
table{
margin : auto;
}


.width-container{
	padding-top: 20px;
	padding-bottom: 20px;
	max-width: 720px;
	margin: 0 auto;
}
h3{
	
	margin :3%;
	padding : 10px;
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
			url : "write_process",

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
<h2><strong><<리뷰 작성>></strong></h2>
	<form id="frm" method="post" action="write">
        <input type="hidden" name="a_id" value="${param.a_id}"> 
        <input type="hidden" name="p_id" value="${param.p_id}"> 
        <input type="hidden" name="u_id" value="${sessionScope.u_id}">
        <input type="hidden" name="review_u_id" value="${master.u_id}" size="50">
        <h3>작성 대상 파티</h3>
		<table width="700" border="3">
            <tr>
                <td>${party.p_title}</td>
            </tr>
        </table>
        <h3>파티장</h3>
        <table width="700" border="3">
            <tr>
                <td>${master.u_nickname}</td>
            </tr>
        </table>
        <h3>만족도</h3>
        <table width="700" border="3">
            <tr>
                <td>
                    <label><input type="radio" name="review_satisfy" value="T">만족했어요</label> 
					<label><input type="radio" name="review_satisfy" value="F">별로예요</label>
                </td>
			</tr>            
        </table>
        <h3>내용</h3>
        <table width="700" border="3">
            <tr>
                <td>
                	<textarea style="resize: none;" placeholder="내용을 입력해주세요." cols="60" rows="20" name="review_content" id="review_content"></textarea>
                </td> 
			</tr>
			<tr>
       			    <td>
       			    <input type="button" onclick="fn_submit()" value="입력" class="btn_reviewWrite" id="hoverColor"> &nbsp;&nbsp; 
       	 		  	<a href="../mypage/writable-reviews" class="href_reviewWrite">목록보기</a></td>
       		</tr>
        </table>
    </form>
    </div>
    <footer>
		<%@include file="../footer.jsp"%>
	</footer>
</body>
</html> 
<script type="text/javascript">
//     마우스 hover 색상 주황 or 흰색
    let hoverColor = document.getElementById("hoverColor"); 

    hoverColor.addEventListener("mouseover", function (event) {
      event.target.style.color = "#FF9800";
    }, false);


    hoverColor.addEventListener("mouseout", function(event){
      event.target.style.color = "#000000";
    }, false)

</script>