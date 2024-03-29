<%@page import="model.bookRepository"%>
<%@page import="entity.Book"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List books</title>
    </head>
    <body>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Title</th>
                    <th scope="col">Author</th>
                    <th scope="col">Year</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Book> booklist = bookRepository.getAllCourses("");
                    if (booklist.size() == 0) {
                %>
                <tr>
            <h3>No books in db!</h3>
        </tr>

        <%
        } else {
            for (int i = 0; i < booklist.size(); i++) {
        %>
        <tr>
            <th scope="row"><%=i + 1%></th>
            <td><%=booklist.get(i).getTitle()%></td>
            <td><%=booklist.get(i).getAuthor()%></td>
            <td><%=booklist.get(i).getYear()%></td>
        </tr>
        <%
                }
            }
        %>

    </tbody>
</table>
        <a href="addbook.html"><button class="btn btn-primary"> Add book</button></a>
</body>
</html>
