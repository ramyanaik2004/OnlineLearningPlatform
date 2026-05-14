<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Course Completed</title>

<style>

body{
    font-family: Arial, sans-serif;
    text-align: center;
    background-color: #f4f4f4;
}

.container{
    margin-top: 100px;
}

button{
    padding: 12px 20px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

</style>

</head>

<body>

<div class="container">

    <h1>Course Completed Successfully</h1>

    <p>
        You completed:
        ${courseName}
    </p>

    <a href="certificate?courseName=${courseName}">

        <button>
            Download Certificate
        </button>

    </a>

</div>

</body>
</html>