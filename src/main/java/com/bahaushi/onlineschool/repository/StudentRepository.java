/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bahaushi.onlineschool.repository;

import java.util.List;

import model.Courses;
import model.Student;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Faysal
 */
@Repository
@Transactional
public class StudentRepository {

    @Autowired
    private SessionFactory sessionFactory;

    public boolean addStudent(Student student) {
         try {
            sessionFactory.getCurrentSession().save(student);
        } catch (Exception e) {
            return false;
        }
        
        return true;
    }
    public Student updateStudent(Student student) {
        sessionFactory.getCurrentSession().merge(student);
        return student;
    }

    public Student getStudentById(Integer id) {
        String sql = "select s from Student s where s.id=:id";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("id", id);
        List<Student> list = query.list();
        return list.get(0);
    }
    public List<Student> getStudentsByCourse(Courses courses) {
        String sql = "select mc.student from MyCourses mc where mc.courses=:courses";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("courses", courses);
        List<Student> list = query.list();
        return list;
    }
    public Student getStudentByUserId(Integer id) {
        String sql = "select s from Student s where s.user.id=:id";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("id", id);
        List<Student> list = query.list();
        return list.get(0);
    }

}
