/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bahaushi.onlineschool.service;

import com.bahaushi.onlineschool.repository.CourseContentRepository;
import java.util.List;

import com.bahaushi.onlineschool.repository.StudentRepository;
import model.ContentFiles;
import model.Coursecontent;
import model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Faysal
 */
@Service
public class CourseContentService {
     @Autowired
     CourseContentRepository  courseContentRepository;
    @Autowired
    MessageService messageService;
    @Autowired
    StudentRepository studentRepository;
    
    public String saveContent(Coursecontent coursecontent) {
        try{
            courseContentRepository.saveContent(coursecontent);
            List<Student> students = studentRepository.getStudentsByCourse(coursecontent.getCourses());
            for(Student student:students){
                messageService.SendMessageNewContentUploadSuccess(coursecontent.getCourses(),student);
            }
        }catch (Exception e){
            e.getStackTrace();
            return "failed";
        }

        return "Success";
    }

    public String addFile(ContentFiles contentFiles) {
        return courseContentRepository.addFile(contentFiles);
    }
    public String updateContent(Coursecontent coursecontent) {
        return courseContentRepository.updateContent(coursecontent);
    }
    public String deleteContent(Coursecontent coursecontent) {
        return courseContentRepository.deleteContent(coursecontent);
    }
    
    public List<Coursecontent> getCourseContentByCourseId(Integer id) {
        return courseContentRepository.getCourseContentByCourseId(id);
    }
    public Coursecontent getCourseContentById(Integer id) {
        return courseContentRepository.getCourseContentById(id);
    }

    public List<ContentFiles> getContentfileList(Integer id) {
        return courseContentRepository.getContentfileList(id);
    }
}
