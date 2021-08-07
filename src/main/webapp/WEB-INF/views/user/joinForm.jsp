<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="form-group">
		<label for="username"> Username:</label> <input type="text" class="form-control" placeholder="Enter username" id="username">
	</div>

	<div>
		<label for="userpassword">password</label> <input type="password" id="userpassword">
	</div>

	<button type="button" id=btn-join>가입</button>


</body>
<script>
	$("#btn-join").click(function() {
    console.log("werwer");
		let data = {
			userid : $("#username").val(),
			password : $("#userpassword").val()
		}
		$.ajax({
			type : "POST",
			url : "/user/join",
			data : JSON.stringify(data),
			contentType : "application/json",
			success : function(resp) {
				alert("회원가입이 완료 되었습니다.")
			}
		})
	})
</script>
</html>