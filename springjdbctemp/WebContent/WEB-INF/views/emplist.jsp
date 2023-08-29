<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.model.Employee" %> 

<html>
<head>
    <title>Employee List</title>
    <style>
        .hidden { display: none; }
    </style>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
   
        function toggleData() {
            var table = document.getElementById("employeeTable");
            table.classList.toggle("hidden");
        }
      
        function deleteEmployee(empno) {
        	console.log(empno)
            if (confirm("Are you sure you want to delete this employee?")) {
                $.ajax({
                    url: "deleteEmployee", 
                    method: "POST",
                    data: { empno: empno },
                    success: function(response) {
                        alert("Employee deleted successfully!");
                        location.reload();
                    },
                    error: function(error) {
                        alert("Error deleting employee.");
                    }
                });
            }
    
    </script>
</head>
<body>
    <h1>Employee List</h1>
    
    <button onclick="toggleData()">Toggle Employee Data</button>
  
    
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
    </br>
   
</body>
</html>
