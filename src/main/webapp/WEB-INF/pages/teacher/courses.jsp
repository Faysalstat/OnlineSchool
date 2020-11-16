<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="model.User"%>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="base" value="${fn:substring(url, 0, fn:length(url) - fn:length(req.requestURI))}${req.contextPath}" />
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Add Course</title>
        <link rel="shortcut icon" href="${base}/img/favicon.png" type="image/png">
        <!-- Bootstrap core CSS -->
        <link href="${base}/css/dash/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="${base}/css/dash/css/simple-sidebar.css" rel="stylesheet">

    </head>

    <body>
        <%
            User admin = (User) session.getAttribute("admin");

            if (admin == null || !admin.getUserRole().equals("TEACHER")) {
                response.sendRedirect("login");
            }
        %>
        <div class="d-flex" id="wrapper">

            <!-- Sidebar -->
            <div class="bg-light border-right" id="sidebar-wrapper">
                <div class="sidebar-heading">Dashboard</div>
                <div class="list-group list-group-flush">
                    <a href="${base}/dashboard/teachers" class="list-group-item list-group-item-action bg-light">Dashboard</a>
                    <a href="${base}/dashboard/addcourse" class="list-group-item list-group-item-action bg-light">Add Course</a>
                    <a href="${base}/dashboard/courses" class="list-group-item list-group-item-action bg-light">Courses</a>
                    <a href="${base}/dashboard/profile" class="list-group-item list-group-item-action bg-light">Profile</a>
                    <a href="${base}/dashboard/mail" class="list-group-item list-group-item-action bg-light">Mail</a>
                    <a href="${base}/dashboard/logout" class="list-group-item list-group-item-action bg-light">Log Out</a>
                </div>
            </div>

            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">

                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <h2>Online School Dashboard</h2>
                </nav>

                <div class="container-fluid">
                    <div class="container">
                        <div class="jumbotron">
                            <h1>On Going Courses</h1>
                            <c:forEach var="domain" items="${courses}"  varStatus="status" >
                                <h3 class="c-des">
                                    <span class="c-name">#${status.index+1}</span>
                                    ${domain.courses.courseName}
                                    <a href="addcoursecontent/${domain.courses.id}">
                                        <button class="btn btn-success btn-left">Add Content</button>
                                    </a>
                                    <a href="editcourse/${domain.courses.id}">
                                        <button class="btn btn-info btn-left" style="margin-right:  10px;">Edit</button>
                                    </a>
                                    <a href="deletecourse/${domain.courses.id}">
                                        <button  class="btn btn-danger btn-left" style="margin-right:10px;">X</button>
                                    </a>
                                    
                                </h3>
                                <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo_${domain.courses.id}">Contents</button>
                                  <div id="demo_${domain.courses.id}" class="collapse" style="margin-top:20px;">
                                    <table class="table table-bordered">
                                        <thead>
                                          <tr>
                                            <th>Sn</th>
                                            <th>Lectures</th>
                                            <th>url</th>
                                            <th>Length in Minute</th>
                                            <th>Action</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                        <c:when test="${domain.coursecontents.size() !=0}">
                                            <c:forEach var="content" items="${domain.coursecontents}"  varStatus="cntentstatus" >
                                                                                      <tr>
                                                                                        <td>${cntentstatus.index+1}</td>
                                                                                        <td>Lecture ${content.id}</td>
                                                                                        <td>${content.lectureUrl}</td>
                                                                                        <td>${content.lectureLength} Minutes</td>
                                                                                        <td>
                                                                                        <a href="editcontent/${content.id}">
                                                                                            <button class="btn btn-info">Edit</button>
                                                                                        </a>
                                                                                        <a href="deletecontent/${content.id}">
                                                                                        <button class="btn btn-danger">X</button>
                                                                                        </a>


                                                                                        </td>
                                                                                      </tr>
                                                                                      </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                        <tr>
                                            <td colspan="5" style="font-weight:bolder;text-align:center;font-size:20px;"> No Content Yet</td>
                                        </tr>
                                        </c:otherwise>
                                        </c:choose>
                                        </tbody>
                                      </table>
                                  </div>
                            </c:forEach>
                        </div>
                    </div> 
                </div>
            </div>
            <!-- /#page-content-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- Bootstrap core JavaScript -->
        <script src="${base}/css/dash/vendor/jquery/jquery.min.js"></script>
        <script src="${base}/css/dash/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Menu Toggle Script -->
        <script>
                                        $("#menu-toggle").click(function (e) {
                                            e.preventDefault();
                                            $("#wrapper").toggleClass("toggled");
                                        });
//                                        function delete (id) {
//                                            var request = new XMLHttpRequest();
//                                            request.onreadystatechange = function () {
//                                                if (this.readyState === 4 && this.status === 200) {
//                                                    console.log(this.responseText);
//                                                }
//                                            };
//                                            request.open('delete', 'deleteContent/' + id, true);
//                                            request.send();
//                                        }
        </script>

    </body>

</html>
