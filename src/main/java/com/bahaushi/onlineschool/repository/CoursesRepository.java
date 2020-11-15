/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bahaushi.onlineschool.repository;

import java.util.List;
import model.CourseCount;
import model.Courses;
import model.MyCourses;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Faysal
 */
@Repository
@Transactional
public class CoursesRepository {

    @Autowired
    private SessionFactory sessionFactory;

    public String saveCourse(Courses course) {
        sessionFactory.getCurrentSession().save(course);
        System.out.println(course);
        return "Success";
    }
    public String deleteCourse(Courses course) {
        sessionFactory.getCurrentSession().delete(course);
        System.out.println(course);
        return "Success";
    }

    public String saveMyCourse(MyCourses mycourse) {
        sessionFactory.getCurrentSession().save(mycourse);
        System.out.println(mycourse);
        return "Success";
    }

    public boolean isEnrolled(MyCourses mycourse) {
        boolean flag = false;
        try {
            String sql = "select mc from MyCourses mc where mc.student.id=:sid and mc.courses.id=:cid";
            Query query = sessionFactory.getCurrentSession().createQuery(sql);
            query.setParameter("sid", mycourse.getStudent().getId());
            query.setParameter("cid", mycourse.getCourses().getId());
            List<Courses> list = query.list();
            if (list.size() > 0) {
                flag = true;
            }
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    public String updateCourse(Courses course) {
        sessionFactory.getCurrentSession().merge(course);
        System.out.println(course);
        return "Success";
    }

    public List<Courses> getAllCourses() {
        String sql = "select c from Courses c";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        List<Courses> list = query.list();
        return list;
    }

    public Courses getCourseByCourseId(Integer id) {
        String sql = "select c from Courses c where c.id=:id";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("id", id);
        List<Courses> list = query.list();
        return list.get(0);
    }

    public List<Courses> getCourseByTeacherId(Integer id) {
        String sql = "select c from Courses c where c.teacher.id=:id";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("id", id);
        List<Courses> list = query.list();
        return list;
    }

    public List<MyCourses> getMyCourseByStudentId(Integer id) {
        String sql = "select mc from MyCourses mc where mc.student.user.id=:id";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("id", id);
        List<MyCourses> list = query.list();
        return list;
    }

    public CourseCount countCourses() {
        List<Courses> list = getAllCourses();
        CourseCount courseCount = new CourseCount();
        int b=0;
        int intm=0;
        int adv =0;
        for (Courses course: list) {
            if (course.getCourseLevel().equals("Basic")) {
                b++;
            }
            if (course.getCourseLevel().equals("Intermediate")) {
                intm++;
            }
            if (course.getCourseLevel().equals("Advanced")) {
                adv++;
            }
        }
        courseCount.setBasic(b);
        courseCount.setIntermediate(intm);
        courseCount.setAdvanced(adv);
        return courseCount;
    }
}
