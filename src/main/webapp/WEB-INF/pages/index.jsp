
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="hd" uri="/tlds/myTags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Bahaushiya Education - Top In-Demand Technology Courses &amp; Training</title>

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
        <section id="slider-part" class="slider-active">
            <div class="single-slider bg_cover pt-150" style="background-image: url(${base}/img/slider/s-1.jpg)" data-overlay="4">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-9">
                            <div class="slider-cont">
                                <h1 data-animation="bounceInLeft" data-delay="1s">Your courses to success</h1>
                                <p data-animation="fadeInUp" data-delay="1.3s">Learn Top Technology Skills in Demand for 2020 and Beyond</p>
                                <ul>
                                    <li><a data-animation="fadeInUp" data-delay="1.9s" class="main-btn main-btn-2" href="register.html">Enroll for a Course</a></li>
                                </ul>
                            </div>
                        </div>
                    </div> <!-- row -->
                </div> <!-- container -->
            </div>

            <div class="single-slider bg_cover pt-150" style="background-image: url(${base}/img/slider/s-2.jpg)" data-overlay="4">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-9">
                            <div class="slider-cont">
                                <h1 data-animation="bounceInLeft" data-delay="1s">Jump start and get ahead</h1>
                                <p data-animation="fadeInUp" data-delay="1.3s">Gain proficiency in technology courses from industry experts.</p>
                                <ul>
                                    <li><a data-animation="fadeInUp" data-delay="1.9s" class="main-btn main-btn-2" href="register .html">Enroll for a Course</a></li>
                                </ul>
                            </div>
                        </div>
                    </div> <!-- row -->
                </div> <!-- container -->
            </div> <!-- single slider -->
        </section>

        <section class="gray-bg">
            <section id="campaign-block">
                <div class="container">
                    <div class="campaign-banner pt-40 pb-80">
                        <div class="category">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="category-text pt-40">
                                        <h2>Hot In-Demand Categories</h2>
                                        <p><a href="#" class="">Browse Courses &rarr;</a></p>
                                    </div>
                                </div>
                                <div class="col-lg-6 offset-lg-1 col-md-8 offset-md-2 col-sm-8 offset-sm-2 col-8 offset-2">
                                    <div class="row category-slied mt-40">
                                        <div class="col-lg-4">
                                            <a href="#">
                                                <span class="singel-category text-center color-1">
                                                    <span class="icon">
                                                        <img src="${base}/img/all-icon/ctg-1.png" alt="Icon">
                                                    </span>
                                                    <span class="cont">
                                                        <span>Software &amp; Programming</span>
                                                    </span>
                                                </span> <!-- singel category -->
                                            </a>
                                        </div>
                                        <div class="col-lg-4">
                                            <a href="#">
                                                <span class="singel-category text-center color-2">
                                                    <span class="icon">
                                                        <img src="${base}/img/all-icon/ctg-2.png" alt="Icon">
                                                    </span>
                                                    <span class="cont">
                                                        <span>Web Development</span>
                                                    </span>
                                                </span> <!-- singel category -->
                                            </a>
                                        </div>
                                        <div class="col-lg-4">
                                            <a href="#">
                                                <span class="singel-category text-center color-3">
                                                    <span class="icon">
                                                        <img src="${base}/img/all-icon/ctg-3.png" alt="Icon">
                                                    </span>
                                                    <span class="cont">
                                                        <span>Video &amp; Animation</span>
                                                    </span>
                                                </span> <!-- singel category -->
                                            </a>
                                        </div>
                                        <div class="col-lg-4">
                                            <a href="#">
                                                <span class="singel-category text-center color-1">
                                                    <span class="icon">
                                                        <img src="${base}/img/all-icon/ctg-1.png" alt="Icon">
                                                    </span>
                                                    <span class="cont">
                                                        <span>Mobile App Development</span>
                                                    </span>
                                                </span> <!-- singel category -->
                                            </a>
                                        </div>
                                        <div class="col-lg-4">
                                            <a href="#">
                                                <span class="singel-category text-center color-2">
                                                    <span class="icon">
                                                        <img src="${base}/img/all-icon/ctg-2.png" alt="Icon">
                                                    </span>
                                                    <span class="cont">
                                                        <span>Graphics Design</span>
                                                    </span>
                                                </span> <!-- singel category -->
                                            </a>
                                        </div>
                                    </div> <!-- category slied -->
                                </div>
                            </div> <!-- row -->
                        </div>
                    </div> <!-- category -->
                </div> <!-- container -->
            </section>

            <section id="key-selling-block" class="key-selling-block pb-60">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-6">
                            <div class="singel-feature">
                                <div class="icon">
                                    <img src="${base}/img/all-icon/f-1-gray.png" alt="icon">
                                </div>
                                <div class="cont">
                                    <h4>Expert Teachers</h4>
                                    <p>Gravida nibh vel velit auctor aliquetn auci elit cons solliazcitudirem sem quibibendum sem nibhutis.</p>
                                </div>
                            </div> <!-- singel feature -->
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="singel-feature">
                                <div class="icon">
                                    <img src="${base}/img/all-icon/f-2-gray.png" alt="icon">
                                </div>
                                <div class="cont">
                                    <h4>Top In-Demand Courses</h4>
                                    <p>Gravida nibh vel velit auctor aliquetn auci elit cons solliazcitudirem sem quibibendum sem nibhutis.</p>
                                </div>
                            </div> <!-- singel feature -->
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="singel-feature">
                                <div class="icon">
                                    <img src="${base}/img/all-icon/f-3-gray.png" alt="icon">
                                </div>
                                <div class="cont">
                                    <h4>Hands-On Learning</h4>
                                    <p>Gravida nibh vel velit auctor aliquetn auci elit cons solliazcitudirem sem quibibendum sem nibhutis.</p>
                                </div>
                            </div> <!-- singel feature -->
                        </div>
                    </div>
                </div>
            </section>
        </section>

        <section id="" class="course-levels pt-60 pb-20">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="section-title">
                            <h2>Courses for Everyone</h2>
                        </div> <!-- section title -->
                    </div>
                </div> <!-- row -->
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="singel-items mt-30">
                            <div class="items-image">
                                <img src="${base}/img/category/ctg-1.jpg" alt="Category">
                            </div>
                            <a nohref="#" class="items-cont">
                                <span class="wrap">
                                    <h5>Beginner</h5>
                                    <span>${count.basic} courses</span>
                                </span>
                            </a>
                        </div> <!-- singel items -->
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="singel-items mt-30">
                            <div class="items-image">
                                <img src="${base}/img/category/ctg-1.jpg" alt="Category">
                            </div>
                            <a nohref="#" class="items-cont">
                                <span class="wrap">
                                    <h5>Intermediate</h5>
                                    <span>${count.intermediate} courses</span>
                                </span>
                            </a>
                        </div> <!-- singel items -->
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="singel-items mt-30">
                            <div class="items-image">
                                <img src="${base}/img/category/ctg-1.jpg" alt="Category">
                            </div>
                            <a nohref="#" class="items-cont">
                                <span class="wrap">
                                    <h5>Expert</h5>
                                    <span>${count.advanced} courses</span>
                                </span>
                            </a>
                        </div> <!-- singel items -->
                    </div>
                </div> <!-- row -->
            </div> <!-- container -->
        </section>

        <!-- TOP 5 IN-DEMAND COURSES -->
        <section id="course-block" class="top-courses pt-60 pb-60">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="section-title">
                            <h5>Our courses</h5>
                            <h2>Top In-Demand Courses to Learn</h2>
                        </div> <!-- section title -->
                    </div>
                </div> <!-- row -->
                <div class="row course-slied">
                    <c:forEach var="course" items="${courselist}"  varStatus="status" >
                        <div class="col-lg-4">
                            <div class="singel-course mt-30">
                                <div class="thum">
                                    <div class="image">
                                        <img src="${base}/img/course/${course.image}" alt="Course">
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
                            </div> <!-- singel course -->
                        </div> 
                    </c:forEach>


                </div> <!-- course slied -->
            </div> <!-- container -->
        </section>

        <section id="testimonial" class="bg_cover pt-60 pb-115 gray-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title pb-40 text-center">
                            <h2>Happy Students</h2>
                        </div> <!-- section title -->
                    </div>
                </div> <!-- row -->
                <div class="row testimonial-slied mt-0">
                    <div class="col-lg-12">
                        <div class="singel-testimonial">
                            <div class="testimonial-thum">
                                <img src="${base}/img/testimonial/t-1.jpg" alt="Testimonial">
                                <div class="quote">
                                    <i class="fa fa-quote-right"></i>
                                </div>
                            </div>
                            <div class="testimonial-cont">
                                <p>Aliquetn sollicitudirem quibibendum auci elit cons equat ipsutis sem nibh id elit. Duis sed odio sit amet sem nibh id elit sollicitudirem </p>
                                <h6>Rubina Helen</h6>
                                <span>Bsc, Engineering</span>
                            </div>
                        </div> <!-- singel testimonial -->
                    </div>
                    <div class="col-lg-12">
                        <div class="singel-testimonial">
                            <div class="testimonial-thum">
                                <img src="${base}/img/testimonial/t-2.jpg" alt="Testimonial">
                                <div class="quote">
                                    <i class="fa fa-quote-right"></i>
                                </div>
                            </div>
                            <div class="testimonial-cont">
                                <p>Aliquetn sollicitudirem quibibendum auci elit cons equat ipsutis sem nibh id elit. Duis sed odio sit amet sem nibh id elit sollicitudirem </p>
                                <h6>Rubina Helen</h6>
                                <span>Bsc, Engineering</span>
                            </div>
                        </div> <!-- singel testimonial -->
                    </div>
                    <div class="col-lg-12">
                        <div class="singel-testimonial">
                            <div class="testimonial-thum">
                                <img src="${base}/img/testimonial/t-3.jpg" alt="Testimonial">
                                <div class="quote">
                                    <i class="fa fa-quote-right"></i>
                                </div>
                            </div>
                            <div class="testimonial-cont">
                                <p>Aliquetn sollicitudirem quibibendum auci elit cons equat ipsutis sem nibh id elit. Duis sed odio sit amet sem nibh id elit sollicitudirem </p>
                                <h6>Rubina Helen</h6>
                                <span>Bsc, Engineering</span>
                            </div>
                        </div> <!-- singel testimonial -->
                    </div>
                </div> <!-- testimonial slied -->
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
                            <a data-animation="fadeInUp" data-delay="1.6s" class="main-btn" href="${base}/courses" tabindex="0" style="animation-delay: 1.6s;">Enroll Now</a>
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


