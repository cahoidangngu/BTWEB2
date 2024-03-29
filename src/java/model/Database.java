/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.*;


/**
 *
 * @author quant
 */
public class Database {
    public static Connection getConnection() throws SQLException{
        Connection conn = null;
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/beweb", "root","140603");
        
            if(conn!=null)
                System.out.println("Connection established");
            else{
                System.out.println("No database found");
            } 
        return conn;
    }
}
