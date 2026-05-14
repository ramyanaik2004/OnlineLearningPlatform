<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>My Courses</title>

<style>

body{
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 20px;
}

h1{
    text-align: center;
    color: #333;
}

.course-container{
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
}

.course-card{
    background: white;
    width: 300px;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 2px 10px rgba(0,0,0,0.2);
}

.progress-bar{
    width: 100%;
    background-color: #ddd;
    border-radius: 20px;
    overflow: hidden;
    margin-top: 10px;
}

.progress{
    height: 20px;
    width: 70%;
    background-color: #28a745;
    text-align: center;
    color: white;
    line-height: 20px;
}

button{
    margin-top: 15px;
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 15px;
    border-radius: 5px;
    cursor: pointer;
}

button:hover{
    background-color: #0056b3;
}

</style>

</head>

<body>

<%@ include file="nav.jsp" %>

<h1>My Enrolled Courses</h1>

<div class="course-container">

    <div class="course-card">

        <h2>Java Full Stack</h2>

        <p>
            Progress: 70%
        </p>

        <div class="progress-bar">

            <div class="progress">
                70%
            </div>

        </div>

        <button>Continue Learning</button>

    </div>

    <div class="course-card">

        <h2>Frontend Development</h2>

        <p>
            Progress: 40%
        </p>

        <div class="progress-bar">

            <div class="progress" style="width:40%;">
                40%
            </div>

        </div>

        <button>Continue Learning</button>

    </div>

</div>

</body>
</html>