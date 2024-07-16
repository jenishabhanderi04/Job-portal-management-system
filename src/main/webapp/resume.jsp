<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Resume here</title>
</head>
<body>
<h1 style="color:red" align="center">ADD RESUME HERE</h1>
<div align="center">

			<form action="AddResume" method="post" enctype="multipart/from-data">
				Select Resume: 
				<input type="file" name="resume">
				<input type="submit" value="Add Resume">
			</form>
</div>
</body>
</html>