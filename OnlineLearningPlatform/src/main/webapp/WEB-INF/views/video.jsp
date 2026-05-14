<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Course Video</title>

<style>

body{
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    text-align: center;
    margin: 0;
}

.video-container{
    margin-top: 40px;
}

iframe{
    width: 900px;
    height: 500px;
    border-radius: 10px;
}

h1{
    color: #333;
}

button{
    margin-top: 25px;
    padding: 12px 25px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 18px;
}

button:disabled{
    background-color: gray;
    cursor: not-allowed;
}

</style>

</head>

<body>

<%@ include file="nav.jsp" %>

<div class="video-container">

    <h1>${course.title}</h1>


    <!-- YouTube Video -->
    <iframe
        src="${course.videoLink}"
        frameborder="0"
        allowfullscreen>
    </iframe>


    <br><br>


    <!-- Certificate Button -->
    <a id="certificateLink"
   href="completeVideo?courseName=${course.title}">

        <button id="certificateBtn" disabled>

            Complete Video To Unlock Certificate

        </button>

    </a>

</div>


<script>


// Enable certificate after 30 seconds
// (simulate video completion)

setTimeout(function(){

    const btn =
        document.getElementById("certificateBtn");

    btn.disabled = false;

    btn.innerHTML =
        "Download Certificate";

}, 30000);


</script>

</body>
</html>