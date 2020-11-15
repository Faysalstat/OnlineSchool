/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bahaushi.onlineschool.service;

import com.bahaushi.onlineschool.repository.CourseContentRepository;
import java.util.List;
import model.Coursecontent;
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
    
    public String saveContent(Coursecontent coursecontent) {
        return courseContentRepository.saveContent(coursecontent);
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
}
