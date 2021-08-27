<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>Main</title>
        <meta name="description" content="서로의 여행 정보를 공유하는 사이트">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
        <link rel="stylesheet" href="/css/style.css">
        <style>
        .box-two {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .gap-box {
            background: #fff;
            height: 5px;
        }
        .boxes {
            display: flex;
            flex-direction: row;
            margin-left: 0%;
        }
        .boxid {
            width: 420px; 
            border:1px solid white;
            border-radius: 5px;
            background-color:rgba(204, 204, 204, .3);
        }
        .btn_check {
            border:3px solid rgba(255, 153, 051, 0.8);
            width: 160px;
            margin-left: 20px;
            border-radius: 10px;
        }
        .boxpasswd {
            width: 600px;
            border:1px solid white;
            border-radius: 5px;
            background-color:rgba(204, 204, 204, .3);
        }
        .password_check {
            width: 600px;
            border:1px solid white;
            border-radius: 5px;
            background-color:rgba(204, 204, 204, .3);
        }
        .name {
            width: 600px;
            border:1px solid white;
            border-radius: 5px;
            background-color:rgba(204, 204, 204, .3);
        }
        .email {
            width: 600px;
            border:1px solid white;
            border-radius: 5px;
            background-color:rgba(204, 204, 204, .3);
        }
        .birthday {
            width: 600px;
            border:1px solid white;
            border-radius: 5px;
            background-color:rgba(204, 204, 204, .3);
        }
        .btn_sign_up {
            width: 350px;
            border:1px solid white;
            border-radius: 5px;
            background-color:rgba(255, 153, 051, 0.8);
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
        	<div class="main-contianer">
            <form>
	            <div class="temp-box box-two">
	                <div class="sign_up">
	                    <h2>회원가입</h2>
	                </div>
	                <div class="gap-box"></div>
               		 <div style="margin-left: -505px; margin-bottom: 5px;">아이디</div><div class="boxes">
                    	<div class="boxid">
                        	<input type="text" name="username" id="username" placeholder="ID">
                   		</div>
                    	<div class="btn_check">
                        	<input type="button" value="중복확인" style="margin-left: -80px; color:rgba(255, 153, 051, 0.8); font-weight:bold;">
                    	</div>
                	</div>
	                <div class="gap-box"></div>
	                <label for="password" style="margin-left: -490px; margin-bottom: 5px">비밀번호</label>
	                <div class="boxpasswd">
	                    <input type="password" name="password" id="password" placeholder="비밀번호(8자리 이상)">
	                </div>

	                <div class="gap-box"></div>
	                <label for="passwd_check" style="margin-left: -450px; margin-bottom: 5px">비밀번호 확인</label>
	                <div class="password_check">
	                    <input type="password" name="passwd_check" placeholder="비밀번호를 다시 입력해주세요.">
	                </div>
	                <div class="gap-box"></div>
	                <label for="name" style="margin-left: -520px; margin-bottom: 5px">이름</label>
	                <div class="name">
	                    <input type="text" name="name" id="name" placeholder="실명을 입력하세요.">
	                </div>
	                <div class="gap-box"></div>
	                <label for="userEmail" style="margin-left: -470px; margin-bottom: 5px">이메일 주소</label>
	                <div class="email">
	                    <input type="email" name="userEmail" id="userEmail" placeholder="이메일 주소를 입력해주세요.">
	                </div>
	                <div class="gap-box"></div>
	                <label for="birth" style="margin-left: -490px; margin-bottom: 5px">생년월일</label>
	                <div class="birthday">
	                    <input type="date" name="birth" id="birth" min="1980-01-01" max="2021-08-31">
	                </div>
                	<div class="btn_sign_up" style="margin-top: 20px; color:#fff">
                    <input type="button" id="btn-save" value="회원가입">
                </div>
	            </div>
            </form>
        </div><!-- main-container-->
        </main>
        
    <script src="/js/user.js"></script>    
        
    </body>
</html>