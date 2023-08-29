<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form>
	<label>empno</label>
	<input type="text" ></br></br>
	<label>deptno</label>
	<input type="text" ></br></br>
	<label>empname</label>
	<input type="text" ></br></br>
	<label>job</label>
	<input type="text" ></br></br>
	<label>salary</label>
	<input type="text" ></br></br>
	</form>
	<form action="emplist">
	<button type="submit" value="view">view</button>
	</form></br></br>
	<form action="addrecord" method="post">
	<button type="submit" value="add" >add</button>
	</form>
	
</body>
</html>