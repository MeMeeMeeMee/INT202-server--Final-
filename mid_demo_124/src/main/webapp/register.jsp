<%--
  Created by IntelliJ IDEA.
  User: perpasit
  Date: 16/12/2566
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>REGISTER</title>
</head>
<body>
  <h1>Midterm Exam Web App by Pasit 65130500124</h1>

<hr> <%--ขีดเส้น--%>
<form action="register" method="post"> <%--action ไปที่ registerServlet ที่method post--%>
<input type="hidden" name="action" value="addCustomer"/> <%-- เอาค่าที่ใส่ลงไป ส่งไปด้วยชื่อaction เพื่อจะได้รับparameterด้วยชื่อนี้ และมีค่าที่ใส่ไปเป็นaddCustomer--%>
  <label>User Name: </label>
  <input type="text" name="name"/>
  <br>
  <label>Email Address:</label>
  <input type="text" name="email"/>

  <br>
  <button type="submit">
      Submit
  </button>
</form>
</body>
</html>

