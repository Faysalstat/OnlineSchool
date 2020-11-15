<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="base" value="${fn:substring(url, 0, fn:length(url) - fn:length(req.requestURI))}${req.contextPath}" />
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

