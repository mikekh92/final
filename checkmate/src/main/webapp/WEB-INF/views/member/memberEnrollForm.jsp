<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--주소.js-->    
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- jQuery -->
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>CHECKMATE 회원가입</title>
<jsp:include page="../common/header.jsp" />
<style>
    #logonEnrollHeader{
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
        width:400px;
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


</style>
</head>
<body>

    <br><br><br><br><br>
    
    <form action="insert.me" method="post" enctype="multipart/form-data">
    
    	<div align="center"><H3>프로필 사진</H3></div>
    	<div id="image_container" align="center"><img id="userProfile" src="./resources/images/basic.jpg"></div>
    	<br>
    	<div class="form-group" align="center">
		<input class="userOriginProfile" type="file" name="profile" id="userOriginProfile" onchange="setThumbnail(this);">
		</div>		
    	<br><br>	  
    	
    	<div class="input-box" align="center">
            <input id="userId" type="text" name="userId" placeholder="아이디" required>
            <label for="userId">아이디</label>
            <button type="button" id="idBtn" class="checkBtn">중복 확인</button>
        </div>
        <div class="input-box" align="center">
	        <span class="idCheck">6~16자 영문,숫자를 사용하세요.</span>
        </div>

        <div class="input-box">
            <input id="userPwd" type="password" name="userPw" placeholder="비밀번호" required>
            <label for="userPwd">비밀번호</label>
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

        <div class="input-box">
            <input id="userName" type="text" name="userName" placeholder="이름">
            <label for="userName">이름</label>
        </div>

        <div class="input-box">
            <input id="userNick" type="text" name="userNick" placeholder="닉네임" required>
            <label for="userNick">닉네임</label>
            <button type="button" id="nickBtn" class="checkBtn">중복 확인</button>
        </div>
        <div class="input-box">
	        <span class="nickCheck">3~10자를 사용하세요.</span>
        </div>

		<div class="input-box">
            <input id="userEmail" type="email" name="userEmail" placeholder="이메일" required>
            <label for="userEmail">이메일</label>
            <button type="button" id="emailBtn" class="checkBtn">중복 확인</button>
        </div>

        <div class="input-box" align="center">
            <input id="addr1" type="text" readonly="readonly" placeholder="우편번호">
            <label for="addr1">우편번호</label>
            <button type="button" class="addressBtn" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
        </div>

        <div class="input-box" align="center">
            <input placeholder="도로명 주소" id="addr2" type="text" readonly="readonly" />
            <label for="addr2">도로명 주소</label>
        </div>		
		
        <div class="input-box" align="center">
            <input placeholder="상세주소"  id="addr3" type="text"/>
            <label for="addr3">상세주소</label>           
        </div>
        <input type="hidden" name="userAddress" id="userAddress"/>
        
                
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
        
        <div align="center">
            <input type="submit" value="가입" id="confirmBtn"/>
        </div>
            
    </form>



