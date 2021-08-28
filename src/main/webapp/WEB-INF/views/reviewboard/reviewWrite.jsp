<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            .bgimg {
                background: url(/images/seychelles.png);
                background-size: cover;
                height: 40vh;
                overflow:hidden;
            }
            h1 {
                text-align: center;
                color: white;
                margin-top: 6%;
                font-size:60px;
            }
            h3 {
                text-align: center;
                color: white;
                margin-top:2%
            }
            .review_input {
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            .review_1 {
                border:1px solid rgb(212, 212, 212);
                border-radius: 5px;
                width: 60%;
                margin-top: 2%;
            }
            .review_2 {
                border:1px solid rgb(212, 212, 212);
                border-radius: 5px;
                width: 60%;
                margin-top: 1%;
            }
            .btn_review {
                border:1px solid gray;
                color: white;
                font-weight: bold;
                font-size: 20px;
                background-color: gray;
                width: 150px;
                height: 40px;
                margin-top: 2%;
            }
            
        </style>
    </head>

    <body>
        <header class="page-header wrapper">
            <a href="/"><img class="logo" src="/category/images/logo2.png" alt="로고"></a>
            <nav>
                <ul class="main-nav">
                    <li><a href="/board">후기페이지</a></li>
                    <li><a href="detail.html">상세페이지</a></li>
                    <li><a href="sign_up_update.html">회원정보페이지</a></li>
                    <li><a href="faq.html">문의페이지</a></li>
                    <li><a href="/auth/loginForm" style="color: black; font-size: 1.15rem;">로그인</a></li>
                    <li><a href="/auth/joinForm" style="color: black; font-size: 1.15rem;">회원가입</a></li>
                </ul>
            </nav>
        </header>
        
        <div class=bgimg>
            <h1>후기</h1>
            <h3>When you walk along the blue valley and the white sky,<br>
            you arrive the green valley.</h3>
        </div>
        <form>
            <input type="text" class="review_1" placeholder="제목을 입력해주세요." name="title" id="title">
            <textarea cols="50" rows="10" class="review_2" placeholder="후기를 적어주세요." name="content" id="content"></textarea>
             
        </form>
        
       <input type="button" id="btn-save" class="btn_review" value="등록하기">
        
        <script src="/js/board.js"></script>
    </body>
</html>