/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bahaushi.onlineschool.controller;

import com.bahaushi.onlineschool.service.StudentService;
import com.bahaushi.onlineschool.service.UserService;
import model.Student;
import model.StudentModel;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Faysal
 */
@Controller
public class StudentControl {

    @Autowired
    StudentService studentService;
    @Autowired
    UserService userService;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @PostMapping("registerstudent")
    @CrossOrigin
    public ModelAndView addStudent(
            @ModelAttribute("studentModel") StudentModel studentModel,
            ModelAndView model) {
        Student student = studentModel.getStudent();
        User user = studentModel.getUser();
        user.setUserRole("USER");
        student.setUser(user);
        String encodedpass = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodedpass);
        userService.addUser(user);
        studentService.addStudent(student);
        System.out.println("");
        model.setViewName("login");
        return model;
    }

}
