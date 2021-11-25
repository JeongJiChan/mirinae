<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	window.onload = function() {
		if(${result>0}) {
			alert("마이픽이 삭제되었습니다.");
			location.href = "notice_list.la";
		}else  {
			alert("삭제에 실패하였습니다.");
			history.back();
		}
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>