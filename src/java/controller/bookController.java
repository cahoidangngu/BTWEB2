/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Book;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bookRepository;

/**
 *
 * @author quant
 */
@WebServlet(name = "book", urlPatterns = {"/book"})
public class bookController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title =   request.getParameter("title");
        String author =   request.getParameter("author");
        int year = Integer.parseInt(request.getParameter("year"));
        String url = "/bookdetails.jsp";
        if(title.isBlank()||author.isBlank()||year==0)
            url="/addbook.html";
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
                rd.forward(request, response);
    }

}
