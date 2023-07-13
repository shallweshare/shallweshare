<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="../resources/css/font.css" rel="stylesheet" />
<style type="text/css">
	 	table { 
 			border-radius: 25px;
 			border: 1px solid #FFCA28;
 			margin-left:auto; 
 			margin-right:auto; 
			border-left:0;border-right:0;border-bottom:0;border-top:0;
			text-align: center;
 			width : 400px; 
 		} 

 		tr, td { 
 			border: 1px solid #FFCA28;
 			border-radius: 25px;
 			padding : 10px; 
 			margin : 5px;  
		  }		  
	  .center {text-align: center;}
	  .test_btn1{
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
            border-top-right-radius: 5px;
            border: 1px solid #FFCC80;
            background-color: rgba(0,0,0,0);
            color: #FFCC80;
            padding: 5px;
            text-align: center;
			display :inline-block;
        }
        .test_btn1:hover{
            color:white;
            background-color: #FFCC80;
        }					
</style>
</head>
<body>
<%@include file="../header.jsp"%>
	<br>
	<h1 class="center">신청 완료</h1>
		<table>
		<tr>
			<td><b>신청 파티</b>: ${party.p_title}</p>
	<p class="center"><input type="button" value="파티 상세로 이동" onclick="javascript:window.location='party_page_joined?p_id=${party.p_id}'" class="test_btn1"></p>
	</td>
		</tr>
	
	</table>
	<br>
<%@include file="../footer.jsp"%>

</body>
</html>