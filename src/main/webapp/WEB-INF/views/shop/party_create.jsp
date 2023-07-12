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
.width-container{
	padding-top: 20px;
	padding-bottom: 20px;
	max-width: 720px;
	height: 100%;
	margin: 0 auto;
}
h3{
	text-align:center;
}

h2{
	text-align:center;
}
</style>
</head>
<body>
	<header>
		<%@include file="../header.jsp"%>
	</header>
	<section>
	
	<div class="width-container">
	<div><h2><strong> <<파티 생성>> </strong></h2></div>
	<form method="post" action="party_createProcess">
		<input type="hidden" name="u_id" value=<%= session.getAttribute("u_id") %>>
			<h3>파티 플랫폼</h3>
		<table width="700" border="1">
			<tr>
				<td>
					<label><input type="radio" name="p_platform" value="netflix">넷플릭스</label>			
					<label><input type="radio" name="p_platform" value="wavve">웨이브</label>			
					<label><input type="radio" name="p_platform" value="tving">티빙</label>			
					<label><input type="radio" name="p_platform" value="watcha">왓챠</label>			
					<label><input type="radio" name="p_platform" value="disney">디즈니플러스</label>
				</td>			
			</tr>
		</table>
			<h3>파티 인원</h3>
		<table width="700" border="1">
			<tr>
				<td><input type="number" name="p_max" min="0" max="3"></td>
			</tr>
		</table>
			<h3>파티 제목</h3>
		<table width="700" border="1">
			<tr>
				<td><input type="text" name="p_title" ></td>
			</tr>
		</table>
			<h3>파티 끝나는 기간</h3>
		<table width="700" border="1">
			<tr>
				<td><input type="date" name="p_finish_date"></td>
			</tr>
		</table>
			<h3>파티 가격</h3>
		<table width="700" border="1">
			<tr>
				<td><input type="text" name="p_price"></td>
			</tr>
		</table>
			<h3>플랫폼 아이디</h3>
		<table width="700" border="1">
		<tr>
			<td><input type="text" name="p_platform_id"></td>
		</tr>
		</table>
			<h3>플랫폼 비밀번호</h3>
		<table width="700" border="1">
		<tr>
			<td><input type="text" name="p_platform_password"></td>
		</tr>
		</table>
			<h3>플랫폼 성인인증</h3>
		<table width="700" border="1">
			<tr>
				<td>
					<label><input type="radio" name="p_adult" value="N" checked="checked">N</label>	
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label><input type="radio" name="p_adult" value="Y">Y</label>
				</td>		
			</tr>
		</table>
			<h3>플랫폼 성인인증 번호</h3>
		<table width="700" border="1">
			<tr>
				<td><input type="text" name="p_adult_password"></td>
			</tr>
		</table>
			<h3>자유 입력</h3>
		<table width="700" border="1">
			<tr>
				<td> <textarea style="resize: none; border: none;"  rows="20" cols="60" name="p_content"></textarea> </td>
			</tr>
			<tr>
			<td>
			<div style="margin:0 auto">
				<br>
				<input type="button" value="생성" onclick="Validation()" class="btn btn-warning">
				<input type="button" value="취소" onclick="goList()" class="btn btn-light">
			</div>
			</td>
			</tr>
		</table>
	</form>
	</div>
	</section>
	<footer>
	<%@include file="../footer.jsp"%>
	</footer>
</body>
</html>


<script type="text/javascript">
// 	취소
	console.log("0")
	function goList() {
		window.location.href = "list";
	}
	//파티 끝나는 기간(오늘 이후)
	var now_utc = Date.now() // 지금 날짜(밀리초)
	 // getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
	var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
	 // new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	//  document.getElementsByName("p_finish_date").setAttribute("min", today);
	var finishDateInputs = document.getElementsByName("p_finish_date");
	
	for (var i = 0; i < finishDateInputs.length; i++) {
	    finishDateInputs[i].setAttribute("min", today);
	}
// 	유효성 검사
	function Validation() {
        // 변수에 저장
	    var p_platform = document.getElementsByName("p_platform")
	    var p_max = document.getElementsByName("p_max")
	    var p_title = document.getElementsByName("p_title")
	    var p_finish_date = document.getElementsByName("p_finish_date")
	    var p_price = document.getElementsByName("p_price")
	    var p_platform_id = document.getElementsByName("p_platform_id")
	    var p_platform_password = document.getElementsByName("p_platform_password")
	    var p_adult = document.getElementsByName("p_adult")
	    var p_adult_password = document.getElementsByName("p_adult_password")
	    
        // 	    파티 플랫폼
        if(!checkedP_platform(p_platform)){
            alert("플랫폼을 체크하세요.")
            return false;
        }
        // 	    파티 인원
	    if(p_max[0].value.lenght==0){
            alert("파티 인원을 선택하세요")
            return false;
        }
         // 	    파티 제목
	    if(p_title[0].value.length==0){
            alert("파티 제목을 입력해주세요")
            return false;
        }
    //  파티 끝나는 기간
        if(p_finish_date[0].value.length==0){
            alert("파티 끝나는 기간을 선택하세요")
            return false;
        }
                
                // console.log(p_price[0].value);
// 	    파티 가격
        if(p_price[0].value.length==0){
            alert("파티 가격을 적어주세요")
            return false;
        }else{
            for(var i=0; i<p_price[0].value.length; i++){
                if( (p_price[0].value.charCodeAt(i) < 48 || p_price[0].value.charCodeAt(i) > 57)){
                     alert('숫자만 입력해주세요.');
                     return false;
        		}
			}		
        }
     
// 	    플랫폼 아이디
	    if(p_platform_id[0].value.length==0){
            alert("파티 아이디를 적어주세요")
            return false;
        }
// 	    플랫폼 비밀번호
	    if(p_platform_password[0].value.length==0){
            alert("파티 비밀번호를 적어주세요")
            return false;
        }
// 	    플랫폼 성인인증
// 			console.log(p_adult[0].checked);
// 			if (p_adult[0].checked===true) {
// 				alert("파티 성인인증을 하세요");
// 				return false;
// 			}

    //  유효성 문제 없을 시 폼에 submit
		document.querySelector("form").submit();
	}
	 //플랫폼 체크 확인
	function checkedP_platform(arr){
	    for(var i=0; i<arr.length; i++){
	        if(arr[i].checked == true){
	            return true;
	        }
	    }
	    return false;
	}
	console.log(0);
</script>
