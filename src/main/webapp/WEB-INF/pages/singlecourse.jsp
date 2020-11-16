<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="hd" uri="/tlds/myTags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="base" value="${fn:substring(url, 0, fn:length(url) - fn:length(req.requestURI))}${req.contextPath}" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>${singleCourse.courseName} - Bahaushiya Education</title>

        <link rel="shortcut icon" href="${base}/img/favicon.png" type="image/png">

        <link rel="stylesheet" href="${base}/css/slick.css">
        <link rel="stylesheet" href="${base}/css/animate.css">
        <link rel="stylesheet" href="${base}/css/nice-select.css">
        <link rel="stylesheet" href="${base}/css/jquery.nice-number.min.css">
        <link rel="stylesheet" href="${base}/css/magnific-popup.css">
        <link rel="stylesheet" href="${base}/css/bootstrap.min.css">
        <link rel="stylesheet" href="${base}/css/font-awesome.min.css">
        <link rel="stylesheet" href="${base}/css/default.css">
        <link rel="stylesheet" href="${base}/css/style.css">
        <link rel="stylesheet" href="${base}/css/responsive.css">
        <link rel="stylesheet" href="${base}/css/override.css">
    </head>

    <body>

        <hd:customheader/>
        <section id="course-single" class="course-single pt-60 pb-80">
            
            <div class="corses-singel">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-10">
                            <div class="section-title pb-60">
                                <h2 class="course-title">${singleCourse.courseName}</h2>
                                <p class="course-subtitle">Learn about mobile app development with React Native, a popular framework maintained by Facebook that enables cross-platform native apps using JavaScript without Java or Swift.</p>
                                <div class="course-info mt-30">
                                    <ul>
                                        <li>
                                            <div class="teacher-name">
                                                <div class="name">
                                                    <span>Taught by</span>
                                                    <h6>Rowland Price</h6>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-category">
                                                <span>Category</span>
                                                <h6>${singleCourse.category}</h6>
                                            </div>
                                        </li>
                                    </ul>
                                </div> <!-- course terms -->
                            </div> <!-- title -->
                        </div>
                    </div>
                </div>
            </div>

                <div class="corses-singel-image">
                    <img src="${base}/img/course/${singleCourse.image}" alt="Courses">
                </div>

                <div class="corses-tab">
                    <div class="tabs">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-8">
                                    <ul class="nav nav-justified" id="myTab" role="tablist">
                                        <li class="nav-item">
                                            <a class="active" id="overview-tab" data-toggle="tab" href="#overview" role="tab" aria-controls="overview" aria-selected="true">Overview</a>
                                        </li>
                                        <li class="nav-item">
                                            <a id="instructor-tab" data-toggle="tab" href="#instructor" role="tab" aria-controls="instructor" aria-selected="false">Instructor</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row flex-row-reverse">
                            <div class="col-lg-4">
                                <div class="row">
                                    <div class="col-lg-12 col-md-6">
                                        <div class="course-features mt-30">
                                            <h4>Course Features </h4>
                                            <ul>
                                                <li><i class="fa fa-clock-o"></i>Duaration : <span>${singleCourse.duration} Hours</span></li>
                                                <li><i class="fa fa-clone"></i>Leactures : <span>${singleCourse.lecturesCount}</span></li>
                                                <li><i class="fa fa-beer"></i>Quizzes :  <span>${singleCourse.quizCount}</span></li>
                                                <li><i class="fa fa-user-o"></i>Students :  <span>${singleCourse.studentCapacity}</span></li>
                                            </ul>
                                            <div class="price-button pt-10">
                                                <p>Price : <b>${singleCourse.price}</b></p>
                                                <c:choose>
                                                    <c:when test="${enrolled}">
                                                        <h4 style="padding:3px 15px;
                                                            background-color: #ffc107;
                                                            border-radius: 20%;
                                                            font-size: 18px;
                                                            text-align: center;
                                                            "> You Enrolled to This Course</h4>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="${base}/buySingleCourse/${singleCourse.id}" style="margin-top:20px;">
                                                            <button type="button" class="main-btn" >Enroll Now</button>
                                                        </a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div> <!-- course features -->
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="corses-tab mt-30">
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview-tab">
                                            <div class="overview-description">
                                                <div class="singel-description pt-40">
                                                    <h6>Course Summery</h6>
                                                    <p>
                                                        ${singleCourse.courseSummary}
                                                    </p>
                                                </div>
                                                <div class="singel-description pt-40">
                                                    <h6>Requrements</h6>
                                                    <p>
                                                        ${singleCourse.requirements}
                                                    </p>
                                                </div>
                                            </div> <!-- overview description -->
                                        </div>
                                        <div class="tab-pane fade" id="instructor" role="tabpanel" aria-labelledby="instructor-tab">
                                            <div class="instructor-cont">
                                                <div class="instructor-author">
                                                    <div class="author-thum">
                                                        <img src="${base}/img/teachers/${singleCourse.teacher.image}" alt="Instructor">
                                                    </div>
                                                    <div class="author-name">
                                                        <a href="#"><h5>${singleCourse.teacher.firstName} ${singleCourse.teacher.lastName}</h5></a>
                                                        <span>${singleCourse.teacher.designation}</span>
                                                        <ul class="social">
                                                            <li><a href="#"><i class="fa fa-facebook-f"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="instructor-description pt-25">
                                                    <p>
                                                        ${singleCourse.teacher.details}
                                                    </p>
                                                </div>
                                            </div> <!-- instructor cont -->
                                        </div>
                                    </div> <!-- tab content -->
                                </div>
                            </div>
                        </div> <!-- row -->
                    </div>
                </div>
        </section>

        <!--        <section id="cta-block" class="cta-block bg-cover pt-60 pb-60">
                    <div class="container">
                        <a href="$ {base}/joincourse/$ {singleCourse.id}"> 
                            <button style="margin-left: 30px;" class="btn btn-danger">Join Course</button>
                        </a>
                    </div>  container 
                </section>-->

        <hd:customfooter/>

        <a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>

        <!--====== jquery js ======-->
        <script src="${base}/js/vendor/modernizr-3.6.0.min.js"></script>
        <script src="${base}/js/vendor/jquery-1.12.4.min.js"></script>

        <!--====== Bootstrap js ======-->
        <script src="${base}/js/bootstrap.min.js"></script>

        <!--====== Slick js ======-->
        <script src="${base}/js/slick.min.js"></script>

        <!--====== Magnific Popup js ======-->
        <script src="${base}/js/jquery.magnific-popup.min.js"></script>

        <!--====== Counter Up js ======-->
        <script src="${base}/js/waypoints.min.js"></script>
        <script src="${base}/js/jquery.counterup.min.js"></script>

        <!--====== Nice Select js ======-->
        <script src="${base}/js/jquery.nice-select.min.js"></script>

        <!--====== Nice Number js ======-->
        <script src="${base}/js/jquery.nice-number.min.js"></script>

        <!--====== Count Down js ======-->
        <script src="${base}/js/jquery.countdown.min.js"></script>

        <!--====== Validator js ======-->
        <script src="${base}/js/validator.min.js"></script>

        <!--====== Ajax Contact js ======-->
        <script src="${base}/js/ajax-contact.js"></script>

        <!--====== Main js ======-->
        <script src="${base}/js/main.js"></script>

        <!--====== Map js ======-->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDC3Ip9iVC0nIxC6V14CKLQ1HZNF_65qEQ"></script>
        <script src="${base}/js/map-script.js"></script>

    </body>
</html>


