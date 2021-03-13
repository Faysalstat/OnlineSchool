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
        <title>Sign In - Bahaushiya Education</title>

        <link rel="shortcut icon" href="${base}/img/favicon.png" type="image/png">

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

        <section class="form-block register-block pt-40 pb-40">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5">
                        <div class="feature pt-50">
                            <ul>
                                <li>
                                    <div class="singel-feature">
                                        <div class="icon">
                                            <img src="${base}/img/all-icon/f-1-gray.png" alt="icon">
                                        </div>
                                        <div class="cont">
                                            <h4>Expert Teachers</h4>
                                            <p>Gravida nibh vel velit auctor aliquetn auci elit cons solliazcitudirem sem quibibendum sem nibhutis.</p>
                                        </div>
                                    </div> <!-- singel feature -->
                                </li>
                                <li>
                                    <div class="singel-feature">
                                        <div class="icon">
                                            <img src="${base}/img/all-icon/f-2-gray.png" alt="icon">
                                        </div>
                                        <div class="cont">
                                            <h4>Top In-Demand Courses</h4>
                                            <p>Gravida nibh vel velit auctor aliquetn auci elit cons solliazcitudirem sem quibibendum sem nibhutis.</p>
                                        </div>
                                    </div> <!-- singel feature -->
                                </li>
                                <li>
                                    <div class="singel-feature">
                                        <div class="icon">
                                            <img src="${base}/img/all-icon/f-3-gray.png" alt="icon">
                                        </div>
                                        <div class="cont">
                                            <h4>Comprehensive Lectures</h4>
                                            <p>Gravida nibh vel velit auctor aliquetn auci elit cons solliazcitudirem sem quibibendum sem nibhutis.</p>
                                        </div>
                                    </div> <!-- singel feature -->
                                </li>
                            </ul>
                        </div> <!-- feature -->
                    </div>
                    <div class="col-lg-6 offset-1">
                        <div class="signin-form pb-40">
                            <div class="row justify-content-center">
                                <div class="col-lg-10">
                                    <div class="section-title pt-30 pb-0">
                                        <h2 class="course-title">Enroll for a Course</h2>
                                    </div> <!-- title -->
                                </div>
                            </div>
                            <!-- <div class="form-title text-center">
                                <h3>Enroll for a Course</h3>
                            </div> -->

                            <div class="main-form">
                                <form  action="${base}/registerstudent" method="POST" id="stuform" modelAttribute="studentModel">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="singel-form">
                                                <label>First Name</label>
                                                <input type="text" name="student.firstName" value="${studentModel.student.firstName}"/>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="singel-form">
                                                <label>Last Name</label>
                                                <input type="text" name="student.lastName" value="${studentModel.student.lastName}" />
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="singel-form">
                                                <label>Institute</label>
                                                <input type="text" name="student.institude" value="${studentModel.student.institude}" />
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="singel-form">
                                                <label>Subject</label>
                                                <input type="text" name="student.subject" value="${studentModel.student.subject}"/>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="singel-form">
                                                <label >Degree</label>
                                                <input type="text" name="student.degree" value="${studentModel.student.degree}"/>
                                            </div>
                                        </div>
                                    </div>.
                                    <div class="singel-form">
                                        <label>Your Email</label>
                                        <p style="color:red">${emailExists}</p>
                                        <input type="email" name="user.email" id="email" value="${studentModel.user.email}">
                                    </div>

                                    <div class="singel-form">
                                        <label>Your Phone No.</label>
                                        <input type="text" name="user.contact" value="${studentModel.user.contact}">
                                    </div>
                                    <div class="singel-form">
                                        <label>Username</label>
                                        <input type="text" name="user.username" value="${studentModel.user.username}">
                                    </div>
                                    <div class="singel-form">
                                        <label>Password</label>
                                        <input type="password" name="user.password" value="${studentModel.user.password}">
                                    </div>

                                </form>
                                <div class="singel-form">
                                    <button class="main-btn" form="stuform" type="submit">Register Now</button>
                                </div>
                            </div>
                            <div class="form-footer text-center">
                                <p>Already have an account? <a href="${base}/login">Log In</a></p>
                            </div>
                        </div>
                    </div>
                </div> <!-- row -->
            </div> <!-- container -->
        </section>

        <hd:customfooter/>

        <!--====== jquery js ======-->


        <script src="${base}/js/vendor/modernizr-3.6.0.min.js"></script>
        <script src="${base}/js/vendor/jquery-1.12.4.min.js"></script>

        <!--====== Bootstrap js ======-->
        <script src="${base}/js/bootstrap.min.js"></script>

        <!--====== Validator js ======-->
        <script src="${base}/js/validator.min.js"></script>
    </body>
</html>


