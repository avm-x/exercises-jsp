package model;

import jakarta.persistence.*;

@Entity
@Table (name = "student")

public class StudentEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long idLong;
	
	@Column(name = "first_name", nullable = false, length = 150)
	private String firstName;
	
	@Column(name = "last_name", nullable = false, length = 150)
	private String lastName;
	
	@Column(name = "age", nullable = false)
	private int age;
	
	public Long getId() {
		return idLong;
	}
	
	public void setId(Long n) {
		idLong = n;
	}
	
	public String getfirstName() {
		return firstName;
	}
	public void setfirstName(String fName) {
		this.firstName = fName;
	}
	public String getlastName() {
		return lastName;
	}
	public void setlastName(String lName) {
		this.lastName = lName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	public String toString() {
		return this.idLong + ", " + this.firstName + ", " + this.lastName + ", " + this.age; 
	}

}
