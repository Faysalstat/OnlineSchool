/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bahaushi.onlineschool.controller;

import com.bahaushi.onlineschool.service.CourseContentService;
import com.bahaushi.onlineschool.service.CourseService;
import com.bahaushi.onlineschool.service.TeacherService;
import com.bahaushi.onlineschool.service.UserService;
import java.util.List;
import javax.servlet.http.HttpSession;
import model.Coursecontent;
import model.Courses;
import model.Teacher;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Faysal
 */
@Controller
@RequestMapping("/dashboard")
public class TeacherController {

    @Autowired
    TeacherService teacherService;
    @Autowired
    CourseService courseService;
    @Autowired
    CourseContentService courseContentService;
    @Autowired
    UserService userService;

    @GetMapping({"/teachers", "/"})
    public ModelAndView goToTeachersPanel(ModelAndView model) {

        model.setViewName("teacher/teacher_dashboard");
        return model;

    }

    @PostMapping("/adminlogin")
    public ModelAndView authAdmin(@ModelAttribute("user") User user,
            ModelAndView model, HttpSession httpSession) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        User userauth = userService.getUserByUsername(user.getUsername());

        if (encoder.matches(user.getPassword(), userauth.getPassword())) {
            httpSession.setAttribute("admin", userauth);
            model.setViewName("teacher/teacher_dashboard");
        } else {
            model.setViewName("teacher/login");
        }

        return model;
    }

    @GetMapping("addcourse")
    public ModelAndView gotoAddcourse(ModelAndView model) {
        model.setViewName("teacher/addcourse");
        return model;
    }

    @PostMapping("updatecourse")
    public ModelAndView updateCourse(@ModelAttribute("course") Courses course,
            ModelAndView model) {
        try {
            courseService.updateCourse(course);
            model.setViewName("teacher/teacher_dashboard");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return model;
    }

    @PostMapping("addcourse")
    public ModelAndView addCourse(@ModelAttribute("course") Courses course,
            ModelAndView model, HttpSession httpSession) {
        try {
            User user = (User) httpSession.getAttribute("admin");
            Teacher teacher = teacherService.getTeacherByUserId(user.getId());
            course.setTeacher(teacher);
            course.setStatus("running");
            courseService.saveCourse(course);
            model.addObject("jsondata", course);
            model.addObject("jsondata", course);
            model.setViewName("teacher/addcourse");
        } catch (Exception e) {

        } finally {
        }
        return model;
    }

    @PostMapping("addcoursecontent")
    public ModelAndView gotoAddcourseContent(@ModelAttribute("coursecontent") Coursecontent courseContent, ModelAndView model) {
        Courses courses = courseService.getCourseByCourseId(courseContent.getCourses().getId());
        courseContent.setCourses(courses);
        courseContentService.saveContent(courseContent);
        model.addObject("course", courses);
        model.setViewName("teacher/addcoursecontent");
        return model;
    }

    @GetMapping("addcoursecontent/{id}")
    public ModelAndView addcourseContent(@PathVariable("id") Integer id,
            ModelAndView model) {
        Courses course = courseService.getCourseByCourseId(id);
        model.addObject("course", course);
        model.setViewName("teacher/addcoursecontent");
        return model;
    }

    @GetMapping("editcourse/{id}")
    public ModelAndView editCourse(@PathVariable("id") Integer id,
            ModelAndView model) {
        Courses course = courseService.getCourseByCourseId(id);
        model.addObject("course", course);
        model.setViewName("teacher/editcourse");
        return model;
    }

    @GetMapping("courses")
    public ModelAndView gotoCourses(ModelAndView model, HttpSession httpSession) {
        User user = (User) httpSession.getAttribute("admin");
        Teacher teacher = teacherService.getTeacherByUserId(user.getId());
        List<Courses> courselist = courseService.getCourseByTeacherId(teacher.getId());
        model.addObject("courses", courselist);
        model.setViewName("teacher/courses");
        return model;
    }

    @GetMapping("deletecourse/{id}")
    @CrossOrigin(origins = "*")
    public ModelAndView deleteContent(@PathVariable("id") Integer id,
            ModelAndView model, HttpSession httpSession) {
        Courses course = courseService.getCourseByCourseId(id);
        courseService.deleteCourse(course);
        User user = (User) httpSession.getAttribute("admin");
        Teacher teacher = teacherService.getTeacherByUserId(user.getId());
        List<Courses> courselist = courseService.getCourseByTeacherId(teacher.getId());
        model.addObject("courses", courselist);
        model.setViewName("teacher/courses");
        return model;
    }

    @GetMapping("contents/{id}")
    public ModelAndView gotoContents(@PathVariable("id") Integer id, ModelAndView model) {
        Teacher teacher = teacherService.getTeacherById(2);
        List<Courses> courselist = courseService.getCourseByTeacherId(teacher.getId());
        model.addObject("courses", courselist);
        model.setViewName("teacher/courses");
        return model;
    }

    @GetMapping("profile")
    public ModelAndView gotoProfile(ModelAndView model) {
        model.setViewName("teacher/profile");
        return model;
    }

    @GetMapping("login")
    public ModelAndView gotoLogin(ModelAndView model) {
        model.setViewName("teacher/login");
        return model;
    }

    @GetMapping("mail")
    public ModelAndView gotoMail(ModelAndView model) {
        model.setViewName("teacher/mail");
        return model;
    }

    @GetMapping("/logout")
    public String logoutpage(HttpSession httpSession) {
        httpSession.invalidate();
        return "teacher/login";
    }
}