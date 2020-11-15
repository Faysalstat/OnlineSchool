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
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="courses-grid" role="tabpanel" aria-labelledby="courses-grid-tab">
                        <div class="row">

                            <!--Single course start-->
                            <%--<c:forEach var="course" items="${courselist}"  varStatus="status" >--%>
                            <div class="col-lg-4 col-md-6" style="margin: auto">
                                <div class="singel-course mt-30">
                                    <div class="thum">
                                        <div class="image">
                                            <img src="${base}/img/course/${singleCourse.image}" alt="Course">
                                        </div>
                                        <div class="price">
                                            <span> $ ${singleCourse.price}</span>
                                        </div>
                                    </div>
                                    <div class="cont">
                                        <h4><a href="${base}/singlecourse/${singleCourse.id}">${singleCourse.courseName}</a></h4>
                                        <div class="course-teacher">
                                            <div class="author">
                                                <cite>- Rowland Price</cite>
                                            </div>
                                        </div>

                                        <div class="course-info">
                                            <div class="level">
                                                <span class="text-muted">${singleCourse.courseLevel}</span>
                                            </div>
                                            <div class="date">
                                                <b class="start-date">Begins ${singleCourse.startingDate}</b>
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                            </div>
                            <%--</c:forEach>--%>
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
                            <h2>Enroll for this Course</h2>
                        </div> <!-- section title -->
                    </div>
                </div> <!-- row -->
                <div class="row mt-0">
                    <div class="col-lg-12">
                        <div class="text-center">
                            <button type="button" class="main-btn" onclick='payWithPaystack(${singleCourse.price},${singleCourse.id})'>Enroll Now</button>
                        </div>
                    </div>
                </div> <!-- testimonial slied -->
            </div> <!-- container -->
        </section>
        <script src="https://js.paystack.co/v1/inline.js"></script>
        <script>
            function payWithPaystack(amount,cid) {
                var handler = PaystackPop.setup({
                    key: 'pk_test_c7a3e3051884eceae0a3abc5b8a613bc8504402f',
                    email: '${student.user.email}',
                    amount: amount * 100,
                    currency: 'NGN',
                    firstname: '${student.firstName}',
                    lastname: '${student.lastName}',
                    ref: '' + Math.floor((Math.random() * 1000000000) + 1), // generates a pseudo-unique reference. Please replace with a reference you generated. Or remove the line entirely so our API will generate one for you
                    metadata: {
                        custom_fields: [
                            {
                                display_name: "Mobile Number",
                                variable_name: "mobile_number",
                                value: "${user.contact}"
                            }
                        ]
                    },
                    callback: function (response) {
                        var xhttp = new XMLHttpRequest();
                        xhttp.onreadystatechange = function () {
                            if (this.readyState == 4 && this.status == 200) {
                                location.reload();
                            }
                        };
                        xhttp.open("POST", "${base}/paymentsuccess/" + response.reference+"/"+cid, true);
                        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                        xhttp.send();
                    },
                    onClose: function () {
                        alert('window closed');
                    }
                });
                handler.openIframe();
            }
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


