<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/header.jsp" />
<style>
	   .login-header{
           display:flex;
           justify-content: center;
       }
	   form{
       	   width:500px
           padding:10px;
           margin-left: 34%;
       }
       .input-box{
           position:relative;
           margin:10px 0;
           width:50%;
           
       }
       .input-box > input{
           background:transparent;
           border:none;
           border-bottom: solid 1px #ccc;
           align: center;
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
       #loginBtn{
           background-color: rgba(23, 26, 29, 0.8);
           border:none;
           color:white;
           border-radius: 5px;
           width:70%;
           height:50px;
           font-size: 14pt;
           margin-top:20px;
       }
       #forgot{
           text-align: right;
           margin:10px 0px;
       }
       #socialBtn{
       	width:70%;
       	height:50px;
       }
       #socialLogin{
       	width:100%;	      
       }
       #socialA{
       	width:100%;
       }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br><br><br><br><br><br><br><br>
	
 	<div class="login-header">
	    <h2>Login</h2>
	</div>
	<br><br>
    <form action="login.me" method="post" >
        <div class="input-box">
          	<input id="username" type="text" name="userId" placeholder="아이디">
         	<label for="username">아이디</label>
      	</div>
        <div class="input-box">
          	<input id="password" type="password" name="userPw" placeholder="비밀번호">
          	<label for="password">비밀번호</label>	
                         
	    <div id="forgot">
	      	<a href="findId.me" style="color: black">아이디</a>/<a href="findPwd.me" style="color: black">비밀번호 찾기</a>
	    </div>
	    <div align="center">
        <button type="submit" id="loginBtn">로그인</button>
	    </div>
        <br>
        <div id="socialLogin" align="center">
      		<a href="javascript:kakaoLogin();" id="socialA"><img id="socialBtn" src="./resources/images/kakao_login_medium_wide.png"/></a> 
      		<br><br> 
      		<a href="${urlNaver}"><img id="socialBtn" src="./resources/images/btnG_완성형.png"/></a> 
      		 		               
         </div>
         </div> 

    </form>
                
    <script>
    	window.Kakao.init('25def9456817be2bd9d449ded95b8362');
    	
    	function kakaoLogin(){
    		
        	window.Kakao.Auth.login({
        		scope:'profile_nickname,profile_image,account_email',
        		success: function(authObj){
        			console.log(authObj);
        			window.Kakao.API.request({
        				url:'/v2/user/me',
        				success: res => {
        					const kakao_account = res.kakao_account;
        					const kEmail = res.kakao_account.email;
        					const KName = res.properties.nickname;
        					const kProfile = res.properties.profile_image;
        					console.log(kEmail);
        					console.log(KName);
        					console.log(kProfile);
        					console.log(kakao_account);
        					$.ajax({
                                url : "kakaoLogin.me",
                                data : {
                                	userEmail : kEmail
                                },
                                success: function(result){
                                	console.log(result)
                                	if(result=="Y"){
                                		window.location.href='/checkmate';
                                	}else{
                                		alert("추가 정보 입력이 필요합니다");
                                		location.href='kakaoEnrollForm.me';
                                	}
                                    console.log("성공");
                                },
                                error : function(){
                                	console.log(result)
                                    console.log("실패");
                                }
                            });
        							
        					
        				}
        			});
        		}
        	});
    	};
    	
    </script>
    
</body>

</html>