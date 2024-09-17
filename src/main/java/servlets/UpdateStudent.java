package servlets;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.StudentEntity;
import repositories.StudentRepository;

/**
 * Servlet implementation class UpdateStudent
 */
public class UpdateStudent extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		StudentEntity student = new StudentEntity();
		
		student.setfirstName( req.getParameter("firstName") );
		student.setlastName( req.getParameter("lastName"));
		student.setAge( Integer.valueOf(req.getParameter("age")) );
		student.setId( Long.valueOf(req.getParameter("id")) );
		
		StudentRepository studentRepo = new StudentRepository();
		studentRepo.update(student);
		
		StringBuffer bufferUrl = new StringBuffer(req.getRequestURL());
		String suffix = "/update-student";
		String formatedUrl = bufferUrl.substring(0, bufferUrl.length() - suffix.length());
		
		
		res.sendRedirect(formatedUrl);
	}

}
