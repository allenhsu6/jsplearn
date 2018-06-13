<%--
  Created by IntelliJ IDEA.
  User: allenhsu
  Date: 2018/6/13
  Time: 下午8:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<%
    String strID = request.getParameter("id");
    int id = Integer.parseInt(strID);
    String str = "";

    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/bbs?characterEncoding=utf8&useSSL=false";
    Connection connection = DriverManager.getConnection(url,"root","332999");
    Statement statement = connection.createStatement();
    ResultSet resultSet = statement.executeQuery("select * from article where id ="+id);
    while (resultSet.next()){
        str += "<tr><td>" +id+"</td><td>"+
                resultSet.getString("cont")+
                "</a>"+"</td></tr>";
    }
%>

<%
    resultSet.close();
    statement.close();
    connection.close();
%>
<html>
<head>
    <title>帖子内容</title>
</head>
<body>
<table bgcolor="#faebd7" align="center" width="2">
    <%=str%>
</table>
</body>
</html>
