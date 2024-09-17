package repositories;

import java.util.List;

import jakarta.persistence.*;
import model.StudentEntity;

public class StudentRepository {
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("student_pu");
	
	public boolean save(StudentEntity student) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction transaction = em.getTransaction();
		
		List<StudentEntity> studentsF = em.createQuery("SELECT s FROM StudentEntity s WHERE s.firstName = '" + student.getfirstName() + "' AND s.lastName = '" + student.getlastName() + "' AND s.age =" + student.getAge(), StudentEntity.class).getResultList();
		
		
		if(studentsF.size() > 0) {
			return false;
		}
		
		transaction.begin();
		em.persist(student);
		transaction.commit();
		em.close();
		emf.close();

		return true;
	}
	
	public void update(StudentEntity student) {
		EntityManager eManager = emf.createEntityManager();
		EntityTransaction tx = eManager.getTransaction();
		
		tx.begin();
		eManager.merge(student);
		tx.commit();
		
	}
	
	public void remove(StudentEntity student) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction transaction = em.getTransaction();
		
		transaction.begin();
		em.remove( em.contains(student) ? student : em.merge(student) );
		transaction.commit();
		em.close();
		emf.close();
	}
	
	public List<StudentEntity> getAll(){
		EntityManager em = emf.createEntityManager();
		List<StudentEntity> studentsEntities = em.createQuery("SELECT st FROM StudentEntity st", StudentEntity.class).getResultList();
		em.close();
		emf.close();

		return studentsEntities;
	}
	
	public StudentEntity getById(Long idL) {
		EntityManager em = emf.createEntityManager();
		StudentEntity student = em.find(StudentEntity.class, idL);
		return student;
	}
	
}
