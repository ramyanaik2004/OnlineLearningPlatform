<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Course Progress</title>

<style>

body{
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    padding: 30px;
}

.container{
    max-width: 700px;
    margin: auto;
    background: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0px 2px 10px rgba(0,0,0,0.2);
}

h1{
    text-align: center;
    color: #333;
}

.lesson{
    margin-bottom: 20px;
    padding: 15px;
    border: 1px solid #ddd;
    border-radius: 5px;
}

.progress-bar{
    width: 100%;
    background-color: #ddd;
    border-radius: 20px;
    overflow: hidden;
    margin-top: 20px;
}

.progress{
    width: 60%;
    height: 25px;
    background-color: #28a745;
    text-align: center;
    color: white;
    line-height: 25px;
}

</style>

</head>

<body>

<%@ include file="nav.jsp" %>

<div class="container">

    <h1>Java Full Stack Progress</h1>

    <div class="lesson">

        <input type="checkbox" checked>

        Introduction to Java

    </div>

    <div class="lesson">

        <input type="checkbox" checked>

        HTML & CSS Basics

    </div>

    <div class="lesson">

        <input type="checkbox">

        Spring Boot Introduction

    </div>

    <div class="lesson">

        <input type="checkbox">

        Database Connectivity

    </div>

    <h3>Overall Progress</h3>

    <div class="progress-bar">

        <div class="progress">

            60%

        </div>

    </div>

</div>

</body>
</html>
