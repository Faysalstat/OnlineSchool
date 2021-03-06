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

        <title>Admin</title>
        <link rel="shortcut icon" href="${base}/img/favicon.png" type="image/png">
        <!-- Bootstrap core CSS -->
        <link href="${base}/css/dash/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="${base}/css/dash/css/simple-sidebar.css" rel="stylesheet">

    </head>

    <body>

    <%
                User admin = (User) session.getAttribute("admin");
                if (admin == null || !admin.getUserRole().equals("ADMIN")) {
                    response.sendRedirect("login");
                }
            %>

        <div class="d-flex" id="wrapper">

            <!-- Sidebar -->
            <div class="bg-light border-right" id="sidebar-wrapper">
                <div class="sidebar-heading">Dashboard</div>
                <div class="list-group list-group-flush">
                    <a href="${base}/admin/dashboard" class="list-group-item list-group-item-action bg-light">Dashboard</a>
                    <a href="${base}/admin/addTeacher" class="list-group-item list-group-item-action bg-light">Add Teacher</a>
                    <a href="${base}/dashboard/mail" class="list-group-item list-group-item-action bg-light">Mail</a>
                    <a href="${base}/dashboard/logout" class="list-group-item list-group-item-action bg-light">Log Out</a>
                </div>
            </div>

            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">

                <div class="container">
                  <h2>Running Courses</h2>
                  <p>All Classes are listed here</p>
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        <th>Sn#</th>
                        <th>Course Name</th>
                        <th>Taught By</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="course" items="${courseList}"  varStatus="status" >
                        <tr>
                           <td>${status.index+1}</td>
                           <td>${course.courseName}</td>
                           <td>${course.teacher.firstName} ${course.teacher.lastName}</td>
                           <td>
                                <a href="${base}/admin/viewCourse/${course.id}">
                                   <button class="btn btn-info">View</button>
                                </a>
                           </td>
                        </tr>
                    </c:forEach>


                    </tbody>
                  </table>
                </div>

            </div>
            <!-- /#page-content-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- Bootstrap core JavaScript -->
        <script src="css/dash/vendor/jquery/jquery.min.js"></script>
        <script src="css/dash/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Menu Toggle Script -->
        <script>
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
        </script>

    </body>

</html>
