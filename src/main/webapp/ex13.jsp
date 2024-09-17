<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex13</title>
</head>
<body>
<%@page import = "jakarta.servlet.http.Cookie" %>
	<h1>Exercise 13: Develop an application in JSP to create, read, and delete cookies in JSP.</h1>
	
	<div style="background-color: #D7EDFE; max-width: 500px; display: flex; flex-direction: column; justify-content: center; align-items: center">
		<h2>Cookies CRUD!</h2>
		<form action="ex13.jsp" method="POST">
			<div style="display: flex; flex-direction: column;">
				<label for="cName">Cookie name</label>
				<input type="text" name="cName" placeholder="cookie name" required style="max-width: 300px">
				
				<label for="cValue">Cookie value</label>
				<input type="text" name="cValue" placeholder="cookie value" required style="max-width: 300px">
				
				<input type="submit" value="create new cookie" style="max-width: 300px">
			</div>
		</form>
		
		<table>
			<tr>
				<th><b>cookie name</b></th>
				<th><b>cookie value</b></th>
			</tr>
			
			<%
				// setting a new cookie
				if(request.getMethod().equalsIgnoreCase("POST") && request.getParameter("cName") != null){
					String cookieName = request.getParameter("cName");
					String cookieValue = request.getParameter("cValue");
					
					Cookie cookie = new Cookie(cookieName, cookieValue);
					response.addCookie(cookie);
					
					response.sendRedirect(request.getRequestURI());
				} else {
					// deleting it
					if(request.getParameter("cookieName") != null){
						System.out.println("aaaaaaa");
						Cookie cookie = new Cookie(request.getParameter("cookieName"), "");
						cookie.setMaxAge(0);
						
						response.addCookie(cookie);
					}
					
				}
			
			%>
			
			<%
				Cookie[] cookies = request.getCookies();
				if(cookies != null){
					for(int i = 0; i < cookies.length; i++){
						out.println("<tr>");
						out.println("<td><button style='margin-right: 5px' class='removeCookie' id='" + cookies[i].getName() + "'>X</button>" + cookies[i].getName() + "</td>");
						out.println("<td>" + cookies[i].getValue() + "</td>");
						out.println("</tr>");
					}
				}
			%>
			
		</table>
	</div>
</body>

    <script type="text/javascript">
    	
    	const buttonsNode = document.getElementsByClassName("removeCookie");
    	for(let i = 0; i < buttonsNode.length; i++){
    		buttonsNode[i].addEventListener('click', deleteCookie);
    	}
    
        function deleteCookie(e) {
        	const cookieName = e.target.id;
        	
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "ex13.jsp", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    location.reload();
                }
            };
            xhr.send("cookieName=" + cookieName);
        }
    </script>
</html>