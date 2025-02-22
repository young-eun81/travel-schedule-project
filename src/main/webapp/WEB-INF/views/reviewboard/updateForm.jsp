<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../reviewlayout/header.jsp"%>

<div class="container">

	<form>
		<input type="hidden" id="id" value="${board.id}"/>
	
		<div class="form-group">
			<!-- <label for="title">Title</label>  -->
			<input value="${board.title}" type="text" class="form-control" placeholder="Enter title" id="title">
		</div>

		<div class="form-group">
			<!-- <label for="content">Content:</label> -->
			<textarea class="form-control summernote" rows="5" id="content">${board.content}</textarea>
		</div>

	</form>
	<button id="btn-update" class="btn btn-primary">글수정 완료</button>

</div>

<script>
      $('.summernote').summernote({
        tabsize: 2,
        height: 300,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
    </script>
<script src="/js/board.js"></script>
<%@ include file="../reviewlayout/footer.jsp"%>


