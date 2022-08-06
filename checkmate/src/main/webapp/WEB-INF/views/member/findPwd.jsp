<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/header.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.findPwd-header{
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
	
 	<div class="findPwd-header">
	    <h2><b>비밀번호 재설정</b></h2>
	</div>
	<br><br><br>
		<div class="input-box" align="center">
            <input id="userId" type="text" name="userId" placeholder="아이디" required>
            <label for="userId">아이디</label>
        </div>
		
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
	    
	    <div class="input-box">
            <input id="userPwd" type="password" name="userPw" placeholder="새로운 비밀번호" required>
            <label for="userPwd">새로운 비밀번호</label>
        </div>
        <div class="input-box">
	        <span class="pwdCheck1">8~16자 영문,숫자,특수문자를 사용하세요.</span>
        </div>

        <div class="input-box">
            <input id="userPwd2" type="password" name="userPwd2" placeholder="비밀번호 확인" required>
            <label for="userPwd2">비밀번호 확인</label>
        </div>     
        <div class="input-box">
	        <span class="pwdCheck2">동일한 비밀번호를 다시 입력해주세요.</span>
        </div> 
	    
	    <div align="center">
            <input type="button" value="비밀번호 변경" class="goPwd" onclick="findPwd()"/>                   
        </div>
        
        <script>
        	function findPwd(){
        		var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
        		if($("#userPwd").val().length<1 || reg.test($("#userPwd").val())==false){
        			alert("비밀번호를 다시 확인해주세요.");
        		}else if($("#userPwd").val()!=$("#userPwd2").val()){
        			alert("비밀번호를 다시 확인해주세요.");
        		}else if($("#phoneCheck").prop("readonly")==false||$("#userPhone").prop("readonly")==false){
        			alert("휴대폰 인증을 해주세요.");
        		}else{       			
	        		$.ajax({
	        			url : "changePwd.me",
	        			data : {
	        				userId : $("#userId").val(),
	        				userPhone : $("#userPhone").val(),
	        				userPw : $("#userPwd").val()
	        			},
	        			success : function(result){	        				       					
		        				if(result=='1'){
		        					alert("비밀변호가 변경되었습니다.");
		        					location.href='memberLoginForm.me';
		        				}else{
		        					alert("회원님의 정보로 가입된 아이디가 없습니다.");
		        					$("#userId").val('')
		        					$("#userPhone").val('')	
		        				}
	        				
	        			},
	        			error : function(result){
	        				console.log(result);
	        				console.log("에러");
	        			}
	        			
	        		})
        		}
        	}
        	
        	
        	
        	$("#userPwd").on('keyup',function(){		
        		var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
                var pw1 = $("#userPwd").val();
                
        		if(pw1 == ""){
        			$(".pwdCheck1").text("8~16자 영문,숫자,특수문자를 사용하세요.");
        			$(".pwdCheck1").css("color","black");
        		}else if(reg.test(pw1)){	
        			$(".pwdCheck1").text("사용 가능한 비밀번호입니다.");
        			$(".pwdCheck1").css("color","green");
        		}else{			
        			$(".pwdCheck1").text("사용 불가능한 비밀번호 입니다. 8~16자 영문,숫자,특수문자를 사용하세요.");
        			$(".pwdCheck1").css("color","red");
        		}
        	});
        	
        	$("#userPwd2").on('keyup',function(){
        		
        		var pw1 = $("#userPwd").val();
        		var pw2 = $("#userPwd2").val();
        		

        	    if(pw1==pw2 && pw1 != ""){
        			console.log("true");
        			$(".pwdCheck2").text("비밀번호가 일치합니다.");
        			$(".pwdCheck2").css("color","green");
        		}else if(pw1 != pw2){
        			$(".pwdCheck2").text("비밀번호를 다시 확인해주세요.");
        			$(".pwdCheck2").css("color","red");
        			console.log("false");			
        		}else if(pw1 == ""){
        			$(".pwdCheck2").text("동일한 비밀번호를 다시 입력해주세요.");
        			$(".pwdCheck2").css("color","black");
        		}
        		
        	});
        	
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