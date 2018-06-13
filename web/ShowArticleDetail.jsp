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
%>

<html>
<head>
    <title>帖子内容</title>
</head>
<body>
<table bgcolor="#ff7f50" align="center" border="2">
    <%
        while (resultSet.next()){
            %>
    <tr><td>编号</td><td align="center"><%=resultSet.getInt("id")%></td></tr>
    <tr><td>标题</td><td><%=resultSet.getString("title")%></td></tr>
    <tr><td>内容</td><td><%=resultSet.getString("cont")%></td></tr>
    <tr><td colspan="2" align="center"><a href="Reply.jsp?id=<%=resultSet.getInt("id")%>&rootid=<%=resultSet.getInt("rootid")%>">回复</a>
    </td></tr>

</table>

    <%
        }
        resultSet.close();
        statement.close();
        connection.close();
    %>



</body>
</html>
