/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.User;
import java.sql.*;

/**
 *
 * @author quant
 */
public class userRepository {
    
    
    
    public static User getUserByUsername(String username){
        User user = null;
        String querry = "SELECT * FROM users WHERE user_username = ?";
        try(
            Connection connection = Database.getConnection();
            PreparedStatement prepareStatement = connection.prepareStatement(querry);) 
        {
            prepareStatement.setString(1, username);
            
            ResultSet rs = prepareStatement.executeQuery();
            if(rs.next()){
                user = new User();
                user.setUsername(rs.getString("user_username"));
                user.setPassword(rs.getString("user_password"));
                System.out.println(rs.getString("user_username"));
            }
                
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
