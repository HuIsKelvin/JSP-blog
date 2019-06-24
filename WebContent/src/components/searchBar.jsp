<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.form-control {
	color: #000;
}
</style>
</head>
<body>
	<!-- search bar -->
	<form class="input-group searchbar" action="<%= request.getContextPath() %>/search" method="post">
		<input type="text" id="searchbar-test" class="form-control searchbar" name="query" placeholder="Search for...">
		<span class="input-group-btn">
			<button class="btn btn-default" type="submit">Search</button>
		</span>
	</form>
</body>
</html>