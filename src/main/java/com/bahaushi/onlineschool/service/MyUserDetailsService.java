/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bahaushi.onlineschool.service;

import com.bahaushi.onlineschool.repository.UserRepository;
import com.bahaushi.onlineschool.securityconfig.UserPrinciple;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 *
 * @author Faysal
 */
@Service
public class MyUserDetailsService implements UserDetailsService{

    @Autowired
    UserRepository userRepository;
    
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.getUserByUsername(username);
        if (user==null) {
            throw new UsernameNotFoundException("User Not Found");
        }
        return new UserPrinciple(user);
    }
    
}
