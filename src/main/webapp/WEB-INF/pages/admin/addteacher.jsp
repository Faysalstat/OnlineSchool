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

	<title>Admin-View Course</title>
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

		<div class="container" style="padding:20px;margin-top:20px;">
		<h2 style="text-align:center">Add a New Teacher</h2>
		<div style="width:70%;margin:auto">
		<form action="${base}/admin/addTeacher"  modelAttribute="user" method="POST">
                	<div class="form-group">
                		<label>Email</label>
                		<input type="text" class="form-control" name="email">
                	</div>
                	<div class="form-group">
                		<label>User Name</label>
                		<input type="text" class="form-control" name="username">
                	</div>
                	<div class="form-group">
                		<label>Contact</label>
                		<input type="text" class="form-control" name="contact">
                	</div>
                	<div class="form-group">
                         <label>Password</label>
                         <input type="password" class="form-control" name="password">
                    </div>
                    <div class="form-group">
                        <div class="radio">
                          <label><input type="radio" name="userRole" value="ADMIN"> Admin</label>
                        </div>
                        <div class="radio">
                          <label><input type="radio" name="userRole" value="TEACHER"> Teacher</label>
                        </div>
                    </div>

                	<div class="form-group">
                		<input class="btn btn-primary" type="submit" value="Submit" >
                	</div>
                </form>
		</div>

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
$("form :input").attr("autocomplete", "off");
</script>

</body>

</html>
