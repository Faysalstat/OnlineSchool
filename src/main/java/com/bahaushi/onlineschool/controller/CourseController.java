/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bahaushi.onlineschool.controller;

import com.bahaushi.onlineschool.service.CourseService;
import javax.servlet.ServletContext;
import model.Courses;
import org.springframework.beans.factory.annotation.Autowired;
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
@CrossOrigin
public class CourseController {

    @Autowired
    CourseService courseService;
    @Autowired
    private ServletContext servletContext;

//    @PostMapping("addcourse")
//    public ModelAndView addCourse(@ModelAttribute("course") Courses course, ModelAndView model) {
//        try {
//            courseService.saveCourse(course);
//            model.addObject("jsondata", course);
//            model.setViewName("testjson");
//        } catch (Exception e) {
//
//        } finally {
//        }
//        return model;
//    }

    

}
