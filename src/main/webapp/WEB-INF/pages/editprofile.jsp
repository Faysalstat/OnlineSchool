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
                  <div class="container" style="margin:auto;width:60%">
                                 <h2 style="text-align: center;">Teachers Profile</h2>
                                 <div style="width:300px;margin:auto">
                                     <img id="propic" src="${base}/img/students/${student.image}" class="img-thumbnail" alt="Cinque Terre" width="304" height="200"
                                     style="margin-bottom:20px;">
                                     <form>
                                         <input  type="file" id="fileSelect" />
                                     </form>
                                     <button style="margin-top:10px;" class="btn btn-success" onclick="uploadImage()" >Uplaod</button>
                                 </div>

                                  <form  action="${base}/addstudentprofile" method="POST" modelAttribute="student">
                                  	<div class="form-group">
                                  	<input type="hidden" name="id" value="${student.id}"/>
                                  	<input type="hidden" name="image" id="propicimage" value="${student.image}">
                                      	<label>First Name</label>
                                      	<input type="text" class="form-control" name="firstName" value="${student.firstName}">
                                      </div>
                                      <div class="form-group">
                                      	<label>Last Name</label>
                                      	<input type="text" class="form-control" name="lastName" value="${student.lastName}">
                                      </div>
                                      <div class="form-group">
                                         <label>Instituite</label>
                                         <input type="text" class="form-control" name="institude" value="${student.institude}">
                                      </div>
                                      <div class="form-group">
                                      	<label>Occupation</label>
                                      	<input type="text" class="form-control" name="degree" value="${student.degree}">
                                      </div>
                                      <div class="form-group">
                                          <label>Subject</label>
                                          <input type="text" class="form-control" name="subject" value="${degree.subject}">
                                      </div>
                                      <br/><br/>

                                      <div class="form-group">
                                      	<input class="btn btn-primary" type="submit" value="Submit" >
                                      </div>
                                  </form>
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

        <script type="text/javascript">
                    function uploadImage() {
                        var formData = new FormData();
                        var fileSelect = document.getElementById("fileSelect");

                        if (fileSelect.files && fileSelect.files.length === 1) {
                            var file = fileSelect.files[0];
                            console.log(file);
                            formData.set("image", file, file.name);
                        }
                        console.log("Hello");
                        var request = new XMLHttpRequest();
                        console.log("Hello");
                        request.onreadystatechange = function () {
                            if (this.readyState === 4 && this.status === 200) {
                                console.log(this.responseText);
                                var data = JSON.parse(this.responseText);
                                document.getElementById("propicimage").value = data.iname;
                                document.getElementById("propic").src = "${base}/img/students/" + data.iname;
                            }
                        };
                        request.open('POST', "${base}/studentprofileImageUpload", true);
                        request.send(formData);
                    }
        </script>

    </body>
</html>


