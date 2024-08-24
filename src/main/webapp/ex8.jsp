<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex8</title>
</head>
<body>
	<h1>Exercise 8: Display how many times this page have been visited by current user.</h1>
	
	<%! 
	int n = 0;
	
	int incrementByOne(int number){
		return number + 1;
	}
	
	%>
	
	<%
		if(session.getAttribute("visitTimes") != null){
			n = (int) session.getAttribute("visitTimes");
		}
	%>
	
	<span> You have visited this page:  <%= n %> times!</span>
	
	<% 
		n = incrementByOne(n); 
		session.setAttribute("visitTimes", n);
	%>
</body>
</html>