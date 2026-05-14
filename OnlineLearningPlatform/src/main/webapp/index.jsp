<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Online Learning Platform</title>

<style>

body{
    font-family: Arial, sans-serif;
    margin: 0;
    background-color: #f4f4f4;
}

.navbar{
    background-color: #007bff;
    padding: 15px;
    text-align: center;
}

.navbar a{
    color: white;
    text-decoration: none;
    margin: 0 15px;
    font-size: 18px;
    font-weight: bold;
}

.navbar a:hover{
    text-decoration: underline;
}

.hero{
    text-align: center;
    padding: 100px 20px;
}

.hero h1{
    font-size: 50px;
    color: #333;
}

.hero p{
    font-size: 22px;
    color: #666;
}

.hero button{
    padding: 15px 25px;
    font-size: 18px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.hero button:hover{
    background-color: #0056b3;
}

</style>

</head>

<body>

<%@ include file="./WEB-INF/views/nav.jsp" %>

<div class="hero">

    <h1>Welcome to Online Learning Platform</h1>

    <p>
        Learn new skills anytime and anywhere.
    </p>

    <a href="signup">
        <button>Explore Courses</button>
    </a>

</div>

</body>
</html>