<%-- 
    Document   : signup
    Created on : 28-Aug-2023, 3:55:09?pm
    Author     : Vyshnavi
--%>

<%@ page import = "java.sql.*" %>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
String email = request.getParameter("email");



try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:/register", "root", "root");
    PreparedStatement ps = conn.prepareStatement("insert into signup(username, password,email) values (?, ?, ?)");
    ps.setString(1, username);
    ps.setString(2, password);
    ps.setString(3, email);
    int x = ps.executeUpdate();
    if (x > 0) {
        out.print("<html><body>");
                out.println("<script>");
                out.println("alert('Registration successful!!')"); 
                out.print("window.location.href = 'index.html';");
                out.println("</script>");
                out.println("</body></html>");
    }
    else {
        out.println("Registration failed");
    }

}
catch(Exception e) {
    out.println(e);
}
%>
