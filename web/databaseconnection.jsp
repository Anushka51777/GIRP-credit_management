<%@page import="java.sql.*" %>
<%

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/credit_managment","root","anushka");

%>
