<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>    
    
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>login</title>
        <meta name="description" content="서로의 여행 정보를 공유하는 사이트">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
        <link rel="stylesheet" href="/css/style.css">
        <style>
            .main-container {
                margin-top: 6%;
                margin-left: 10%;
                width: auto;
                height: auto;
                display: grid;
                grid-template-columns: 40% 60%;
            }
            .temp-box {
                margin-left: 20%;
            }
            .box-two {
                display: flex;
                flex-direction: column;
            }
            .gap-box {
                background: #fff;
                height: 20px;
            }
            .boxid {
                width: 350px;
                border:1px solid white;
                border-radius: 5px;
                background-color:rgba(204, 204, 204, .3);
            }
            .boxpasswd {
                width: 350px;
                border:1px solid white;
                border-radius: 5px;
                background-color:rgba(204, 204, 204, .3);
            }
            .btn_login {
                width: 350px;
                border:1px solid white;
                border-radius: 5px;
                background-color:rgba(255, 153, 051, 0.8);
            }
            .btn_kakao {
                width: 350px;
                border:1px solid white;
                border-radius: 5px;
                background-color:rgba(255, 204, 051, 0.8);
            }
            input {
                font-size: 20px;
                width: 325px;
                padding: 10px;
                border: 0px;
                outline: none;
                float: left;
            }
        </style>
    </head>
<body>
        <header class="page-header wrapper">
            <a href="/"><img class="logo" src="/category/images/logo2.png" alt="로고"></a>
            <nav>
                <ul class="main-nav">
                    <li><a href="review.html">후기페이지</a></li>
                    <li><a href="detail.html">상세페이지</a></li>
                    <li><a href="faq.html">문의페이지</a></li>
                    <li></li>
                    <c:choose>
                	<c:when test="${empty principal}">
					<li><a href="/auth/loginForm" style="color: black; font-size: 1.15rem;">로그인</a></li>
                    <li><a href="/auth/joinForm" style="color: black; font-size: 1.15rem;">회원가입</a></li>
					</c:when>
					<c:otherwise>
					<li><a href="sign_up_update.html">회원정보페이지</a></li>
					<li><a href="/logout">로그아웃</a></li>
					</c:otherwise>
					</c:choose>
                </ul>
            </nav>
        </header>

        <main>

            <form action="/auth/loginProc" method="post" onsubmit="Login__submit(this); return false;" class="main-container">
                <div class="temp-box" style="margin-top: -10%; margin-left: 10%;">
                    <img src="/images/background.png" alt="로그인 이미지">
                </div><!-- temp-box -->
                <div class="temp-box box-two">
                    <div class="border-dee3eb">
                    	<c:if test="${param.error}">
   							<p style="color: red; font-weight: 700">${exception}</p>
						</c:if>
						<br>
                        <h3 style="margin-left: 15px;">로그인</h3>
                    </div>
                    <div class="gap-box"></div>
                    <div class="boxid">
                        <input type="text" placeholder="ID" id="username" name="username">
                    </div>
                    <div class="gap-box"></div>
                    <div class="boxpasswd">
                        <input type="password" placeholder="비밀번호(8자리 이상)" id="password" name="password">
                    </div>
                    <div class="gap-box"></div>
                    <div class="btn_login">
                    <button class="btn-login">로그인</button>
                    <!-- 
                        <input type="button" id="btn-login" value="로그인">
                     -->   
                    </div>
                    <div class="gap-box"></div>
                    <div class="btn_kakao">
	                    <a href="https://kauth.kakao.com/oauth/authorize
						?client_id=5cc502515c3774ea8102a09ba2ba1bcc
						&redirect_uri=http://localhost:8111/auth/kakaologin
						&response_type=code">
                        <input type="button" value="카카오톡 로그인">
                        </a>
                    </div> 
						<div style="margin: 10px 0">
						<span class="forgotId"><a style="color: orange;text-decoration:underline" href="#" onclick="document.getElementById('idBox').style.display='block'">ID</a> 찾기</span>
						</div>
						<div>
						<span class="psw"><a href="#" style="color: orange; text-decoration:underline">비밀번호</a> 찾기</span>
						</div>

                    <div class="gap-box"></div>
                    <div class="boxes">
                        <span><p>저희 사이트가 처음이세요?</p></span>
                        <span><a href="/auth/joinForm" style="text-decoration:underline; color:skyblue">회원가입하기</a></span>
                    </div>
                </div>
            </form><!-- main-container-->
        </main>
       
        
<div id="idBox2" class="modal">
	<div class="modal-content animate">
		<div class="container" style="text-align: center">
			<h1><b>ID 찾기</b></h1>
		</div>
		<br>
		<div class="container-email">
	     	<h3> ✔ 검색 결과  </h3>
		</div>
		<hr><br>
		<div>
			<h5>
				<span> 가입하신 아이디는 ' <b>${userId}</b> ' 입니다. </span>
			</h5><br>
	 	</div>
		<div class="container" style="background-color:#f1f1f1">
     		<button type="button" onclick="document.getElementById('idBox2').style.display='none'" class="cancelbtn">Cancel</button>
  		<!-- document.getElementById('idBox').style.display='none' -->
   		</div>
  	</div>
</div>

<script>
// Get the modal
var modal = document.getElementById('idBox2');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

window.onload = function(event) {
	var modal = document.getElementById('idBox2').style.display="block";
}

</script>
</body>
</html>