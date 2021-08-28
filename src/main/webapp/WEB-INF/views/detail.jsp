<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Main</title>
<meta name="description" content="서로의 여행 정보를 공유하는 사이트">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<link rel="stylesheet" href="/css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>
.page-header {
	position: fixed;
	background-color: rgba(204, 204, 204, .1);
}

.title {
	border-bottom: 3px solid gray;
	margin: 8% 0 0 7%;
	padding-left: 20px;
}

.boxes {
	display: grid;
	grid-template-columns: 81% 19%;
}

.btn_review {
	margin: 30% 0 0 7%;
	border: 1px solid white;
	width: 200px;
	height: 60px;
	border-radius: 5px;
	background-color: rgba(255, 153, 051, 0.8);
	text-align: center;
	padding: 12px;
	color: white;
	font-size: 20px;
}

.boxes_two {
	display: grid;
	grid-template-columns: 50% 50%;
}

.inbox {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.date {
	margin: 3% 0 0 5%;
	border-bottom: 1px solid gray;
	width: 800px;
}

.date2 {
	border: 1px solid gray;
	border-radius: 20px;
	width: 800px;
	margin: 3% 0 0 5%;
}

.boxes_three {
	border: 1px solid gray;
	border-radius: 20px;
	width: 90%;
	height: 500px;
	margin: 3% 0 5% 5%;
}

.mini_title {
	margin: 2% 0 0 10%;
}

.btn {
	border: 3px solid rgba(255, 153, 051, 0.8);
	width: 130px;
	height: 40px;
	border-radius: 10px;
	color: rgba(255, 153, 051, 0.8);
	font-weight: bold;
	margin: 30px 0 0 0;
}

.mini_box {
	display: grid;
	grid-template-columns: 70% 10% 10%;
}

.date_1 {
	margin: 2% 0 0 3%;
	border-bottom: 1px solid gray;
	width: 200px;
}

.date_2 {
	margin: 0 0 0 10px;
	border-bottom: 1px solid gray;
	width: 60%;
}

.btn_commit {
	border: 3px solid rgba(255, 153, 051, 0.8);
	width: 130px;
	height: 40px;
	border-radius: 10px;
	color: rgba(255, 153, 051, 0.8);
	font-weight: bold;
	margin-left: 40px;
}

html, body {
	/* height: 100%;  IE에서 지도위치가 브라우저 하단에 고정되는 현상 발생해서 삭제 (2013-05-16)  */
	margin: 0;
	padding: 0;
}

#map-canvas, #map_canvas {
	width: 700px; /* 구글 지도 넓이 */
	height: 600px; /* 구글 지도 높이 */
	font-size: 12px;
}

/* 말풍선관련 css 시작 */
.map_Heading { /* 말풍선 타이틀(회사명) css */
	line-height: 30px;
	font-size: 20px;
	font-weight: bold;
	color: #30C;
}

.map_Content { /* 말풍선 내용 css */
	font-size: 12px;
	color: #333;
}

/* 말풍선 회사홈페이지 링크 css */
a:link.map_Content {
	text-decoration: none;
	color: #333;
}

a:active.map_Content {
	text-decoration: none;
	color: #333;
}

a:visited.map_Content {
	text-decoration: none;
	color: #333;
}

a:hover.map_Content {
	text-decoration: none;
	color: #A2002E;
}
/* 말풍선관련 css 끝 */
@media print {
	html, body {
		height: auto;
	}
	#map_canvas {
		height: 650px;
	}
}
</style>
</head>

