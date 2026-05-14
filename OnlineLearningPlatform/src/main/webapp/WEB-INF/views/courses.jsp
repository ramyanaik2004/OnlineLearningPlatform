<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Courses</title>

<style>

body{
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
}

.search-container{
    text-align: center;
    margin: 30px;
}

#searchInput{
    width: 350px;
    padding: 12px;
    font-size: 16px;
}

.course-container{
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
}

.course-card{
    background: white;
    width: 300px;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 2px 10px rgba(0,0,0,0.2);
}

.course-card h2{
    color: #007bff;
}

button{
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 15px;
    border-radius: 5px;
    cursor: pointer;
}

</style>

</head>

<body>

<%@ include file="nav.jsp" %>

<div class="search-container">

    <input type="text"
           id="searchInput"
           placeholder="Search Courses">

</div>

<div class="course-container">

<c:forEach var="course" items="${courses}">

    <div class="course-card searchable-course">

        <h2 class="course-title">
            ${course.title}
        </h2>

        <p>
            ${course.description}
        </p>

        <p>
            Duration: ${course.duration}
        </p>

        <a href="enroll?id=${course.id}">

    <button>
        Enroll Now
    </button>

</a>

    </div>

</c:forEach>

</div>

<script>

const searchInput =
    document.getElementById("searchInput");

searchInput.addEventListener("keyup", function() {

    let filter =
        searchInput.value.toLowerCase();

    let courses =
        document.querySelectorAll(".searchable-course");

    courses.forEach(function(course){

        let title =
            course.querySelector(".course-title")
                  .innerText
                  .toLowerCase();

        if(title.includes(filter)) {

            course.style.display = "block";

        } else {

            course.style.display = "none";
        }

    });

});

</script>

</body>
</html>