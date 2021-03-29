/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bahaushi.onlineschool.service;

import com.bahaushi.onlineschool.repository.UserRepository;
import model.PasswordResetToken;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 *
 * @author Faysal
 */
@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    
    public User addUser(User user) {
        return userRepository.addUser(user);
    }
    public boolean checkEmail(String email) {
        return userRepository.checkEmail(email);
    }
    public User updateUser(User user) {
        return userRepository.updateUser(user);
    }
    public PasswordResetToken saveToken(PasswordResetToken passwordresettoken) {
        passwordresettoken.setToken(UUID.randomUUID().toString());
        passwordresettoken.setExpiryDate(today());
        return userRepository.saveToken(passwordresettoken);
    }

    public PasswordResetToken findByConfirmationToken(String token) {
        return userRepository.findByConfirmationToken(token);
    }
    public User getUserById(Integer id) {
        return userRepository.getUserById(id);
    }
    public User getUserByEmail(String email,String username) {
        return userRepository.getUserByEmail(email,username);
    }
    public User getUserByUsername(String username) {
        return userRepository.getUserByUsername(username);
    }

    private Date today() {
        DateFormat df = new SimpleDateFormat("YYYY-MM-DD");
        Date dateobj = new Date();
        return dateobj;
    }

     
}
