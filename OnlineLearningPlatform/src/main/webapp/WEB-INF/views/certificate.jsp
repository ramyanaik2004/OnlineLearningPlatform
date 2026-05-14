<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Certificate</title>

<style>

body{
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    text-align: center;
    margin: 0;
}
.certificate-container{
    width: 900px;
    margin: 50px auto;
    background: white;
    padding: 50px;
    border: 10px solid #007bff;
    border-radius: 15px;
}

h1{
    font-size: 50px;
    color: #007bff;
}

h2{
    font-size: 35px;
    color: #333;
}
p{
    font-size: 22px;
    color: #555;
}

button{
    margin-top: 30px;
    padding: 12px 25px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 18px;
}

</style>

<script>
function downloadCertificate(){

    window.print();
}

</script>

</head>

<body>

<div class="certificate-container">

    <h1>Certificate of Completion</h1>

    <p>This certificate is proudly presented to</p>

    <h2>${username}</h2>

    <p>for successfully completing the course</p>
     <h2>${courseName}</h2>

    <p>Online Learning Platform</p>

    <button onclick="downloadCertificate()">
        Download Certificate
    </button>

</div>

</body>
</html>