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
        <title>Browse Our Courses - Bahaushiya Education</title>

        <link rel="shortcut icon" href="img/favicon.png" type="image/png">

        <link rel="stylesheet" href="css/slick.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/jquery.nice-number.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/default.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">
        <link rel="stylesheet" href="css/override.css">
    </head>

    <body>

        <hd:customheader/>

        <section id="page-banner" class="pt-105 pb-110 bg_cover" data-overlay="8">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-10">
                        <div class="page-banner-cont">
                            <h2>Browse Our Courses</h2>
                            <span>We Offer Top In-Demand Courses</span>
                            <div class="slider-search mt-45">
                                <form action="#">
                                    <div class="row no-gutters">
                                        <div class="col-sm-3">
                                            <select>
                                                <option value="0">Category</option>
                                                <option value="1">Category 01</option>
                                                <option value="2">Category 02</option>
                                                <option value="3">Category 03</option>
                                                <option value="4">Category 04</option>
                                                <option value="5">Category 05</option>
                                            </select>
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="text" placeholder="Search keyword">
                                        </div>
                                        <div class="col-sm-3">
                                            <button type="button" class="main-btn">Search Now</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>  <!-- page banner cont -->
                    </div>
                </div> <!-- row -->
            </div> <!-- container -->
        </section>

        <section id="courses-part" class="pt-20 pb-120">
            <div class="container">
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="courses-grid" role="tabpanel" aria-labelledby="courses-grid-tab">
                        <div class="row">

                            <!--Single course start-->
                            <c:forEach var="course" items="${courselist}"  varStatus="status" >
                                <div class="col-lg-4 col-md-6">
                                    <div class="singel-course mt-30">
                                        <div class="thum">
                                            <div class="image">
                                                <img src="img/course/${course.image}" alt="Course"
                                                style="width:100%;height:250px;">
                                            </div>
                                            <div class="price">
                                                <span>Free</span>
                                            </div>
                                        </div>
                                        <div class="cont">
                                            <h4><a href="singlecourse/${course.id}">${course.courseName}</a></h4>
                                            <div class="course-teacher">
                                                <div class="author">
                                                    <cite>- Rowland Price</cite>
                                                </div>
                                            </div>

                                            <div class="course-info">
                                                <div class="level">
                                                    <span class="text-muted">${course.courseLevel}</span>
                                                </div>
                                                <div class="date">
                                                    <b class="start-date">Begins ${course.startingDate}</b>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                </div>
                            </c:forEach>
                        </div> <!-- row -->
                    </div>
                </div> <!-- tab content -->
            </div> <!-- container -->
        </section>

        <section id="cta-block" class="cta-block bg-cover pt-60 pb-60">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title pb-40 text-center">
                            <h5>What are you waiting for?</h5>
                            <h2>Enroll for a Course</h2>
                        </div> <!-- section title -->
                    </div>
                </div> <!-- row -->
                <div class="row mt-0">
                    <div class="col-lg-12">
                        <div class="text-center">
                            <a data-animation="fadeInUp" data-delay="1.6s" class="main-btn" href="register .html" tabindex="0" style="animation-delay: 1.6s;">Enroll Now</a>
                        </div>
                    </div>
                </div> <!-- testimonial slied -->
            </div> <!-- container -->
        </section>

        <hd:customfooter/>

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


