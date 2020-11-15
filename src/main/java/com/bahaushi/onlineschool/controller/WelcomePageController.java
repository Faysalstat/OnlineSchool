/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bahaushi.onlineschool.controller;

import com.bahaushi.onlineschool.service.CourseService;
import com.bahaushi.onlineschool.service.MessageService;
import com.bahaushi.onlineschool.service.StudentService;
import com.bahaushi.onlineschool.service.UserService;
import java.util.List;
import javax.servlet.http.HttpSession;
import model.CourseCount;
import model.Courses;
import model.Message;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Faysal
 */
@Controller
public class WelcomePageController {
    @Autowired
    private CourseService courseService;
    @Autowired
    private UserService userService;
    
    @Autowired
    private MessageService messageService;
    @Autowired
    private StudentService studentService;
    
    
    @GetMapping({"/home", "/"})
    public ModelAndView welcome(ModelAndView model,Authentication authentication,HttpSession httpSession) {
        User user = new User();
        if (authentication!=null) {
            String name = authentication.getName();
            user = userService.getUserByUsername(name);
            httpSession.setAttribute("userSession", user);
            model.addObject("user", user);
        }
        List<Message> unread = messageService.getUnreadMessagesByStudentUserId(user.getId());
        model.addObject("unread",unread);
        CourseCount count = courseService.countCourses();
        
        List<Courses> courselist = courseService.getAllCourse();
        
        model.addObject("count",count);
        model.addObject("courselist",courselist);
        model.setViewName("index");
        return model;
    }
    
}
