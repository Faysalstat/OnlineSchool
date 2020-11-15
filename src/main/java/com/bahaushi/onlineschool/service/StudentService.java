/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bahaushi.onlineschool.service;

import com.bahaushi.onlineschool.repository.StudentRepository;
import model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Faysal
 */
@Service
public class StudentService {

    @Autowired
    private StudentRepository studentRepository;

    public boolean addStudent(Student student) {
        return studentRepository.addStudent(student);
    }

    public Student updateStudent(Student student) {
        return studentRepository.updateStudent(student);
    }

    public Student getStudentById(Integer id) {
        return studentRepository.getStudentById(id);
    }

    public Student getStudentByUserId(Integer id) {
        return studentRepository.getStudentByUserId(id);
    }
}
