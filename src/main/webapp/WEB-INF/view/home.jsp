<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Admin CPanel ${user.fullname}</title>
</head>
<body>
<div style="text-align: center">
    <h1>Welcome to Admin Panel</h1>
    <b>Hello ${user.fullname} (${user.email})</b>
    <br><br>
    <a href="/logout">Logout</a>
</div>
</body>
</html>