<script>	
	//프로필 파트
	function setThumbnail(inputFile){
		
		if(inputFile.files.length==1){
				
			var reader = new FileReader();
			reader.readAsDataURL(event.target.files[0]);
			
			reader.onload = function(event){
			$("#userProfile").attr("src",event.target.result);
			};		
		}else{
			$("#userProfile").attr("src",null);
		}
	
	};
	

    //아이디 파트
	$("#userId").on('keyup',function(){
		
		var regId = /^[a-zA-Z][0-9a-zA-Z]{5,15}$/;
		var id = $("#userId").val();
		if(id==""){
			$(".idCheck").text("6~16자 영문,숫자를 사용하세요.");
			$(".idCheck").css("color","black");
			
		}else if(regId.test(id)){
			$(".idCheck").text("사용 가능한 아이디입니다. 중복 확인을 해주세요.");
			$(".idCheck").css("color","green");
		}else{
			$(".idCheck").text("사용이 불가능한 아이디입니다.");
			$(".idCheck").css("color","red");
		}
	});
    
    $("#idBtn").click(function(){
    	
    	$.ajax({
    		url : "idcheck.me",
    		data : {
    			userId : $("#userId").val()
    		},
    		success : function(result){
    			console.log(result)
    			if(result=="N"){
    				alert("사용 불가능한 아이디입니다. 다시 입력해 주세요");
    				$("#userId").val('');
    				$("#userId").focus();
    				$(".idCheck").text("6~16자 영문,숫자를 사용하세요.");
    				$(".idCheck").css("color","black");
    			}else{
    				alert("사용 가능한 아이디입니다.");
    				$("#userId").attr("readonly","true");
    			}
    		},
    		error : function(result){
    			console.log(result)
    			console.log("오류");
    		}
    	})
    	
    });

	
    
    //비밀번호 파트
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
		
	//휴대전화 파트
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
		}else{
			alert("인증번호를 다시 확인해주세요.").css("color","red");
			$("#phoneCheck").attr("autofocus",true);
		}
	});
	
	//닉네임파트
	$("#userNick").on('keyup',function(){
		console.log("실행");
		var $userNick = $("#userNick").val();
		if($userNick == ""){
			$(".nickCheck").text("3~10자를 사용하세요.");
			$(".nickCheck").css("color","black");
		}else if($userNick.length>=3&&$userNick.length<=10){	
			$(".nickCheck").text("사용 가능한 닉네임입니다. 중복 확인을 해주세요.");
			$(".nickCheck").css("color","green");
		}else{
			$(".nickCheck").text("사용 불가능한 닉네임입니다.");
			$(".nickCheck").css("color","red");
		}			
	});
	
	//이메일파트
	$("#emailBtn").click(function(){
    	
    	$.ajax({
    		url : "emailCheck.me",
    		data : {
    			userEmail : $("#userEmail").val()
    		},
    		success : function(result){
    			console.log(result)
    			if(result=="N"){
    				alert("사용중인 이메일입니다. 다시 입력해 주세요");
    				$("#userEmail").val('');
    				$("#userEmail").focus();

    			}else{
    				alert("사용 가능한 이메일입니다.");
    				$("#userEmail").attr("readonly","true");
    			}
    		},
    		error : function(result){
    			console.log(result)
    			console.log("오류");
    		}
    	})
    	
    });
	
	
	//닉네임파트
	$("#nickBtn").click(function(){
    	
    	$.ajax({
    		url : "nickCheck.me",
    		data : {
    			userNick : $("#userNick").val()
    		},
    		success : function(result){
    			console.log(result)
    			if(result=="N"){
    				alert("사용 불가능한 닉네임입니다. 다시 입력해 주세요");
    				$("#userNick").val('');
    				$("#userNick").focus();
    				$(".nickCheck").text("3~10자를 사용하세요.");
    				$(".nickCheck").css("color","black");
    			}else{
    				alert("사용 가능한 닉네임입니다.");
    				$("#userNick").attr("readonly","true");
    			}
    		},
    		error : function(result){
    			console.log(result)
    			console.log("오류");
    		}
    	})
    	
    });
	
	//주소 파트
    function execPostCode() {
        new daum.Postcode({
            oncomplete: function(data) {
               
               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 도로명 조합형 주소 변수
              
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
               }
              
               if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               
               if(extraRoadAddr !== ''){
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }
               
               if(fullRoadAddr !== ''){
                   fullRoadAddr += extraRoadAddr;
               }
                   
               document.getElementById('addr1').value = data.zonecode; 
               document.getElementById('addr2').value = fullRoadAddr;
                           
           }
        }).open();
    };
    
    
    //최종 회원가입 파트
    $("#confirmBtn").click(function(){
    	var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
    	
    	
    	
        if($("#userId").prop("readonly")==false && $("#userNick").prop("readonly")==false){
            alert("아이디와 닉네임 중복확인을 해주세요.");
            return false;
        }else if($("#userPwd").val()!=$("#userPwd2").val()){
        	alert("비밀번호를 다시 확인해주세요.");
        	return false;
        }else if($("#userPwd").val().length<1 || reg.test($("#userPwd").val())==false){
        	alert("비밀번호를 다시 확인해주세요.");
        	return false;
        }else if($("#userName").val().length<1){
        	alert("이름을 입력해주세요.");
        	return false;
        }else if($("#userEmail").prop("readonly")==false){
        	alert("이메일 중복확인을 해주세요");
        	return false;
        }else if($("#addr1").val().length<1 || $("#addr3").val().length<1){
        	alert("주소를 다시 확인해주세요.");
        	return false;
        }
//         else if($("#phoneCheck").prop("readonly")==false){
//             alert("휴대폰 인증이 필요합니다.");       
//             return false;
//         }else if($("#userPhone").prop("readonly")==false){
//         	alert("휴대폰 인증이 필요합니다.");       
//             return false;
//         }
        else{
        	alert("환영합니다.");    
        	var address = $('#userAddress').val();
        	address += $('#addr2').val();
        	address += ", "+$('#addr3').val();
        	$('#userAddress').val(address);
        	return true;
        }
    });
</script>
</body>
<jsp:include page="../common/footer.jsp" />
</html>