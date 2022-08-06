<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/header.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .findId-header{
        display:flex;
        justify-content: center;
    }
    #point{
  		display:flex;
        justify-content: center;
    }
    form{
        padding:10px;
    }
    .input-box{
        position:relative;
        display:flex;
        margin:10px 0;
        margin-left: 27%;
        width: 1000px;
    }
    .input-box > input{
        background:transparent;
        border:none;
        border-bottom: solid 1px #ccc;
        padding:20px 0px 5px 0px;
        font-size:14pt;
        width:100%;
    }
    input::placeholder{
        color:transparent;
    }
    input:placeholder-shown + label{
        color:#aaa;
        font-size:14pt;
        top:15px;

    }
    input:focus + label, label{
        color:#8aa1a1;
        font-size:10pt;
        pointer-events: none;
        position: absolute;
        left:0px;
        top:0px;
        transition: all 0.2s ease ;
        -webkit-transition: all 0.2s ease;
        -moz-transition: all 0.2s ease;
        -o-transition: all 0.2s ease;
    }

    input:focus, input:not(:placeholder-shown){
        border-bottom: solid 1px #8aa1a1;
        outline:none;
    }
    input[type=submit]{
        background-color: #8aa1a1;
        border:none;
        color:white;
        border-radius: 5px;
        width:300px;
        height:35px;
        font-size: 14pt;
        margin-top:100px;
    }
    #forgot{
        text-align: right;
        font-size:12pt;
        color:rgb(164, 164, 164);
        margin:10px 0px;
    }
    .checkBtn{
        background-color: #8aa1a1;
        border:none;
        color:white;
        border-radius: 5px;
        width: 100px;
        font-size: 14pt;       
    }
    .checkBtn:hover{
        cursor: pointer;              
    }
    .addressBtn{
    	background-color: #8aa1a1;
        border:none;
        color:white;
        border-radius: 5px;
        width: 130px;
        font-size: 14pt; 
    }   
    .addressBtn{
    	cursor: pointer; 
    }
    img{
        width: 200px;
        height: 200px;
        border-radius: 100px;
    }
    .goPwd{
    	background-color: #8aa1a1;
        border:none;
        color:white;
        border-radius: 5px;
        width:300px;
        height:35px;
        font-size: 14pt;
        margin-top:100px;
    }

    
</style>
</head>
<body>
	<br><br><br><br><br><br><br><br>
	
 	<div class="findId-header">
	    <h2><b>아이디 찾기</b></h2>
	</div>
	<br><br><br>
	
		
		<div class="input-box">
	        <input id="userPhone" type="text" name="userPhone" placeholder="전화번호(숫자만 입력)">
	        <label for="userPhone">전화번호(숫자만 입력)</label>
	        <button type='button' id="phoneBtn" class="checkBtn" onclick="userPhoneCheck();">인증번호 보내기</button>
	    </div>
	    <div class="input-box">
		    <span class="successPhoneChk">전화번호 입력후 인증번호 보내기를 해주십시오.</span>
	    </div>
	
	    <div class="input-box">
	        <input id="phoneCheck" type="text"  placeholder="인증번호" disabled required>
	        <label for="phoneCheck">인증번호</label>
	        <button type='button' id="phoneBtn2" class="checkBtn">본인인증</button>
	    </div>
	    <br><br><br>
	    <div align="center"><span id="userFindID"></span></div>
	    
	    <div align="center">
            <input type="button" value="아이디 찾기" class="goPwd" onclick="findID()"/>
            <input type="button" value="비밀번호 찾으러 가기" class="goPwd" onclick="location.href='findPwd.me'"/>           
        </div>
	

	<script>
		
		function findID(){
			$.ajax({
				url: "findIdForm.me",
				data : {
					userPhone : $("#userPhone").val()
				},
				success : function(result){
					var userId = result;
					console.log(result);
					if($("#phoneCheck").prop("readonly")==true&&$("#userPhone").prop("readonly")==true){
						
						if(userId!=""){
							
							$("#userFindID").text("고객님의 정보로 가입된 아이디는 "+result+" 입니다.");
		    				$("#userFindID").css("color","green");
		    				$("#userFindID").css("font-size","x-large");
		    				$("#userFindID").css("font-weight","bold");
						}else{
							$("#userFindID").text("고객님의 정보로 가입된 아이디가 없습니다.");
		    				$("#userFindID").css("color","black");
		    				$("#userFindID").css("font-size","x-large");
		    				$("#userFindID").css("font-weight","bold");
						}
					}else{
						alert("휴대폰 인증을 해주세요.");
					}
				},
				error : function(){
					console.log("에러");
				}
			})
		}
		
		var code2 = "";
	 	function userPhoneCheck(){
	 		var phone = $("#userPhone").val();
	 		$.ajax({
	 			type:"GET",
	 			url:"phoneCheck?phone="+phone,
	 			cache : false,
	 			success : function(data){
	 				console.log(data);
	 				if(data == "error"){
	 					alert("휴대폰 번호가 올바르지 않습니다.")
	 					$(".successPhoneChk").text("유효한 번호를 입력해주세요.");
	 					$(".successPhoneChk").css("color","red");
	 					$("#userPhone").attr("autofocus",true);
	 				}else{
	 					alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호를 확인 해주세요.");
	 					$("#phoneCheck").attr("disabled",false);        		
	 	        		$(".successPhoneChk").text("인증번호가 발송되었습니다. 본인인증을 해주세요.");
	 	        		$(".successPhoneChk").css("color","green");
	 	        		$("#userPhone").attr("readonly",true);
	 	        		code2 = data;
	 				}
	 			}
	 		});
	 	};
		
	 	$("#phoneBtn2").click(function(){
	 		if($("#phoneCheck").val() == code2){
	 			alert("인증번호가 일치합니다.");
	 			$("#phoneCheck").attr("readonly",true);
	 			$(".goPwd").attr("disabled",false);
	 			
	 		}else{
	 			alert("인증번호를 다시 확인해주세요.").css("color","red");
	 			$("#phoneCheck").attr("autofocus",true);
	 		}
	 	});
	</script>
	
	
</body>
</html>