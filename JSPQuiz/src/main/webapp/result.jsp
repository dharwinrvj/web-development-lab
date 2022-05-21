<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8 lang='java' import='java.sql.*'">
    <title>JSP Quiz</title>
</head>
<body>
<%
Integer score = 0;
response.setContentType("text/html;charset=UTF-8");
String ans1 = request.getParameter("ans1");
String ans2 = request.getParameter("ans2");
String ans3 = request.getParameter("ans3");
if (ans1.equals("jawaharlalnehru")) {
score++;
}
if (ans2.equals("newdelhi")) {
score++;
}
if (ans3.equals("takitaki")) {
score++;
}
String jdbcDriver = "com.mysql.cj.jdbc.Driver";
String dburl = "jdbc:mysql://localhost:3306/iplab?useSSL=false";
Class.forName(jdbcDriver);
Connection conn = DriverManager.getConnection(dburl, "root", "D123@localhost");
Statement st = conn.createStatement();
Cookie[] cookie = request.getCookies();
String username = cookie[1].getValue();
String password = cookie[2].getValue();
st.executeUpdate("UPDATE USERSDETAILS SET SCORE=" + score + " WHERE USERNAME='" + username + "'");

out.println("<html>");
out.println("<body style='text-align:center; margin: auto 50px;'>");
out.println("<h2>Hello " + username + "! </h2>");
out.println("<h3>Your score is " + score + "</h3>");
ResultSet rs = st.executeQuery("SELECT USERNAME,SCORE FROM USERSDETAILS");
%>
<table border='1' style='margin:auto;'>
    <tr>
        <th>USERNAME</th>
        <th>SCORE</th>
    </tr>
    <% while (rs.next()) {%>
    <tr>
        <td> <%= rs.getString(1)%></td>
        <td> <%= rs.getString(2)%></td>
    </tr>
    <% } %>
</table>
<%
out.println("</body>");
out.println("</html>");
%>
</body>
</html>
