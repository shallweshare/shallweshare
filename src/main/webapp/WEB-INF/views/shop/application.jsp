<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

         h2 {padding-left:0%;
         	text-align: center;}
         .a {text-align: center;}

/* 		버튼 호버 색상 */
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
        h1{
        	text-align:center
        }					
</style>

<!-- 	<link href="../resources/css/font.css" rel="stylesheet" /> -->
</head>
<body>
<%@include file="../header.jsp"%>
<br>
	<h1><strong>파티 신청</strong></h1>
		<table>
		<form id="pay_form" method="post" action="application_process">
			<input type="hidden" name="a_price" value="${party.p_price}">
			<input type="hidden" name="p_id" value="${party.p_id}"> <input
				type="hidden" name="u_id" value="${sessionScope.u_id}">
			<h2>파티 번호</h2>
			<table>
				<tr>
					<td>${party.p_id}</td>
				</tr>
			</table>
			<h2>파티 제목</h2>
			<table>
				<tr>
					<td>${party.p_title}</td>
				</tr>
			</table>
			<h2>결제 금액</h2>
			<table>
				<tr>
					<td>${party.p_price}원</td>
				</tr>
			</table>
			<h2>결제 방법 선택</h2>
			<table>
				<tr>
					<td><label><input type="radio" name="a_payment"
							value="카카오페이">카카오페이 </label> <label><input type="radio"
							name="a_payment" value="무통장입금">무통장입금</label></td>
				</tr>
			</table>
			<br>
			<div class="a">
				<button id="pay" class="test_btn1">신청하기</button>
			</div>
		</form>
	</table>
	<br>
	<%@include file="../footer.jsp"%>

</body>
</html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type='text/javascript'>
	$('#pay').on('click', function(e) {
		e.preventDefault();
		var a_payment = $("input[type=radio][name=a_payment]:checked").val();
		if($("input[type=radio][name=a_payment]:checked").is(':checked')){
			if(a_payment == '카카오페이'){
				//가맹점 식별코드
				IMP.init('imp52221476');
				IMP.request_pay({
					pg : 'kakaopay',
					pay_method : 'card',
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : '${party.p_title}', //결제창에서 보여질 이름
					amount : ${party.p_price}, //실제 결제되는 가격
					buyer_email : 'iamport@siot.do',
					buyer_name : '구매자이름',
					buyer_tel : '010-1234-5678',
					buyer_addr : '서울 강남구 도곡동',
					buyer_postcode : '123-456'
				}, function(rsp) {
					console.log(rsp);
					if (rsp.success) {
						var msg = '결제가 완료되었습니다.';
						msg += '고유ID : ' + rsp.imp_uid;
						msg += '상점 거래ID : ' + rsp.merchant_uid;
						msg += '결제 금액 : ' + rsp.paid_amount;
						msg += '카드 승인번호 : ' + rsp.apply_num;
						var actionForm =$("#pay_form");
						const a_completed = $("<input type='hidden' value='T' name='a_completed'>");
						actionForm.append(a_completed);
						console.log(actionForm);
						actionForm.find("input[name='p_id']").val($(this).attr("href"));
						actionForm.submit();
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;
					}
					alert(msg);
				});

			}else{
				var actionForm =$("#pay_form");
				const a_completed = $("<input type='hidden' value='T' name='a_completed'>");
				actionForm.append(a_completed);
				console.log(actionForm);
				actionForm.find("input[name='p_id']").val($(this).attr("href"));
				actionForm.submit();
			}
		}else{
			alert('결제 수단을 선택해주세요.');
		}
		
	});
</script>