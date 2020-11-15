/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bahaushi.onlineschool.service;

import com.bahaushi.onlineschool.repository.CourseContentRepository;
import com.bahaushi.onlineschool.repository.CoursesRepository;

import java.util.ArrayList;
import java.util.List;

import model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Faysal
 */
@Service
public class CourseService {

    @Autowired
    CoursesRepository coursesRepository;
    @Autowired
    CourseContentRepository courseContentRepository;

    public String saveCourse(Courses course) {
        return coursesRepository.saveCourse(course);
    }

    public String deleteCourse(Courses course) {
        return coursesRepository.deleteCourse(course);
    }

    public String updateCourse(Courses course) {
        return coursesRepository.updateCourse(course);
    }

    public List<Courses> getAllCourse() {
        return coursesRepository.getAllCourses();
    }

    public List<CourseDomain> getAllCourseDomainByTeacherId(Integer id) {
        List<Courses> courses = coursesRepository.getCourseByTeacherId(id);
        List<CourseDomain> CourseDomainList = new ArrayList();
        for(Courses course: courses){
            List<Coursecontent> contentlist=courseContentRepository.getCourseContentByCourseId(course.getId());
            CourseDomain domain = new CourseDomain();
            domain.setCoursecontents(contentlist);
            domain.setCourses(course);
            CourseDomainList.add(domain);
        }

        return CourseDomainList;
    }
    public Courses getCourseByCourseId(Integer id) {
        return coursesRepository.getCourseByCourseId(id);
    }

    public List<Courses> getCourseByTeacherId(Integer id) {
        return coursesRepository.getCourseByTeacherId(id);
    }

    public List<MyCourses> getMyCourseByStudentId(Integer id) {
        return coursesRepository.getMyCourseByStudentId(id);
    }

    public String saveMyCourse(MyCourses mycourse) {
        mycourse.setStatus("Running");
        return coursesRepository.saveMyCourse(mycourse);
    }

    public boolean isEnrolled(MyCourses mycourse) {
        return coursesRepository.isEnrolled(mycourse);
    }

    public CourseCount countCourses() {
        return coursesRepository.countCourses();
    }

}
