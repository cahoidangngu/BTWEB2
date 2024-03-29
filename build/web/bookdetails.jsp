<%@page import="model.bookRepository"%>
<%@page import="entity.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book View</title>
    </head>
    <body>
        
     <%
        
        String title =   request.getParameter("title");
        String author =   request.getParameter("author");
        int year = Integer.parseInt(request.getParameter("year"));
         
        Book book = new Book(title, author, year);
        String url = "";
        boolean isSuccess = false;
        try {
            if(bookRepository.insertBook(book))
                isSuccess = true;
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        if (isSuccess) {
            System.out.println(isSuccess);
    %>
        <div class="card" style="width: 100wh;">
            <div class="card-header">
                <h1> Book: <%=title %> </h1>
            </div>
            <ul class="list-group list-group-flush">
            <li class="list-group-item">Book author: <%=author%> </li>
            <li class="list-group-item">Book year: <%=year%> </li>
          </ul> 
          </div>
          <a href="addbook.html"><button class="btn btn-primary"> Add book</button></a></br>
          <a href="listbooks.jsp"><button class="btn btn-primary"> List books</button></a>
         
        
    <%
        } else {
       %>
    <h1>Failed to add book!</h1>
    <a href="addbook.html">Try again</a>
    <%
        }
        %>
 
               

    </body>
</html>
