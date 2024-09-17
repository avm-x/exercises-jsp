<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management</title>
    <link rel="stylesheet" href="css/Ex14.css">
</head>
<body>
<%

			if(request.getParameter("recordToDelete") != null ){
				Long l = Long.valueOf( request.getParameter("recordToDelete") );
				StudentRepository studentRepo = new StudentRepository();
				
				StudentEntity student = studentRepo.getById( l );
				studentRepo.remove(student);
			}

%>
    <h1>Exercise 14: Write a program in JSP to display, insert, update, and delete data from a database table.</h1>
    <div class="container" id="container">

   <div class='form-container' id='registration-form'>
  <h2>Student Registration Form</h2>
  <form action='ex14.jsp/save-student' method='POST'>
    <label for='firstName'>First Name:</label>
    <input type='text' id='firstName' name='firstName' required>
    <label for='lastName'>Last Name:</label>
    <input type='text' id='lastName' name='lastName' required>
    <label for='age'>Age:</label>
    <input type='number' id='age' name='age' required min='18' max='100'>
    <input type='submit' value='Submit'>
  </form>
</div>
   
        <div class="table-container">
            <h2>Student List</h2>
            
            <table>
                <thead>
                    <tr>
	                    <th>id</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Age</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
					<%@page import = "repositories.StudentRepository" %>
                    <%@page import = "java.util.List" %>
                    <%@page import = "model.StudentEntity" %>
                    <%@page import = "jakarta.persistence.*" %>
                    <%
                    
                    StudentRepository studentRepo = new StudentRepository();
                    List<StudentEntity> students = studentRepo.getAll();

                    for(int i = 0; i < students.size() ; i++){
                    	String btnClass = String.valueOf(students.get(i).getId()); 
                    	
                    	out.println("<tr>");
                    	out.println("<td>" + students.get(i).getId() + "</td>");
                    	out.println("<td>" + students.get(i).getfirstName() + "</td>");
                    	out.println("<td>" + students.get(i).getlastName() + "</td>");
                    	out.println("<td>" + students.get(i).getAge() + "</td>");
                    	out.println("<td>" + "<button class='" + btnClass + " delete-btn' id='" + students.get(i).getId() + 
                    			"'>Delete</button>" + "<button class='" + btnClass + " update-btn' id='" + students.get(i).getId()+ "' data-student = '"+ students.get(i).toString() + "'>Update</button>" + "</td>");

                    	out.println("</tr>");
                    }
                    
                	%>
                </tbody>
            </table>
        </div>
    </div>

</body>
<script src="js/Ex14.js"></script>
</html>