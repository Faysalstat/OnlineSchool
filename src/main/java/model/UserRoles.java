///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package model;
//
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.FetchType;
//import javax.persistence.GeneratedValue;
//import static javax.persistence.GenerationType.IDENTITY;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
//import javax.persistence.Table;
//
///**
// *
// * @author Faysal
// */
//@Entity
//@Table(name = "user_roles",
//        catalog = "onlineschooldb"
//)
//public class UserRoles {
//
//    private Integer id;
//    private Roles roles;
//    private User user;
//
//    @Id
//    @GeneratedValue(strategy = IDENTITY)
//
//    @Column(name = "id", unique = true, nullable = false)
//    public Integer getId() {
//        return this.id;
//    }
//    public void setId(Integer id) {
//        this.id = id;
//    }
//
//    public UserRoles(Roles roles, User user) {
//        this.roles = roles;
//        this.user = user;
//    }
//
//    @ManyToOne(fetch = FetchType.EAGER)
//    @JoinColumn(name = "roles_id")
//    public Roles getRoles() {
//        return roles;
//    }
//
//    public void setRoles(Roles roles) {
//        this.roles = roles;
//    }
//
//    @ManyToOne(fetch = FetchType.EAGER)
//    @JoinColumn(name = "user_id")
//    public User getUser() {
//        return user;
//    }
//
//    public void setUser(User user) {
//        this.user = user;
//    }
//
//}
