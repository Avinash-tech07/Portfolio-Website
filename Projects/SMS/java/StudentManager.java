package com.edumanage.backend;

import java.util.ArrayList;
import java.util.List;

// 1. Abstraction & Inheritance: Base class for any human entity in the system
abstract class Person {
    protected int id;
    protected String name;
    protected String email;

    public Person(int id, String name, String email) {
        this.id = id;
        this.name = name;
        this.email = email;
    }

    // Abstract method to be implemented by subclasses (Polymorphism)
    public abstract String getRole();
}

// 2. Encapsulation: The Student class hides internal state and provides accessors
public class Student extends Person {
    private String course;
    private String status;

    public Student(int id, String name, String email, String course, String status) {
        super(id, name, email); // Call to parent constructor
        this.course = course;
        this.status = status;
    }

    // Getters and Setters protect the data
    public String getCourse() { return course; }
    public void setCourse(String course) { this.course = course; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    @Override
    public String getRole() {
        return "Student";
    }
    
    @Override
    public String toString() {
        return "Student[ID=" + id + ", Name=" + name + ", Course=" + course + "]";
    }
}

// 3. Service Layer for handling data operations (to be connected with SQL later)
class StudentService {
    private List<Student> databaseMock = new ArrayList<>();

    public void addStudent(Student student) {
        databaseMock.add(student);
        System.out.println("Saved to database: " + student.toString());
    }

    public List<Student> getAllStudents() {
        return databaseMock;
    }
    
    public static void main(String[] args) {
        // Application Entry Point
        StudentService service = new StudentService();
        Student newStudent = new Student(101, "Alice Johnson", "alice@example.com", "Java Full Stack", "Active");
        
        service.addStudent(newStudent);
    }
}