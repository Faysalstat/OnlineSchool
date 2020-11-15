<%-- 
    Document   : addcourseimage
    Created on : Sep 5, 2020, 1:56:26 AM
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/custom.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div style="width:50%;margin:100px auto;border:1px solid black">
            <div class="img-holder">
                <img src="" id="imgsrc"  class="img-rounded upimg"/>
            </div>
            <div class="btn-holder" data-provides="fileupload">
                <input class="inputfile" type="file" id="fileSelect">
                <label class=" btn btn-info " for="fileSelect">Browse</label>
                <button class="btn btn-success" onclick="uploadImage();return false" >Uplaod</button>
            </div>
        </div>
    </body>
    <script>
        function uploadImage() {
            var formData = new FormData();
            var fileSelect = document.getElementById("fileSelect");
            if (fileSelect.files && fileSelect.files.length === 1) {
                var file = fileSelect.files[0];
                formData.set("image", file, file.name);
            }
            console.log("Hello");
            var request = new XMLHttpRequest();
            request.onreadystatechange = function () {
                if (this.readyState === 4 && this.status === 200) {
                    console.log(this.responseText);
                    var data = JSON.parse(this.responseText);
//                    document.getElementById("imagevalue").value = data.image;
//                setTimeout(function(){ alert("hi");document.getElementById("imgsrc").src = "$ base}img/profiles/" + data.image; }, 3000);
//                    document.getElementById("imgsrc").src = "$ {base}img/profiles/" + data.image;
                }
            };
            request.open('POST', 'uploadcourseimage', true);
            request.send(formData);
        }
    </script>
</html>