<body>
	<div class="container">
		<header class="page-header wrapper">
			<a href="/"><img class="logo" src="/category/images/logo2.png"
				alt="로고"></a>
			<nav>
				<ul class="main-nav">
					<li><a href="review.html">후기페이지</a></li>
					<li><a href="detail">상세페이지</a></li>
					<li><a href="faq.html">문의페이지</a></li>
					<li></li>
					<c:choose>
						<c:when test="${empty principal}">
							<li><a href="/auth/loginForm"
								style="color: black; font-size: 1.15rem;">로그인</a></li>
							<li><a href="/auth/joinForm"
								style="color: black; font-size: 1.15rem;">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="sign_up_update.html">회원정보페이지</a></li>
							<li><a href="/logout">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</header>
		<form method="get">
			<div class="boxes">
				<div>
					<h1 class="title">${content.title}</h1>
				</div>
				<div class="btn_review">
					<input type="button" value="후기 작성하기"
						onclick="location.href='review.html'">
				</div>
			</div>
			<img src="${content.imgpath}"
				style="width: 90%; margin: 3% 0 0 5%; height: 50vh;">
			<div class="boxes_two">
				<div class="inbox">
					<input type="text" class="date" placeholder="주소"
						value="${content.address}">
					<textarea cols="50" rows="20" class="date2" placeholder="간단한 소개글">${content.instruction}</textarea>
				</div>
				<div id="map"> <!-- 카카오 지도 -->
					<table style=""> <!-- 카카오 지도 설명 => 이 부분이 없으면 지도가 안나옴 -->
					<tr>
						<td style=""><table style="">
								<tr>
									<td style=""><table style="">
											<tr>
												<td style="">
												<div id="map_canvas"
											style="border: 1px solid #ccc; margin: 0 0 0px 0;"></div>
										</td>
									</tr>
								</table></td>
							</tr>
						</table></td>
					</tr>
				</table>
				</div>

			</div>
			<div class="boxes_three">
				<div class="mini_box">
					<h1 class="mini_title">사람들의 한줄평</h1>
					<input type="button" class="btn" value="수정"> <input
						type="button" class="btn" value="삭제">
				</div>
				<div>
					<input type="text" class="date_1" placeholder="작성자"> <input
						type="date" class="date_1" min="1990-01-01" max="2021-08-31"
						disabled style="margin-left: 10px;"> <input type="text"
						class="date_2" placeholder="간단한 소개글을 작성해주세요.">
				</div>
				<div>
					<input type="text" class="date_1" placeholder="작성자"> <input
						type="date" class="date_1" min="1990-01-01" max="2021-08-31"
						disabled style="margin-left: 10px;"> <input type="text"
						class="date_2" placeholder="간단한 소개글을 작성해주세요.">
				</div>
				<div>
					<input type="text" class="date_1" placeholder="작성자"> <input
						type="date" class="date_1" min="1990-01-01" max="2021-08-31"
						disabled style="margin-left: 10px;"> <input type="text"
						class="date_2" placeholder="간단한 한줄평을 작성해주세요.">
				</div>
				<div>
					<input type="text" placeholder="한줄평을 입력해주세요."
						style="margin: 11% 0 0 3%; border-bottom: 1px solid gray; width: 75%;">
					<input type="button" class="btn_commit" value="등록">
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=62da32945b5c454aa1ead3fcbcb82fe4"></script>
	<script>
       var container = document.getElementById('map');
       var options = {
           center: new kakao.maps.LatLng(${content.latitude}, ${content.longitude}),
           level: 8
       };

       var map = new kakao.maps.Map(container, options);


       // 지도 줌 컨트롤러

       // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
       var mapTypeControl = new kakao.maps.MapTypeControl();

       // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
       // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
       map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

       // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
       var zoomControl = new kakao.maps.ZoomControl();
       map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

       
       // 지도 마커 부분

       // 지도에 마커를 표시합니다 
       var marker = new kakao.maps.Marker({
           map: map, 
           position: new kakao.maps.LatLng(${content.latitude}, ${content.longitude})
       });

       // 커스텀 오버레이에 표시할 컨텐츠 입니다
       // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
       // 별도의 이벤트 메소드를 제공하지 않습니다 
       var content = '<div class="wrapp">' + 
                   '    <div class="info">' + 
                   '        <div class="title">' + 
                   '            ${content.title}' + 
                   '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
                   '        </div>' + 
                   '        <div class="body"> <br>'  +   
                   '                <div class="ellipsis">${content.address}</div>' +   
                   '        </div>' + 
                   '    </div>' +    
                   '</div>';

       // 마커 위에 커스텀오버레이를 표시합니다
       // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
       var overlay = new kakao.maps.CustomOverlay({
           content: content,
           map: map,
           position: marker.getPosition()       
       });

       // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
       kakao.maps.event.addListener(marker, 'click', function() {
           overlay.setMap(map);
       });

       // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
       function closeOverlay() {
           overlay.setMap(null);     
       }
      </script>
</body>
</html>

