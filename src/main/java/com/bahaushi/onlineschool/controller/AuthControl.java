package com.bahaushi.onlineschool.controller;

import com.bahaushi.onlineschool.service.UserService;
import com.bahaushi.onlineschool.service.EmailSenderService;
import model.PasswordResetToken;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/auth")
public class AuthControl {
    @Autowired
    private UserService userService;
    @Autowired
    EmailSenderService emailSenderService;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @PostMapping("sendtoken")
    @CrossOrigin
    public ModelAndView addStudent(@ModelAttribute("user") User user, ModelAndView model){
        try {
            System.out.println("finding the user");
            User existingUser = userService.getUserByEmail(user.getEmail(),user.getUsername());
            System.out.println("got the user");
            if (existingUser != null) {
                // Create token
                PasswordResetToken confirmationToken = new PasswordResetToken();
                confirmationToken.setUser(existingUser);
                // Save it
                System.out.println("Save it");
                userService.saveToken(confirmationToken);
                // Create the email
                System.out.println("Create the mail");
                SimpleMailMessage mailMessage = new SimpleMailMessage();
                mailMessage.setTo(existingUser.getEmail());
                mailMessage.setSubject("Complete Password Reset!");
                mailMessage.setFrom("information@bahaushiya.education");

//            Here the URL need to be change while deploying
                mailMessage.setText("To complete the password reset process, please click here: "
                        + "http://www.bahaushiya.education/auth/confirm-reset?token=" + confirmationToken.getToken());

                // Send the email
                System.out.println("mail sendng");
                emailSenderService.sendEmail(mailMessage);
                System.out.println("mail sent");

                model.addObject("message", "Request to reset password received. Check your inbox for the reset link.");

            } else {
                model.addObject("message", "This User and Email Doesn't Match!");
            }
        }catch (Exception e){
            e.printStackTrace();
            System.out.println(e);
            model.addObject("message", "Oops...! Theres Some Error Occured while sendin Email!");
        }


        model.setViewName("passwordreset/forgotpasswordmessage");

        return model;
    }

    @RequestMapping(value = "/confirm-reset", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView validateResetToken(ModelAndView modelAndView, @RequestParam("token") String confirmationToken) {
         PasswordResetToken token = userService.findByConfirmationToken(confirmationToken);

        if (token != null) {
            User user = userService.getUserByEmail(token.getUser().getEmail(),token.getUser().getUsername());
            modelAndView.addObject("user", user);
            modelAndView.addObject("emailId", user.getEmail());
            modelAndView.setViewName("passwordreset/resetpassword");
        } else {
            modelAndView.addObject("message", "The link is invalid or broken!");
            modelAndView.setViewName("error");
        }
        return modelAndView;
    }
    // Endpoint to update a user's password
    @RequestMapping(value = "/reset-password", method = RequestMethod.POST)
    public ModelAndView resetUserPassword(ModelAndView modelAndView, User user) {
        if (user.getUsername() != null) {
            // Use email to find user
            User tokenUser = userService.getUserByUsername(user.getUsername());
            String encodedpass = passwordEncoder.encode(user.getPassword());
            tokenUser.setPassword(encodedpass);
//            tokenUser.setPassword(user.getPassword());
            userService.updateUser(tokenUser);
            modelAndView.addObject("message", "Password successfully reset. You can now log in with the new credentials.");
            if (tokenUser.getUserRole().equals("USER")){
                modelAndView.setViewName("passwordreset/userlogin");
            }else {
                modelAndView.setViewName("passwordreset/adminlogin");
            }

        } else {
            modelAndView.addObject("message", "The link is invalid or broken!");
            modelAndView.setViewName("error");
        }
        return modelAndView;
    }

}
