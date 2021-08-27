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
        <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
        <link rel="stylesheet" href="css/style.css">
        <style>
            .grid {
                display: grid;
                gap: 30px;
                grid-template-columns: 1fr 1fr;
                margin: 2%;
            }
            .title {
                border: 1px solid white;
                background-color: rgba(204, 204, 204, .3);
                border-radius:5px;
            }
            p {
                font-size: 20px;
                text-align: center;
            }
            .page-header {
                position: fixed;
                top: 0; left: 50;
                height: 100px;
                background-color: rgba(204, 204, 204, .1);
            }
            input {
                font-size: 20px;
                width: 325px;
                padding: 10px;
                border: 0px;
                outline: none;
                float: left;
            }
            .item :hover{
            	opacity: 0.8;
            }
        </style>
    </head>

    <body>
        <header class="page-header wrapper">
            <a href="/"><img class="logo" src="category/images/logo2.png" alt="로고"></a>
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

        <div class="wrap">
            <h2 class="page-title">슬로건 / 사이트 이름</h2>
            <div class="box"></div>
            <form action="/search" method="get">
            <div class="search">
                <input type="text" name="keyword" placeholder="검색어 입력">
                <button style="border-top-right-radius: 5px; border-bottom-right-radius: 5px;">검색</button>          
            </div>
            </form>
        </div><!-- wrap -->
        
<div class="container">        
<form action="/search/${api.title}" method="get">
<h2 style="color:gray; margin-top:30px; margin-left: 200px;">추천 여행지</h2>

<div class="grid">
	<c:forEach var="random" items="${randomIndex}"> 
		<div class="item" style="cursor:pointer" onclick="location.href='/search/${random.title}'">
		   <img src="${random.thumbnailpath}"><br><br>
		   <div class="title">
		      <p>${random.title}</p>
		   </div>
		</div>		
	</c:forEach>
</div> <!-- grid -->

</form>
</div> 
</body>
</html>