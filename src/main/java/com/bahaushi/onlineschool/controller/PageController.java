/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bahaushi.onlineschool.controller;

import com.bahaushi.onlineschool.service.CourseContentService;
import com.bahaushi.onlineschool.service.CourseService;
import com.bahaushi.onlineschool.service.MessageService;
import com.bahaushi.onlineschool.service.StudentService;
import com.bahaushi.onlineschool.service.TeacherService;
import java.util.List;
import javax.servlet.http.HttpSession;

import model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Faysal
 */
@Controller
public class PageController {

    @Autowired
    private CourseService courseService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    CourseContentService courseContentService;
    @Autowired
    StudentService studentService;
    @Autowired
    MessageService messageService;

   @GetMapping("editprofile")
    public ModelAndView gotoEditProfile(ModelAndView model,HttpSession httpSession) {

        User user = (User) httpSession.getAttribute("userSession");
        model.addObject("user", user);
        Student student = studentService.getStudentByUserId(user.getId());
        model.addObject("student", student);
           List<Message> unread = messageService.getUnreadMessagesByStudentUserId(user.getId());
           model.addObject("unread", unread);
        model.setViewName("editprofile");
        return model;
    }

    @PostMapping("addstudentprofile")
    @CrossOrigin
    public ModelAndView addstudentprofile(
            @ModelAttribute("student") Student student, HttpSession httpSession,
            ModelAndView model) {
        User user = (User) httpSession.getAttribute("userSession");
        student.setUser(user);
        studentService.updateStudent(student);
        return gotoprofile(model,httpSession);
    }

    @GetMapping("aboutus")
    public ModelAndView gotoAbout(ModelAndView model, HttpSession httpSession) {

        User user = (User) httpSession.getAttribute("userSession");
        model.addObject("user", user);
        List<Message> unread = messageService.getUnreadMessagesByStudentUserId(user.getId());
        model.addObject("unread", unread);
        model.setViewName("aboutus");
        return model;
    }

    @GetMapping("blog")
    public ModelAndView gotoBlog(ModelAndView model, HttpSession httpSession) {
        User user = (User) httpSession.getAttribute("userSession");
        model.addObject("user", user);
        List<Message> unread = messageService.getUnreadMessagesByStudentUserId(user.getId());
        model.addObject("unread", unread);
        model.setViewName("blog");
        return model;
    }

    @GetMapping("notifications")
    public ModelAndView gotoNotifications(ModelAndView model, HttpSession httpSession) {
        User user = (User) httpSession.getAttribute("userSession");
        model.addObject("user", user);
        List<Message> unread = messageService.getUnreadMessagesByStudentUserId(user.getId());
        List<Message> messagelist = messageService.getMessagesByStudentUserId(user.getId());
        model.addObject("messagelist", messagelist);
        model.addObject("unread", unread);
        model.setViewName("notifications");
        return model;
    }

    @GetMapping("singlecourse/{id}")
    public ModelAndView viewSingleCourses(@PathVariable("id") Integer id,
            ModelAndView model, HttpSession httpSession) {
        
        User user = (User) httpSession.getAttribute("userSession");
        model.addObject("user", user);
        List<Message> unread = messageService.getUnreadMessagesByStudentUserId(user.getId());
        model.addObject("unread", unread);
        Student student = studentService.getStudentByUserId(user.getId());
        model.addObject("student", student);

        Courses singlecourse = courseService.getCourseByCourseId(id);
        MyCourses mycourse = new MyCourses();
        mycourse.setCourses(singlecourse);
        mycourse.setStudent(student);
        boolean isEnrolled = courseService.isEnrolled(mycourse);
        if (isEnrolled) {
            model.addObject("enrolled", true);
        }
        model.addObject("singleCourse", singlecourse);
        model.setViewName("singlecourse");
        return model;
    }

    @GetMapping("singlemycourse/{id}")
    public ModelAndView viewSingleMyCourses(@PathVariable("id") Integer id, ModelAndView model, HttpSession httpSession) {
        User user = (User) httpSession.getAttribute("userSession");
        model.addObject("user", user);
        List<Message> unread = messageService.getUnreadMessagesByStudentUserId(user.getId());
        model.addObject("unread", unread);
        Courses singlecourse = courseService.getCourseByCourseId(id);
        model.addObject("singleCourse", singlecourse);
        model.setViewName("singlemycourse");
        return model;
    }

