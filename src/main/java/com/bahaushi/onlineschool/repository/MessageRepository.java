/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bahaushi.onlineschool.repository;

import java.util.ArrayList;
import java.util.List;
import model.Message;
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
public class MessageRepository {

    @Autowired
    private SessionFactory sessionFactory;

    public String SendMessage(Message message) {
        sessionFactory.getCurrentSession().save(message);
        return "Success";
    }

    public String updateMessage(Message message) {
        sessionFactory.getCurrentSession().merge(message);
        return "Success";
    }

    public List<Message> getMessagesByStudentUserId(Integer id) {
        List<Message> list = new ArrayList();
        try {
            String sql = "select m from Message m where m.messageTo.user.id=:id";
            Query query = sessionFactory.getCurrentSession().createQuery(sql);
            query.setParameter("id", id);
            list = query.list();
        } catch (Exception e) {
        }
        return list;
    }
    public List<Message> getUnreadMessagesByStudentUserId(Integer id) {
        List<Message> list = new ArrayList();
        try {
            String sql = "select m from Message m where m.messageTo.user.id=:id and m.status = 'Unread' ";
            Query query = sessionFactory.getCurrentSession().createQuery(sql);
            query.setParameter("id", id);
            list = query.list();
        } catch (Exception e) {
        }
        return list;
    }
    public Message getMessagesById(Integer id) {
        List<Message> list = new ArrayList();
        try {
            String sql = "select m from Message m where m.id=:id";
            Query query = sessionFactory.getCurrentSession().createQuery(sql);
            query.setParameter("id", id);
            list = query.list();
        } catch (Exception e) {
        }
        return list.get(0);
    }
}
