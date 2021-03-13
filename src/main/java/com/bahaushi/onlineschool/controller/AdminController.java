package com.bahaushi.onlineschool.controller;


import com.bahaushi.onlineschool.service.CourseContentService;
import com.bahaushi.onlineschool.service.CourseService;
import com.bahaushi.onlineschool.service.TeacherService;
import com.bahaushi.onlineschool.service.UserService;
import model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
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
    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping({"/dashboard", "/"})
    public ModelAndView goToAdminPanel(ModelAndView model) {
        try{
            List<Courses> courselist = courseService.getAllCourse();
            model.addObject("courseList",courselist);
            model.setViewName("admin/admindashboard");
        }
        catch (Exception e){
            model.setViewName("errorpage");
        }

        return model;

    }
    @GetMapping("addTeacher")
    public ModelAndView addTeacher(ModelAndView model) {
        model.setViewName("admin/addteacher");
        return model;
    }
    @PostMapping("addTeacher")
    public ModelAndView addTeacherUser(@ModelAttribute("user") User user,ModelAndView model) {
        String encodedpass = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodedpass);
        userService.addUser(user);
        if (user.getUserRole().equals("TEACHER")){
            Teacher teacher = new Teacher();
            teacher.setIsCreated(0);
            teacher.setUser(user);
            teacherService.addTeacher(teacher);
        }
        return goToAdminPanel(model);
    }

    @GetMapping("login")
    public ModelAndView gotoLogin(ModelAndView model) {
        model.setViewName("admin/login");
        return model;
    }

    @GetMapping("/viewCourse/{id}")
    public ModelAndView viewCourse(@PathVariable("id") Integer id, ModelAndView model) {
        CourseDomain domain = courseService.getCourseDomainByCourseId(id);
        model.addObject("domain",domain);
        model.setViewName("admin/viewcourse");
        return model;
    }
    @GetMapping("deletecont/{id}")
    public ModelAndView deletecontent(@PathVariable("id") Integer id,
                                      ModelAndView model) {
        Coursecontent content = courseContentService.getCourseContentById(id);
        courseContentService.deleteContent(content);
        return goToAdminPanel(model);
    }

    @GetMapping("deleteFile/{id}")
    public ModelAndView deleteFile(@PathVariable("id") Integer id,
                                      ModelAndView model) {
        ContentFiles files = courseContentService.getCourseFileById(id);
        courseContentService.deleteFiles(files);
        return goToAdminPanel(model);
    }



    @PostMapping("/admin-login")
    public ModelAndView authAdmin(@ModelAttribute("user") User user,
                                  ModelAndView model, HttpSession httpSession) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        User userauth = userService.getUserByUsername(user.getUsername());

        if (encoder.matches(user.getPassword(), userauth.getPassword())) {
            httpSession.setAttribute("admin", userauth);
            List<Courses> courselist = courseService.getAllCourse();
            model.addObject("courseList",courselist);
            model.setViewName("admin/admindashboard");
        } else {
            model.setViewName("admin/login");
        }

        return model;
    }

    @GetMapping("deletecontent/{id}")
    public ModelAndView deletecontent(@PathVariable("id") Integer id,
                                      ModelAndView model,HttpSession httpSession) {
        Coursecontent content = courseContentService.getCourseContentById(id);
        courseContentService.deleteContent(content);
        return viewCourse(content.getCourses().getId(),model);
    }

}
