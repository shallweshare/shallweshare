<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>party_modify</title>
<style>@import '../resources/css/detailed-table.css'</style>
<style type="text/css">
		table{
		margin-top : 10px;
			margin : auto;
		    width : 50%;
		}
		
		td {
			text-align: center;
		}
		select{
			width: 25%; 
			text-align: center;
		}
		h2{
			text-align:center;
		}
</style>

</head>
<body>
<%@include file ="../header.jsp" %><br>

<table width="500" border="1">
		<h2>파티 수정</h2>
		<form method="post" action="party_modifyCheck">
		<input type="hidden" name="pageNum" value="${cri.pageNum}"> 
		<input type="hidden" name="amount" value="${cri.amount}"> 
		<input type="hidden" name="p_id" value="${party.p_id}"> 

			<td>파티 플랫폼</td>
			<td>
				<label><input type="radio" name="p_platform" value="netfliex">넷플릭스</label>			
				<label><input type="radio" name="p_platform" value="wavve">웨이브</label>			
				<label><input type="radio" name="p_platform" value="tving">티빙</label>			
				<label><input type="radio" name="p_platform" value="watcha">왓챠</label>			
				<label><input type="radio" name="p_platform" value="disney">디즈니플러스</label>			
			</td>
		</tr>
		<tr>
			<td>파티 인원</td>
			<td><input type="number" name="p_max" min="0" max="3" value="${party.p_max}"></td>
		</tr>
		<tr>
			<td>파티 제목</td>
			<td><input type="text" name="p_title" value="${party.p_title}"></td>
		</tr>
		<tr>
			<td>파티 끝나는 기간</td>
			<td><input type="date" name="p_finish_date" value="${party.p_finish_date}"></td>
		</tr>
		<tr>
			<td>파티 가격</td>
			<td><input type="text" name="p_price" value="${party.p_price}"></td>
		</tr>
		<tr>
			<td>플랫폼 아이디</td>
			<td><input type="text" name="p_platform_id" value="${party.p_platform_id}"></td>
		</tr>
		<tr>
			<td>플랫폼 비밀번호</td>
			<td><input type="text" name="p_platform_password" value="${party.p_platform_password}"></td>
		</tr>
		<tr>
			<td>플랫폼 성인인증</td>
			<td>
				<label><input type="radio" name="p_adult" value="N">N</label>	
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label><input type="radio" name="p_adult" value="Y">Y</label>
			</td>		
		</tr>
		<tr>
			<td>플랫폼 성인인증 번호</td>
			<td><input type="text" name="p_adult_password" value="${party.p_adult_password}"></td>
		</tr>
		<tr>
			<td>자유 입력</td>
			<td> <textarea rows="20" cols="60" name="p_content">${party.p_content}</textarea> </td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<div id="hovorColor">
				<!-- <button type="submit" formaction="list" id="hovorColor" class="btn_party_modift_list">목록</button> -->
				<input type="button" onclick="history.back()" value="목록"  class="btn_party_modift_list" />
				<input type="button" value="수정" onclick="modifyCheck()" class="btn_party_modify" />
				</div>
				<!--btn_party_modift_list    btn_party_modify  -->
			</td>
		</tr>
		</form>
	</table>
	<br>
</body>
</html>
<%@include file ="../footer.jsp" %>
<script type="text/javascript">

	
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
//	유효성 검사
function modifyCheck() {
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
//	    파티 가격
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
 
//	    플랫폼 아이디
    if(p_platform_id[0].value.length==0){
        alert("파티 아이디를 적어주세요")
        return false;
    }
//	    플랫폼 비밀번호
    if(p_platform_password[0].value.length==0){
        alert("파티 비밀번호를 적어주세요")
        return false;
    }
//	    플랫폼 성인인증
		if (p_adult.checked==false) {
			alert("성인인증 여부를 선택하세요.");
			return false;
		}

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

</script>


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