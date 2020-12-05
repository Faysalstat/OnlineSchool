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
        <title>Profile - Bahaushiya Education</title>

        <link rel="shortcut icon" href="img/favicon.png" type="image/png">

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

        <style>
            .titles{
                            font-size: 20px;
                            font-weight: bolder;
                            color:#222730;
                margin-bottom: 10px;
                   }
                   .info{
                                   font-size: 20px;
                                   color:#222730;
                                   margin-bottom: 10px;
                                   text-align: left;
                               }
        </style>
    </head>

    <body>

        <hd:customheader/>



        <section id="courses-part" class="pt-20 pb-120">
            <div class="container" style>
                <div class="tab-content" id="myTabContent" style="border:1psolid black">
                  <div class="row">

                        <div class="col-md-3">
                                <img src="${base}/img/students/${student.image}" width="300" height="300">
                        </div>
                        <div class="col-md-2">
                                <div class="titles">Name</div>
                                <div class="titles">Institude</div>
                                <div class="titles">Degree</div>
                                <div class="titles">Subeject</div>
                                <div class="titles">Email</div>
                                <div class="titles">Contact</div>
                                <div class="titles">User Name</div>
                                <div class="titles">Password</div>

                        </div>

                        <div class="col-md-3">
                            <div class="info">${student.firstName} ${student.lastName}

                            </div>
                            <div class="info">${student.institude}</div>
                            <div class="info">${student.degree}</div>
                            <div class="info">${student.subject}</div>
                            <div class="info">${student.user.email}</div>
                            <div class="info">${student.user.contact}</div>
                            <div class="info">${student.user.username}</div>
                            <div class="info"><a href="${base}/changePassword/${student.user.email}">Change Password</a></div>

                        </div>
                        <div class="col-md-4">

                                                <a href="${base}/editprofile">
                                                    <button type="button" class="btn btn-success"> Edit Profile</button>
                                                </a>

                        </div>
                  </div>
                </div> <!-- tab content -->
            </div> <!-- container -->
        </section>


        <script src="https://js.paystack.co/v1/inline.js"></script>
        <script>

        </script>
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


