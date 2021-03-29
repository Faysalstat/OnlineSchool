/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bahaushi.onlineschool.controller;

import com.bahaushi.onlineschool.service.StudentService;
import com.bahaushi.onlineschool.service.UserService;
import model.Courses;
import model.Student;
import model.StudentModel;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

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
        try {
            boolean isEmailExits = userService.checkEmail(user.getEmail());
            if (!isEmailExits){
                user.setUserRole("USER");
                student.setUser(user);
                String encodedpass = passwordEncoder.encode(user.getPassword());
                user.setPassword(encodedpass);
                userService.addUser(user);
                studentService.addStudent(student);
                System.out.println("");
                model.setViewName("login");
            }else{
                model.addObject("emailExists", "This email is Already Exits");
                model.addObject("studentModel", studentModel);
                model.setViewName("registration");
            }
        }
        catch(Exception e) {
            //  Block of code to handle errors
            model.setViewName("errorpage");
        }
        return model;
    }

}
