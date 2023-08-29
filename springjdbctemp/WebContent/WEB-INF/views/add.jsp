<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <style>
        .hidden { display: none; }
    </style>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function toggleData() {
    var table = document.getElementById("employeeTable");
    table.classList.toggle("hidden");
}</script>
</head>
<body>
	<h1> after adding</h1>
	<table id="employeeTable" class="hidden" border="1">
        <thead>
            <tr>
                <th>Employee No</th>
                <th>Department No</th>
                <th>Name</th>
                <th>Job</th>
                <th>Salary</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${elist}" var="item">
                <tr>
                    <td>${item.getEmpNo()}</td>
                    <td>${item.getDeptNo()}</td>
                    <td>${item.getEName()}</td>
                    <td>${item.getJob()}</td>
                    <td>${item.getSalary()}</td>
                    <td>
                        <button onclick="deleteEmployee(${item.getEmpNo()})">Delete</button>
                     
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>