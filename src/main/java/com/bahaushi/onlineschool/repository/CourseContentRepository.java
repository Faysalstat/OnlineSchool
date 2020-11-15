/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bahaushi.onlineschool.repository;

import java.util.List;
import model.Coursecontent;
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
public class CourseContentRepository {

    @Autowired
    private SessionFactory sessionFactory;

    public String saveContent(Coursecontent coursecontent) {
        sessionFactory.getCurrentSession().save(coursecontent);
        return "Success";
    }
    public String updateContent(Coursecontent coursecontent) {
        sessionFactory.getCurrentSession().merge(coursecontent);
        return "Success";
    }
    public String deleteContent(Coursecontent coursecontent) {
        sessionFactory.getCurrentSession().delete(coursecontent);
        return "Success";
    }
    
    public List<Coursecontent> getCourseContentByCourseId(Integer id) {
        String sql = "select c from Coursecontent c where c.courses.id=:id";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("id", id);
        List<Coursecontent> list = query.list();
        return list;

    }
    
    
}