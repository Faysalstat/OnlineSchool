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

                    <a href="${base}/admin/dashboard" class="list-group-item list-group-item-action bg-light">Admin</a>
                    <a href="${base}/dashboard/logout" class="list-group-item list-group-item-action bg-light">Log Out</a>
                </div>
            </div>

            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">

               <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <h2>Online School Dashboard</h2>
                </nav>
               <div class="row" style="margin-left:20px;">
               <div class="col-md-4">
               			<img src="${base}/img/teachers/${teacher.image}" class="img-thumbnail" width="300" height="350">
               	</div>
               		<div class="col-md-6">
                        <table class="table table-striped">
                            <tbody>
                              <tr>
                                <td>Name</td>
                                <td>Doe</td>
                              </tr>
                              <tr>
                                <td>Occupation</td>
                                <td>Moe</td>
                              </tr>
                              <tr>
                                <td>Designation</td>
                                <td>Dooley</td>
                              </tr>
                              <tr>
                                <td>Institute</td>
                                <td>${teacher.institude}</td>
                              </tr>
                              <tr>
                              	<td>Email</td>
                              	<td>${teacher.user.email}</td>
                              </tr>
                              <tr>
                              	<td>Contact</td>
                              	<td>${teacher.user.contact}</td>
                              </tr>
                              <tr>
                              	<td>User Name</td>
                              	<td>${teacher.user.username}</td>
                              </tr>
                              <tr>
                              	<td>Password</td>
                              	<td>
                              		<a href="${base}/changePassword/${teacher.user.email}">Change Password</a></div>
                              	</td>
                              </tr>
                            </tbody>
                        </table>
               		</div>
               	</div>
                </div>
            </div>
            <!-- /#page-content-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- Bootstrap core JavaScript -->
        <script src="css/dash/vendor/jquery/jquery.min.js"></script>
        <script src="css/dash/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>

</html>