    @GetMapping("buySingleCourse/{id}")
    public ModelAndView buySingleCourse(@PathVariable("id") Integer id, ModelAndView model, HttpSession httpSession) {
        User user = (User) httpSession.getAttribute("userSession");
        List<Message> unread = messageService.getUnreadMessagesByStudentUserId(user.getId());
        model.addObject("unread", unread);
        model.addObject("user", user);
        Student student = studentService.getStudentByUserId(user.getId());
        model.addObject("student", student);
        Courses singlecourse = courseService.getCourseByCourseId(id);
        model.addObject("singleCourse", singlecourse);
        model.setViewName("buycourse");
        return model;
    }

    @GetMapping("courses")
    public ModelAndView gotoCourses(ModelAndView model, HttpSession httpSession) {
        User user = (User) httpSession.getAttribute("userSession");
        model.addObject("user", user);
        List<Message> unread = messageService.getUnreadMessagesByStudentUserId(user.getId());
        model.addObject("unread", unread);
        List<Courses> courselist = courseService.getAllCourse();
        model.addObject("courselist", courselist);
        model.setViewName("courses");
        return model;
    }

    @GetMapping("teachers")
    public ModelAndView gotoTeachers(ModelAndView model, HttpSession httpSession) {
        User user = (User) httpSession.getAttribute("userSession");
        model.addObject("user", user);
        List<Message> unread = messageService.getUnreadMessagesByStudentUserId(user.getId());
        model.addObject("unread", unread);
        List<Teacher> teachersList = teacherService.getAllTeacher();
        model.addObject("teacherslist", teachersList);
        model.setViewName("teachers");
        return model;
    }

    @GetMapping("singleTeacher/{id}")
    public ModelAndView gotoTeachers(@PathVariable("id") Integer id, ModelAndView model, HttpSession httpSession) {
        User user = (User) httpSession.getAttribute("userSession");
        model.addObject("user", user);
        List<Message> unread = messageService.getUnreadMessagesByStudentUserId(user.getId());
        model.addObject("unread", unread);
        Teacher teacher = teacherService.getTeacherById(id);
        model.addObject("teacher", teacher);
        model.setViewName("viewTeachersProfile");
        return model;
    }

    @GetMapping("addcourses")
    public ModelAndView gotoCreateCourse(ModelAndView model, HttpSession httpSession) {
        User user = (User) httpSession.getAttribute("userSession");
        model.addObject("user", user);
        List<Message> unread = messageService.getUnreadMessagesByStudentUserId(user.getId());
        model.addObject("unread", unread);
        model.setViewName("createcoursetest");
        return model;
    }

    @GetMapping("mycourses")
    public ModelAndView gotoMyCourse(ModelAndView model, HttpSession httpSession) {
        User user = (User) httpSession.getAttribute("userSession");
        model.addObject("user", user);
        List<Message> unread = messageService.getUnreadMessagesByStudentUserId(user.getId());
        model.addObject("unread", unread);
        List<MyCourses> mycourselist = courseService.getMyCourseByStudentId(user.getId());
        model.addObject("mycourselist", mycourselist);
        model.setViewName("mycourses");
        return model;
    }

    @GetMapping("login")
    public ModelAndView gotoLogIn(ModelAndView model) {
        model.setViewName("login");
        return model;
    }
    @GetMapping("forgotpassword")
    public ModelAndView forgotPassword(ModelAndView model) {
        model.setViewName("passwordreset/forgotpassword");
        return model;
    }

    @GetMapping("profile")
    public ModelAndView gotoprofile(ModelAndView model,HttpSession httpSession) {
        User user = (User) httpSession.getAttribute("userSession");
        Student student = studentService.getStudentByUserId(user.getId());
        model.addObject("student",student);
        model.addObject("user", user);
        List<Message> unread = messageService.getUnreadMessagesByStudentUserId(user.getId());
        model.addObject("unread", unread);
        model.setViewName("profile");
        return model;
    }
    @GetMapping("changePassword/{email}")
    public ModelAndView changePassword(@PathVariable("email") String email,ModelAndView model) {
        model.addObject("email",email);
        model.setViewName("passwordreset/changepassword");
        return model;
    }

    @GetMapping("registration")
    public ModelAndView gotoRegistration(ModelAndView model) {
        model.setViewName("registration");
        return model;
    }

    @GetMapping("viewcourse/{id}")
    public ModelAndView gotoViewCourse(@PathVariable("id") Integer id,
            ModelAndView model, HttpSession httpSession) {
        User user = (User) httpSession.getAttribute("userSession");
        model.addObject("user", user);
        List<Message> unread = messageService.getUnreadMessagesByStudentUserId(user.getId());
        model.addObject("unread", unread);
        List<Coursecontent> contentlist = courseContentService.getCourseContentByCourseId(id);
        List<ContentFiles> filesList = courseContentService.getContentfileList(id);
        model.addObject("contentlist", contentlist);
        model.addObject("filesList", filesList);
        model.setViewName("viewcourse");
        return model;
    }

}
