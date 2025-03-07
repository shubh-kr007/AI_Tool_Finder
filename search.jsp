<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search AI Tools</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">Search AI Tools</h2>
        
        <!-- Search Form -->
        <form action="SearchServlet" method="post">
            <div class="mb-3">
                <label class="form-label">Enter Keyword:</label>
                <input type="text" name="keyword" class="form-control" placeholder="Search AI tools..." required>
            </div>
            <button type="submit" class="btn btn-primary">Search</button>
        </form>

        <%-- Display Search Results --%>
        <% if (request.getAttribute("resultSet") != null) { %>
            <h3 class="mt-4">Search Results:</h3>
            <ul class="list-group">
                <%
                    java.sql.ResultSet rs = (java.sql.ResultSet) request.getAttribute("resultSet");
                    boolean hasResults = false; // Flag to check if results exist

                    while (rs.next()) {
                        hasResults = true;
                %>
                    <li class="list-group-item">
                        <h5 class="mb-1"><%= rs.getString("name") %></h5>
                        <small class="text-muted"><%= rs.getString("category") %></small>
                        <p class="mt-2"><%= rs.getString("description") %></p>

                        <!-- Fix for broken URLs -->
                        <a href="<%= rs.getString("link").startsWith("http") ? rs.getString("link") : "https://" + rs.getString("link") %>" 
                           class="btn btn-primary" target="_blank">
                            Visit Tool
                        </a>
                    </li>
                <%
                    }
                    if (!hasResults) { 
                %>
                    <li class="list-group-item text-danger">No results found. Try a different keyword.</li>
                <%
                    }
                %>
            </ul>
        <% } %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
