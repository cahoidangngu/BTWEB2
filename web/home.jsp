<%@page import="model.userRepository"%>
<%@page import="entity.User"%>
<%@page import="controller.login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <title>Title</title>
</head>
<body>
    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        boolean checklogin = true;
        
        try {
            User dbUser = null;
            dbUser = userRepository.getUserByUsername(username);
            if (dbUser == null) {
                System.out.println("Cannot Find User");
                checklogin = false;
            }else
                checklogin = password.trim().equals(dbUser.getPassword().trim());
        } catch (Exception e){
            e.printStackTrace();
        }
    %>

    <%
        if (checklogin) {
    %>

    <h1>Welcome Back</h1>
    <p>Thanks <strong><%= username%>
    </strong> for login !<br/>
        You password: <strong><%=password%>
    </strong>
       
    </p>
     <a href="index.html">logout</a>
    <%
        } else {
       %>
    <h1>Failed to login!</h1>
    <a href="index.html">back</a>
    <%
        }
        %>
</body>
</html>

