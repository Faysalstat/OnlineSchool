<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="base" value="${fn:substring(url, 0, fn:length(url) - fn:length(req.requestURI))}${req.contextPath}" />
<header id="header-part" style="border-bottom: 1px solid #eee">
    <div class="navigation navigation-2">
        <div class="container">
            <div class="row no-gutters">
                <div class="col-lg-10 col-md-8 col-sm-11 col-11">
                    <nav class="navbar navbar-expand-lg">
                        <a class="navbar-brand" href="index" >
                            <img src="${base}/img/logo.png" alt="Logo" style="height:30px;width:30px;">
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>

                        <div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item"><a href="${base}/home">Home</a></li>
                                <li class="nav-item"><a href="${base}/courses">Courses</a></li>
                                <li class="nav-item"><a href="${base}/teachers">Teachers</a></li>
                                <li class="nav-item"><a href="${base}/blog">Blog</a></li>
                                <li class="nav-item"><a href="${base}/aboutus">About us</a></li>

                                <c:if test="${user!=null}">
                                    <li class="nav-item">
                                        <a href="${base}/notifications">Mail 
                                            <c:if test="${unread.size()!=0}">
                                                <span style="background-color:#ffc600;
                                                      border-radius: 20%;
                                                      padding:0 8px;">
                                                    ${unread.size()}
                                                </span>
                                            </c:if>

                                        </a>
                                    </li>
                                    <li class="nav-item dropdown" style="margin: 0">
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">${user.username}
                                            <span class="caret"></span></a>
                                        <ul class="dropdown-menu" style="height: 190px;">
                                            <li><a style="padding: 10px" href="${base}/mycourses">My Courses</a></li>
                                            <li><a style="padding: 10px" href="${base}/profile">Profile</a></li>
                                            <li><a style="padding: 10px" href="${base}/logout">Logout</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                                <c:if test="${user==null}">
                                    <li class="nav-item"><a href="${base}/login">Log In</a></li>
                                    <li class="nav-item"><a href="${base}/registration">Sign Up</a></li>
                                    </c:if>

                            </ul>
                        </div>
                    </nav> <!-- nav -->
                    
                </div>

                <div class="col-lg-2 col-md-1 col-sm-1 col-1">
                    <div class="right-icon text-right">
                        
                        <ul>
                            <li><a href="#" id="search"><i class="fa fa-search"></i></a></li>
                        </ul>
                    </div> <!-- right icon -->
                </div>
            </div> <!-- row -->
        </div> <!-- container -->
    </div>

</header>

<div class="search-box">
    <div class="serach-form">
        <div class="closebtn">
            <span></span>
            <span></span>
        </div>
        <form action="#">
            <input type="text" placeholder="Search by keyword">
            <button><i class="fa fa-search"></i></button>
        </form>
    </div> <!-- serach form -->
</div>
