<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession userSession = request.getSession(false);
    if(userSession == null || userSession.getAttribute("user") == null) {
        response.sendRedirect("login.jsp?msg=Please Login First!");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Welcome, <%= userSession.getAttribute("user") %>!</h2>
        <a href="addTool.jsp" class="btn btn-success">Add AI Tool</a>
        <a href="search.jsp" class="btn btn-primary">Search AI Tools</a>
        <a href="LogoutServlet" class="btn btn-danger">Logout</a>
    </div>
</body>
</html>
