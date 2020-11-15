/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bahaushi.onlineschool.repository;

import java.util.List;
import model.Student;
import model.Teacher;
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
public class TeacherRepository {

    @Autowired
    private SessionFactory sessionFactory;

    public Teacher addTeacher(Teacher teacher) {
        sessionFactory.getCurrentSession().save(teacher);
        return teacher;
    }
    public Teacher updateTeacher(Teacher teacher) {
        sessionFactory.getCurrentSession().merge(teacher);
        return teacher;
    }

    public Teacher getTeacherById(Integer id) {
        String sql = "select t from Teacher t where t.id=:id";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("id", id);
        List<Teacher> list = query.list();
        return list.get(0);
    }
    public Teacher getTeacherByUserId(Integer id) {
        String sql = "select t from Teacher t where t.user.id=:id";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("id", id);
        List<Teacher> list = query.list();
        return list.get(0);
    }
    public List<Teacher> getAllTeacher() {
        String sql = "select t from Teacher t";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        List<Teacher> list = query.list();
        return list;
    }

}
