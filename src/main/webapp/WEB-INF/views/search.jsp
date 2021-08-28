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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
        <!-- 브라우저 css 초기화 url -->
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <header class="page-header wrapper">
            <a href="/"><img class="logo" src="category/images/logo2.png" alt="로고"></a>
            <nav>
                <ul class="main-nav">
                    <li><a href="/board">후기페이지</a></li>
                    <li><a href="/faq">문의페이지</a></li>
                    <li></li>
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
        
<div class="container">

<h1>검색결과 : ${keywordList}</h1> <br>

<c:forEach var="api" items="${apiList}"><br>
	
<div class="card" onclick="location.href='/search/${api.title}'" style="max-width: 900px; margin: 0 auto; border-color: #b8b8b8; cursor:pointer">
	<form action="/search/${api.title}" method="get">
    <div class="card-body" style="padding:0;">
    	<div style="display: block; width: 100%; max-width: 300px; float:left;">
    	<img src="${api.thumbnailpath}">
    	</div> <br><br>
		<h4 style="text-align: center">${api.title}</h4><br>
      	<p class="card-text" style="text-align: center">${api.address}</p>
     </div>
     </form>
     
</div>

</c:forEach> 

</div>

<c:choose>
<c:when test="${empty apiList}">
<h2 style="text-align: center; margin-top: 150px; margin-bottom: 330px">검색 결과가 없습니다.</h2>
</c:when>
<c:otherwise></c:otherwise>
</c:choose>

        
    </body>
</html>