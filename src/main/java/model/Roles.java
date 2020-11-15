///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package model;
//
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import static javax.persistence.GenerationType.IDENTITY;
//import javax.persistence.Id;
//import javax.persistence.Table;
//
///**
// *
// * @author Faysal
// */
//@Entity
//@Table(name = "roles",
//         catalog = "onlineschooldb"
//)
//public class Roles {
//    private Integer id;
//    private String name;
//    
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
//    public Roles() {
//    }
//
//    public Roles(String name) {
//        this.name = name;
//    }
// 
//    @Column(name = "name")
//    public String getName() {
//        return name;
//    }
//
//    public void setName(String name) {
//        this.name = name;
//    }
//    
//    
//}
