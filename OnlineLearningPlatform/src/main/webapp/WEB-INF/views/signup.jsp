<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Signup</title>

<style>

body{
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
}

.signup-wrapper{
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.signup-container{
    background: white;
    padding: 30px;
    border-radius: 10px;
    width: 400px;
    box-shadow: 0px 2px 10px rgba(0,0,0,0.2);
}

h1{
    text-align: center;
    color: #333;
    margin-bottom: 30px;
}

input{
    width: 100%;
    padding: 12px;
    margin-top: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

button{
    width: 100%;
    padding: 12px;
    background-color: #28a745;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
}

button:hover{
    background-color: #218838;
}

</style>

</head>

<body>

<%@ include file="nav.jsp" %>

<div class="signup-wrapper">

    <div class="signup-container">

        <h1>Create Account</h1>

   <c:if test="${not empty error}">

    <p style="color:red;
              text-align:center;
              font-weight:bold;">

        ${error}

    </p>

</c:if>
        <form action="registerUser" method="post">

            <input type="text"
       name="fullname"
       placeholder="Enter Full Name"
       required>

<input type="email"
       name="email"
       placeholder="Enter Email"
       required>

<input type="password"
       name="password"
       placeholder="Enter Password"
       required>

            <button type="submit">

                Signup

            </button>

        </form>

    </div>

</div>

</body>
</html>