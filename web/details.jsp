<%-- 
    Document   : state
    Created on : 9 Apr, 2015, 11:34:14 AM
    Author     : root
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="databaseconnection.jsp" %>
    </head>
    <body>
        <form>
        <%   
            String user = request.getParameter("user");
            String email = request.getParameter("email");
            String reciver = request.getParameter("ph");
            String credits =request.getParameter("credits");
            
            try {
                

                PreparedStatement ps = conn.prepareStatement("insert into transactions values(?,?,?,?)");
                ps.setString(1, user);
                ps.setString(2,credits );
                ps.setString(3, reciver);
                ps.setString(4,email);
                int rs = ps.executeUpdate();
                if (rs!=0) { 
                  response.getWriter().print("CREDITS TRANSFERED!");  
        RequestDispatcher rd=request.getRequestDispatcher("index.html");  
        rd.include(request, response);  
                
                    
                 }
else { 
         response.getWriter().print("SORRY CREDITS NOT TRANSFERED!");  
        RequestDispatcher rd=request.getRequestDispatcher("newjsp.jsp");  
        rd.include(request, response); 
}

            } catch (Exception ex) {
               out.print(ex);
            }
        %>

    </body>
</html>
