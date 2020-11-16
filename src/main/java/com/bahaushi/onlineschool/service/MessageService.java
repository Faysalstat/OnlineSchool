/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bahaushi.onlineschool.service;

import com.bahaushi.onlineschool.repository.MessageRepository;

import java.util.Date;
import java.util.List;

import model.Courses;
import model.Message;
import model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageService {

    @Autowired
    MessageRepository messageRepository;

    public String SendMessageEnrolledSuccess(Courses course, Student student) {
        Message message = new Message();
        message.setSendtime(new Date());
        message.setContent("Welcome to the "+course.getCourseName()
                +". Happy Learning!!");
        message.setMessageTo(student);
        message.setMessageFrom(course.getTeacher());
        message.setStatus("Unread");
        return messageRepository.SendMessage(message);
    }
    public String SendMessageNewContentUploadSuccess(Courses course, Student student) {
        Message message = new Message();
        message.setSendtime(new Date());
        message.setContent("A new Lesson Uploaded to the course "+course.getCourseName()
                +". Happy Learning!!");
        message.setMessageTo(student);
        message.setMessageFrom(course.getTeacher());
        message.setStatus("Unread");
        return messageRepository.SendMessage(message);
    }
    public String updateMessage(Message message) {
        return messageRepository.updateMessage(message);
    }

    public List<Message> getMessagesByStudentUserId(Integer id) {
        return messageRepository.getMessagesByStudentUserId(id);
    }

    public Message getMessagesById(Integer id) {
        return messageRepository.getMessagesById(id);
    }

    public List<Message> getUnreadMessagesByStudentUserId(Integer id) {
        return messageRepository.getUnreadMessagesByStudentUserId(id);
    }
}
