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

        <link rel="shortcut icon" href="images/favicon.png" type="image/png">

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

        <section class="form-block signin-block">
            <div class="container">
                <div class="signin pt-80 pb-80">
                    <div class="row">
                        <div class="col-lg-6 signin-col">
                            <div class="signin-form pb-40">
                                <div class="row justify-content-center">
                                    <div class="col-lg-10">
                                        <div class="section-title pt-30 pb-0">
                                            <h2 class="course-title">Login</h2>
                                        </div> <!-- title -->
                                    </div>
                                </div>
                                <!-- <div class="form-title text-center">
                                    <h3>Sign In</h3>
                                </div> -->
                                <div class="main-form">
                                    <form action="login" method="post">
                                        <div class="singel-form">
                                            <label >Email</label>
                                            <input type="text" name="username"/>
                                        </div>
                                        <div class="singel-form">
                                            <label >Password</label>
                                            <input type="password" name="password"  >
                                            <input type="hidden"
                                                   name="${_csrf.parameterName}"
                                                   value="${_csrf.token}"
                                                   />
                                        </div>
                                        <div class="singel-form">
                                            <p><a href="${base}/forgotpassword">Forgot Password</a></p>
                                        </div>
                                        <div class="singel-form">
                                            <input class="main-btn" type="submit" value="Get In Now"/>
                                            
                                        </div>
                                    </form>
                                </div>
                                <div class="form-footer text-center">
                                    <p>Don't have an account? <a href="registration">Register</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <hd:customfooter/>

        <!--====== jquery js ======-->
        <script src="js/vendor/modernizr-3.6.0.min.js"></script>
        <script src="js/vendor/jquery-1.12.4.min.js"></script>

        <!--====== Bootstrap js ======-->
        <script src="js/bootstrap.min.js"></script>

        <!--====== Validator js ======-->
        <script src="js/validator.min.js"></script>
    </body>
</html>


