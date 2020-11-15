/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bahaushi.onlineschool.service;

import com.bahaushi.onlineschool.repository.UserRepository;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
     public User updateUser(User user) {
        return userRepository.updateUser(user);
    }

    public User getUserById(Integer id) {
        return userRepository.getUserById(id);
    }
    public User getUserByEmail(String email) {
        return userRepository.getUserByEmail(email);
    }
    public User getUserByUsername(String username) {
        return userRepository.getUserByUsername(username);
    }
     
}
