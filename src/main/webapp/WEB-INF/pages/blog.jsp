<%-- 
    Document   : blog
    Created on : Sep 2, 2020, 11:07:44 PM
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
    <title>Blog - Top In-Demand Technology Courses, Training - Bahaushiya Education</title>
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
    <section id="blog-page" class="blog-page pt-90 pb-120">
        <div class="container">
          <div class="row justify-content-center">
              <div class="col-lg-10">
                  <div class="pb-80 section-title text-center">
                    <h5>Our Blog</h5>
                    <h2>Learn at Bahaushiya. Stay Ahead.</h2>
                  </div> <!-- slider cont3 -->
              </div>
          </div> <!-- row -->
           <div class="row">
               <div class="col-lg-12">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="singel-blog mt-30">
                          <div class="blog-thum">
                              <img src="${base}/img/blog/b-1.jpg" alt="Blog">
                          </div>
                          <div class="blog-cont">
                              <a href="blog-singel.html"><h3>Few tips for get better results in examination</h3></a>
                              <ul>
                                  <li><a href="#"><i class="fa fa-calendar"></i>25 Dec 2018</a></li>
                                  <li><a href="#"><i class="fa fa-user"></i>Mark anthem</a></li>
                                  <li><a href="#"><i class="fa fa-tags"></i>Education</a></li>
                              </ul>
                              <p>Lorem ipsum gravida nibh vel velit auctor aliquetn sollicitudirem quibibendum auci elit cons equat ipsutis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. Nam nec tellus .</p>
                          </div>
                      </div> <!-- singel blog -->
                    </div>
                    <div class="col-lg-6">
                      <div class="singel-blog mt-30">
                          <div class="blog-thum">
                              <img src="${base}/img/blog/b-2.jpg" alt="Blog">
                          </div>
                          <div class="blog-cont">
                              <a href="blog-singel.html"><h3>Few tips for get better results in examination</h3></a>
                              <ul>
                                  <li><a href="#"><i class="fa fa-calendar"></i>25 Dec 2018</a></li>
                                  <li><a href="#"><i class="fa fa-user"></i>Mark anthem</a></li>
                                  <li><a href="#"><i class="fa fa-tags"></i>Education</a></li>
                              </ul>
                              <p>Lorem ipsum gravida nibh vel velit auctor aliquetn sollicitudirem quibibendum auci elit cons equat ipsutis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. Nam nec tellus .</p>
                          </div>
                      </div> <!-- singel blog -->
                    </div>
                  </div>

                   <nav class="courses-pagination mt-50">
                        <ul class="pagination justify-content-center">
                            <li class="page-item">
                                <a href="#" aria-label="Previous">
                                    <i class="fa fa-angle-left"></i>
                                </a>
                            </li>
                            <li class="page-item"><a class="active" href="#">1</a></li>
                            <li class="page-item"><a href="#">2</a></li>
                            <li class="page-item"><a href="#">3</a></li>
                            <li class="page-item">
                                <a href="#" aria-label="Next">
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </li>
                        </ul>
                    </nav>  <!-- courses pagination -->
               </div>
           </div> <!-- row -->
        </div> <!-- container -->
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


