package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.StudentEntity;
import repositories.StudentRepository;



public class SaveStudent_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		StudentEntity studentEntity = new StudentEntity();
		StudentRepository studentRepository = new StudentRepository();
		
		studentEntity.setfirstName(req.getParameter("firstName"));
		studentEntity.setlastName(req.getParameter("lastName"));
		studentEntity.setAge(Integer.valueOf(req.getParameter("age")) );
		
		

		boolean operation = studentRepository.save(studentEntity);
		
	
		StringBuffer bufferUrl = new StringBuffer(req.getRequestURL());
		String suffix = "/save-student";
		String formatedUrl = bufferUrl.substring(0, bufferUrl.length() - suffix.length());
		
		
		res.sendRedirect(formatedUrl);
	}
	
}
