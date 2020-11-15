/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bahaushi.onlineschool.service;

import com.bahaushi.onlineschool.repository.TeacherRepository;
import java.util.List;
import model.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Faysal
 */
@Service
public class TeacherService {

    @Autowired
    private TeacherRepository teacherRepository;

    public Teacher addTeacher(Teacher teacher) {
        return teacherRepository.addTeacher(teacher);
    }

    public Teacher updateTeacher(Teacher teacher) {
        return teacherRepository.updateTeacher(teacher);
    }

    public List<Teacher> getAllTeacher() {
        return teacherRepository.getAllTeacher();
    }

    public Teacher getTeacherById(Integer id) {
        return teacherRepository.getTeacherById(id);
    }

    public Teacher getTeacherByUserId(Integer id) {
        return teacherRepository.getTeacherByUserId(id);
    }
}
