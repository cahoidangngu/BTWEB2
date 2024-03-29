/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Book;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author quant
 */
public class bookRepository {
    public static boolean insertBook(Book book){
        String querry = "INSERT INTO books VALUES (?,?,?)";
        try(
            Connection connection = Database.getConnection();
            PreparedStatement prepareStatement = connection.prepareStatement(querry);) 
        {
            prepareStatement.setString(1, book.getTitle());
            prepareStatement.setString(2, book.getAuthor());
            prepareStatement.setInt(3, book.getYear());
            
            return prepareStatement.executeUpdate()>=1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static List<Book> getAllCourses(String bookTitle){
        List<Book> books = new ArrayList<>();

        String querry = "SELECT * FROM books WHERE title LIKE ?";
        try(
            Connection connection = Database.getConnection();
            PreparedStatement prepareStatement = connection.prepareStatement(querry);) 
        {
           prepareStatement.setString(1, "%"+bookTitle+"%");
            ResultSet rs = prepareStatement.executeQuery();
            
                
            while(rs.next()){
                Book book = new Book();
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setYear(rs.getInt("year"));
                books.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }
}
