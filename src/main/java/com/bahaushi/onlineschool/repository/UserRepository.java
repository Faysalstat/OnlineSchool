/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bahaushi.onlineschool.repository;

import java.util.List;

import model.PasswordResetToken;
import model.Student;
import model.User;
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
public class UserRepository {
    @Autowired
    private SessionFactory sessionFactory;

    public User addUser(User user) {
        sessionFactory.getCurrentSession().save(user);
        return user;
    }
    public User updateUser(User user) {
        sessionFactory.getCurrentSession().merge(user);
        return user;
    }

    public User getUserById(Integer id) {
        String sql = "select u from User u where u.id=:id";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("id", id);
        List<User> list = query.list();
        return list.get(0);
    }
    public User getUserByEmail(String email) {
        String sql = "select u from User u where u.email=:email";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("email", email);
        List<User> list = query.list();
        return list.get(0);
    }
    public User getUserByUsername(String username) {
        String sql = "select u from User u where u.username=:username";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("username", username);
        List<User> list = query.list();
        return list.get(0);
    }

    public PasswordResetToken saveToken(PasswordResetToken passwordresettoken) {
        sessionFactory.getCurrentSession().save(passwordresettoken);
        return passwordresettoken;
    }

    public PasswordResetToken findByConfirmationToken(String token) {
        String sql = "select t from PasswordResetToken t where t.token= :token";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("token", token);
        List<PasswordResetToken> list = query.list();
        return list.get(0);
    }
}
