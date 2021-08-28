<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>Main</title>
        <meta name="description" content="서로의 여행 정보를 공유하는 사이트">
        <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
        <link rel="stylesheet" href="css/style.css">
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
            
            
        </style>
    </head>

    <body>
        <header class="page-header wrapper">
            <a href="index.html"><img class="logo" src="category/images/logo2.png" alt="로고"></a>
            <nav>
                <ul class="main-nav">
                    <li><a href="/board">후기페이지</a></li>
                    <li><a href="detail.html">상세페이지</a></li>
                    <li><a href="sign_up_update.html">회원정보페이지</a></li>
                    <li><a href="faq.html">문의페이지</a></li>
                    <li><a href="login.html" style="color: black; font-size: 1.15rem;">로그인</a></li>
                    <li><a href="sign_up.html" style="color: black; font-size: 1.15rem;">회원가입</a></li>
                </ul>
            </nav>
        </header>

        <div class=bgimg>
            <h1>후기</h1>
            <h3>When you walk along the blue valley and the white sky,<br>
            you arrive the green valley.</h3>
        </div>
        <main>
            <div class="board_list_wrap">
                <div class="board_list">
                    <div class="board_list_head">
                        <div class="num">번호</div>
                        <div class="tit">제목</div>
                        <div class="writer">글쓴이</div>
                        <div class="date">작성일</div>
                    </div>
                    
        <!--             <form action="/board" method="get"> -->
                    
                    <div class="board_list_body">
                    <c:forEach var="board" items="${boards}">
                        <div class="item">
							<div class="num">${board.id}</div>
                            <div class="tit"><a href="#">${board.title}</a></div>
                              <div class="writer">${board.user.username}</div> 
                            <div class="date">${board.createDate}</div>
                        </div>
                     </c:forEach>
                    </div>
                    
                <!--    </form> -->
                </div>
                
                <div class="review_paging">
                    <a href="#" class="bt first">처음 페이지</a>
                    <a href="#" class="bt prev">이전 페이지</a>
                    <a href="#" class="num on">1</a>
                    <a href="#" class="num">2</a>
                    <a href="#" class="num">3</a>
                    <a href="#" class="bt next">다음 페이지</a>
                    <a href="#" class="bt last">마지막 페이지</a>
                </div>
            </div>
            <div class="review_grid">
                <input type="button" class="btn_reviewwrite" value="작성하기" onclick="location.href='/board/saveForm'">
            </div>
        </main>
    </body>
</html>