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



        <section id="courses-part" class="pt-20 pb-120">
            <div class="container">
                <!--<div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">-->
                <div class="reviews-cont">
                    <div class="title">
                        <h3>Notifications</h3>
                    </div>
                    <ul>
                        <c:forEach var="message" items="${messagelist}"  varStatus="status" >
                            <li>
                                <c:if test='${message.status =="Unread"}'>
                                    <div id="message_${message.id}"  class="singel-reviews" style="border-bottom: 2px solid black;padding: 20px;background-color:#eee">
                                        <div class="reviews-author">
                                            <div class="author-thum">
                                                <img src="${base}/img/teachers/${message.messageFrom.image}" width="80px" height="80px" alt="Reviews">
                                            </div>
                                            <div class="author-name">
                                                <h6>${message.messageFrom.firstName} ${message.messageFrom.lastName}</h6>
                                                <!--<span>April 20, 2019</span>-->
                                               
                                                <span>${message.sendtime}</span>
                                            </div>
                                        </div>
                                        <div class="reviews-description pt-20">
                                            <p>
                                                ${message.content}
                                            </p>
                                            <button id="btn_${message.id}" class="btn btn-info" onclick="markRead(${message.id})">Mark Read</button> 
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test='${message.status !="Unread"}'>
                                    <div id="message_${message.id}"  class="singel-reviews" style="border-bottom: 2px solid black;padding: 20px;">
                                        <div class="reviews-author">
                                            <div class="author-thum">
                                                <img src="${base}/img/teachers/${message.messageFrom.image}" width="80px" height="80px" alt="Reviews">
                                            </div>
                                            <div class="author-name">
                                                <h6>${message.messageFrom.firstName} ${message.messageFrom.lastName}</h6>
                                                <span>${message.sendtime}</span>
                                            </div>
                                        </div>
                                        <div class="reviews-description pt-20">
                                            <p>
                                                ${message.content}
                                            </p>
                                            
                                        </div>
                                    </div>
                                </c:if>
                            </li>
                        </c:forEach>
                    </ul>
                    <script>
                        function markRead(id) {
                            var request = new XMLHttpRequest();
                            request.onreadystatechange = function () {
                                if (this.readyState === 4 && this.status === 200) {
                                    console.log(this.responseText);
                                    document.getElementById('message_' + id).style.backgroundColor = "white";
                                    document.getElementById('btn_'+id).style.display ='none';
                                }
                            };
                            request.open('POST', 'markread/' + id, true);
                            request.send();

                        }
                    </script>
                                    
                    <!--</div>  reviews cont -->
                </div>
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


