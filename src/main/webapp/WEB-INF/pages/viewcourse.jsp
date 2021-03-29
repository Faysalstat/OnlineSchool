<%-- 
    Document   : viewcourse
    Created on : Sep 13, 2020, 12:47:57 AM
    Author     : Faysal
--%>
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
        <link rel="stylesheet" href="${base}/css/custom.css">
        <link rel="stylesheet" href="${base}/css/responsive.css">
        <link rel="stylesheet" href="${base}/css/override.css">
    </head>
    <body>
        <hd:customheader/>
        <div class="container">
            <div class="row">

                <div class="col-md-8">
                    <h1>Course Name: Lecture 1</h1>
                    <iframe id="url" width="720" height="480"
                            src="https://www.youtube.com/embed/tgbNymZ7vqY?controls=0">
                    </iframe>
                    <hr style="height:5px;background-color:#eee"/>

                    <div>


                    </div>

                </div>
                <div class="col-md-4">
                    <h2>Lectures</h2>
                    <ul class="list-group">
                        <c:forEach var="content" items="${contentlist}"  varStatus="status" >
                            <a href="javascript:void(0)" onclick="setUrl('${content.lectureUrl}')" >
                                <li class="list-group-item" style="margin-bottom:10px;">
                                    <input type="checkbox"  checked="true"> Lecture : Basic of the programming
                                    <br/>
                                    <span class="video-length">${content.lectureLength} min</span>
                                </li> 
                            </a>
                        </c:forEach>
                    </ul>
                    <h2>Lectures files</h2>
                    <ul class="list-group">
                         <c:forEach var="file" items="${filesList}"  varStatus="status" >
                                <a href="${base}/files/${file.fileUrl}" target="_blank">
                                    <li class="list-group-item" style="margin-bottom:10px;">
                                       <img src="${base}/img/all-icon/pdf.ico" style="width:30px;height:30px;" />
                                       <span>${file.fileName}</span>
                                    </li>
                                </a>
                         </c:forEach>


                    </ul>
                </div>

            </div>


        </div>
        <hd:customfooter/>
        <script>
            function setUrl(url) {
                document.getElementById('url').src = "https://www.youtube.com/embed/"+url+"?controls=0";
            }

        </script>
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
