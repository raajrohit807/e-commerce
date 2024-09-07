<%-- 
    Document   : signin
    Created on : 30-Aug-2023, 3:58:25?pm
    Author     : Vyshnavi
--%>

<%@ page import="java.sql.*" %>
    <% 
        String enteredUsername=request.getParameter("username"); 
        String enteredPassword=request.getParameter("password");
        try { Class.forName("com.mysql.jdbc.Driver"); 
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root" , "root" );
            PreparedStatement ps=conn.prepareStatement("select * from signup where username=? and password=?");
            ps.setString(1, enteredUsername);
            ps.setString(2, enteredPassword); 
            ResultSet rs=ps.executeQuery(); 
            if (rs.next()) { 
                // User found, authentication success
                   //out.println("Logged in successfully");
                out.print("<html><body>");
                out.println("<script>");
                out.println("alert('Logged in successfully!!')"); 
                out.print("window.location.href = 'index.html';");
                out.println("</script>");
                out.println("</body></html>");
        } 
            else { 
                // User not found or authentication failed
                out.print("<html><body>");
                out.println("<script>");
                out.println("alert('Authentication failed. Username or password may be wrong!!')"); 
                out.print("window.location.href = 'signin.html';");
                out.println("</script>");
                out.println("</body></html>");
                
            } 
        } catch (Exception e) { 
            out.println(e); 
        } 
    %>
