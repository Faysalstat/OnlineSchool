/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bahaushi.onlineschool.controller;

import com.bahaushi.onlineschool.service.CourseContentService;
import com.bahaushi.onlineschool.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

/**
 *
 * @author Faysal
 */
@Controller
@CrossOrigin
public class CourseContentController {
    @Autowired
    CourseService courseService;
    
    @Autowired
    CourseContentService courseContentService;
    
    
//    @GetMapping("savecoursecontent")
//    public ModelAndView saveContent(@ModelAttribute("content") Coursecontent content,ModelAndView model){
//        model.setViewName("");
//        return model;
//    }
}
