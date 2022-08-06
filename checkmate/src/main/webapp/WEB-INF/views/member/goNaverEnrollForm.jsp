<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--주소.js-->    
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<form action="naverInsert.me" method="post" enctype="multipart/form-data">
    	<input type="hidden" name="userId" value="${userId}">
    	<input type="hidden" name="userEmail" value="${userEmail}">
    	<div align="center"><H3>프로필 사진</H3></div>
    	<div id="image_container" align="center"><img id="userProfile" src="./resources/images/basic.jpg"></div>
    	<br>
    	<div class="form-group" align="center">
		<input class="userOriginProfile" type="file" name="profile" id="userOriginProfile" onchange="setThumbnail(this);">
		</div>		
    	<br><br>	  
    	              

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
    
    $("#confirmBtn").click(function(){
        if($("#userNick").prop("readonly")==false){
            alert("닉네임 중복확인을 해주세요.");
            return false;
        }else if($("#userName").val().length<1){
        	alert("이름을 입력해주세요.");
        	return false;
        }else if($("#addr1").val().length<1 || $("#addr3").val().length<1){
        	alert("주소를 다시 확인해주세요.");
        	return false;
        }
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
</html>