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
import com.bahaushi.onlineschool.service.UserService;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Faysal
 */
@RestController
@CrossOrigin(origins = "*")
public class RestApiController {

    @Autowired
    CourseService courseService;
    @Autowired
    CourseContentService courseContentService;
    @Autowired
    StudentService studentService;
    @Autowired
    MessageService messageService;
    @Autowired
    UserService userService;

    @Autowired
    private ServletContext servletContext;

    @PostMapping("dashboard/uploadcourseimage")
    @CrossOrigin(origins = "*")
    public String courseImageUpload(
            @RequestParam("image") MultipartFile file,
            RedirectAttributes redirectAttributes) {
        String image = System.currentTimeMillis() + ".jpg";
        try {
            byte[] bytes = file.getBytes();
            Path relpath = Paths.get(servletContext.getRealPath("/") + "/WEB-INF/img/course/" + image);
//            Path path = Paths.get("E:/onlineschool/src/main/webapp/WEB-INF/img/course/" + image);
            Files.write(relpath, bytes);

        } catch (IOException e) {
            return "{\"action\":false}";
        }

        return "{\"action\":true , \"iname\":\"" + image + "\"}";
    }


    @PostMapping("/studentprofileImageUpload")
    @CrossOrigin(origins = "*")
    public String studentprofileImageUpload(
            @RequestParam("image") MultipartFile file,
            RedirectAttributes redirectAttributes) {
        String image = System.currentTimeMillis() + ".jpg";
        try {
            byte[] bytes = file.getBytes();
            Path relpath = Paths.get(servletContext.getRealPath("/") + "/WEB-INF/img/students/" + image);
//            Path path = Paths.get("E:/onlineschool/src/main/webapp/WEB-INF/img/teachers/" + image);
            Files.write(relpath, bytes);
        } catch (IOException e) {
            return "{\"action\":false}";
        }

        return "{\"action\":true , \"iname\":\"" + image + "\"}";
    }

    @PostMapping("/dashboard/teacherprofileImageUpload")
    @CrossOrigin(origins = "*")
    public String teacherprofileImageUpload(
            @RequestParam("image") MultipartFile file,
            RedirectAttributes redirectAttributes) {
        String image = System.currentTimeMillis() + ".jpg";
        try {
            byte[] bytes = file.getBytes();
            Path relpath = Paths.get(servletContext.getRealPath("/") + "/WEB-INF/img/teachers/" + image);
//            Path path = Paths.get("E:/onlineschool/src/main/webapp/WEB-INF/img/teachers/" + image);
            Files.write(relpath, bytes);
        } catch (IOException e) {
            return "{\"action\":false}";
        }

        return "{\"action\":true , \"iname\":\"" + image + "\"}";
    }

    @PostMapping("/dashboard/contentfileUpload")
    @CrossOrigin(origins = "*")
    public String contentfileUpload(
            @RequestParam("file") MultipartFile file,
            RedirectAttributes redirectAttributes) {
        String filename = System.currentTimeMillis() + ".pdf";
        try {
            byte[] bytes = file.getBytes();
            Path relpath = Paths.get(servletContext.getRealPath("/") + "/WEB-INF/files/" + filename);
//            Path path = Paths.get("E:/onlineschool/src/main/webapp/WEB-INF/img/teachers/" + image);
            Files.write(relpath, bytes);
//            ContentFiles contentFiles= new ContentFiles();
//            contentFiles.setContent(content);
//            contentFiles.setFileName(filename);
//            courseContentService.addFile(contentFiles);

        } catch (IOException e) {
            return "{\"action\":false}";
        }

        return "{\"action\":true , \"filename\":\"" + filename + "\"}";
    }

    @PostMapping("paymentsuccess/{reference}/{courseId}")
    @CrossOrigin(origins = "*")
    public String payWithPaystack(@PathVariable("reference") String reference,
            @PathVariable("courseId") Integer courseid,
            HttpSession httpSession) {
        User user = (User) httpSession.getAttribute("userSession");
        Student student = studentService.getStudentByUserId(user.getId());
        Courses course = courseService.getCourseByCourseId(courseid);
        messageService.SendMessageEnrolledSuccess(course,student);
        MyCourses mycourses = new MyCourses();
        mycourses.setCourses(course);
        mycourses.setStudent(student);
        courseService.saveMyCourse(mycourses);
        return "Success";
    }

    @PostMapping("uploadstudentimage")
    @CrossOrigin(origins = "*")
    public String studentImageUpload(
            @RequestParam("image") MultipartFile file,
            RedirectAttributes redirectAttributes) {

        String image = System.currentTimeMillis() + ".jpg";

        try {
            byte[] bytes = file.getBytes();

//            Path path = Paths.get(servletContext.getRealPath("/") + "/WEB-INF/img/course/" + image);
            Path path = Paths.get("H:/Fiverr Work/Project #5 Online School/onlineschool/src/main/webapp/WEB-INF/img/students/" + image);
            Files.write(path, bytes);
        } catch (IOException e) {
            return "{\"action\":false}";
        }

        return "{\"action\":true , \"iname\":\"" + image + "\"}";
    }

//    @PostMapping("addcoursecontent")
//    @CrossOrigin(origins = "*")
//    public String addCourse(@ModelAttribute("coursecontent") Coursecontent course) {
//        courseContentService.saveContent(course);
//        return "Success";
//    }
    @PostMapping("markread/{id}")
    @CrossOrigin(origins = "*")
    public String addCourse(@PathVariable("id") Integer id) {
        Message message = messageService.getMessagesById(id);
        message.setStatus("Read");
        messageService.updateMessage(message);
        return "Success";
    }
    
    
    @GetMapping("testuser")
    @CrossOrigin(origins = "*")
    public Courses test() {
        return courseService.getCourseByCourseId(6);
    }
    

}
