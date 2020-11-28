package com.bahaushi.onlineschool.controller;


import com.bahaushi.onlineschool.service.CourseContentService;
import com.bahaushi.onlineschool.service.CourseService;
import com.bahaushi.onlineschool.service.TeacherService;
import com.bahaushi.onlineschool.service.UserService;
import model.Courses;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    TeacherService teacherService;
    @Autowired
    CourseService courseService;
    @Autowired
    CourseContentService courseContentService;
    @Autowired
    UserService userService;

    @GetMapping({"/dashboard", "/"})
    public ModelAndView goToAdminPanel(ModelAndView model) {
        List<Courses> courselist = courseService.getAllCourse();
        model.addObject("courseList",courselist);
        model.setViewName("admin/admindashboard");
        return model;

    }
    @GetMapping("login")
    public ModelAndView gotoLogin(ModelAndView model) {
        model.setViewName("admin/login");
        return model;
    }
//
//    @GetMapping("login")
//    public ModelAndView gotoLogin(ModelAndView model) {
//        model.setViewName("admin/login");
//        return model;
//    }

    @PostMapping("/admin-login")
    public ModelAndView authAdmin(@ModelAttribute("user") User user,
                                  ModelAndView model, HttpSession httpSession) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        User userauth = userService.getUserByUsername(user.getUsername());

        if (encoder.matches(user.getPassword(), userauth.getPassword())) {
            httpSession.setAttribute("admin", userauth);


            model.setViewName("admin/admindashboard");
        } else {
            model.setViewName("admin/login");
        }

        return model;
    }

}
