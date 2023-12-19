<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<%--แสดงข้อความ "Hello World!" ในรูปแบบ <h1> (หัวข้อหลัก) โดยใช้การ์ด <%= %> ในการแทรกรหัส JavaScript ลงใน HTML เพื่อแสดงข้อความที่ได้จากการประมวลผลที่ทำในฝั่ง server.--%>

<br/>

<a href="auth/login">Login</a>
<%--เป็นลิงก์ที่นำไปยังหน้า Login โดยใช้ attribute href เพื่อกำหนด URL ของหน้าที่ต้องการไป.--%>

<br/>

<a href="auth/register">Register</a>
<%--เป็นลิงก์ที่นำไปยังหน้า Register โดยใช้ attribute href เพื่อกำหนด URL ของหน้าที่ต้องการไป.--%>

<br/>

<a href="profile">Profile</a>
<%--เป็นลิงก์ที่นำไปยังหน้า Profile โดยใช้ attribute href เพื่อกำหนด URL ของหน้าที่ต้องการไป.--%>

<br/>

<a href="admin/users">Manage User</a>
<%--เป็นลิงก์ที่นำไปยังหน้าที่ให้ผู้ดูแลระบบจัดการผู้ใช้ โดยใช้ attribute href เพื่อกำหนด URL ของหน้าที่ต้องการไป.--%>

</body>
</html>
