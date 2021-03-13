<%-- 
    Document   : teachersprofile
    Created on : Sep 8, 2020, 5:36:00 PM
    Author     : Faysal
--%>

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
    <title>Meet Our Teachers - Bahaushiya Education</title>

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
    <section id="teachers-part" class="pt-60 pb-60">
        <div class="container">
            <div class="section-title mt-0">
                <h5>Our Teachers</h5>
                <h2>Learn From Experts</h2>
            </div>
            <div class="teachers">
                <div class="row">
                    <div class="col-sm-6 col-md-6">
                        <div class="singel-teachers mt-30 text-center">
                            <div class="image">
                                <img src="${base}/img/teachers/${teacher.image}" alt="Teachers">
                            </div>
                        </div> <!-- singel teachers -->
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <table class="table table-striped" style="margin-top:20px">
                            <tbody>
                              <tr>
                                <td>Name</td>
                                <td>${teacher.firstName} ${teacher.lastName}</td>
                              </tr>
                              <tr>
                                <td>Occupation</td>
                                <td>${teacher.occupation}</td>
                              </tr>
                              <tr>
                                <td>Institute</td>
                                <td>${teacher.institude}</td>
                              </tr>
                              <tr>
                                <td>Designation</td>
                                <td>${teacher.designation}</td>
                              </tr>
                              <tr>
                                 <td>Contact</td>
                                 <td>${teacher.user.contact}</td>
                              </tr>
                              <tr>
                                 <td>Email</td>
                                 <td>${teacher.user.email}</td>
                              </tr>
                              <tr>
                                 <td>Details</td>
                                 <td>${teacher.details}</td>
                              </tr>
                            </tbody>
                          </table>
                    </div>




                </div> <!-- row -->
            </div>
        </div>
    </section>

    <footer id="footer-part" class="pt-40 pb-60">
        <div class="footer-top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-4">
                        <div class="footer-link mt-40">
                            <div class="footer-title pb-25">
                                <h6>BAHAUSHIYA EDUCATION</h6>
                            </div>
                        </div> <!-- footer link -->
                    </div>
                    <div class="col-lg-6 col-md-5 col-sm-6">
                        <div class="footer-link support mt-40">
                            <ul class="">
                                <li><a href="index .html"><i class="fa fa-angle-right"></i>Home</a></li>
                                <li><a href="contact-us .html"><i class="fa fa-angle-right"></i>Contact us</a></li>
                                <li><a href="courses .html"><i class="fa fa-angle-right"></i>Courses</a></li>
                                <li><a href="blog .html"><i class="fa fa-angle-right"></i>News</a></li>
                                <li><a href="blog .html"><i class="fa fa-angle-right"></i>events</a></li>
                            </ul>
                        </div> <!-- support -->
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-3">
                      <div class="footer-social mt-40 float-right">
                          <ul class="float-right">
                              <li><a href="#"><i class="fa fa-facebook-f"></i></a></li>
                              <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                              <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                              <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                          </ul>
                      </div>
                    </div>
                </div> <!-- row -->
            </div> <!-- container -->
        </div> <!-- footer top -->

        <div class="footer-copyright">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="copyright text-md-left text-center pt-15">
                            <p>Copyright &copy; 2020 <a target="_blank" href="http://bahaushiya.net">Bahaushiya Limited</a>. All rights reserved.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="copyright text-md-right text-center pt-15">

                        </div>
                    </div>
                </div> <!-- row -->
            </div> <!-- container -->
        </div> <!-- footer copyright -->
    </footer>

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

