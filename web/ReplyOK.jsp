<%--
  Created by IntelliJ IDEA.
  User: allenhsu
  Date: 2018/6/13
  Time: 下午10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");
    String strID = request.getParameter("id");
    int id = Integer.parseInt(strID);
    int rootid = Integer.parseInt(request.getParameter("rootid"));
    String title = request.getParameter("title");
    String cont = request.getParameter("cont");

    cont = cont.replaceAll("\n", "<br>");

    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/bbs?characterEncoding=utf8&useSSL=false";
    Connection connection = DriverManager.getConnection(url,"root","332999");

    connection.setAutoCommit(false);

    String sql = "insert into article values (null, ?, ?, ?, ?, now(), 0)";
    PreparedStatement preparedStatement = connection.prepareStatement(sql);
    Statement statement = connection.createStatement();

    preparedStatement.setInt(1, id);
    preparedStatement.setInt(2,rootid);
    preparedStatement.setString(3,title);
    preparedStatement.setString(4,cont);
    preparedStatement.executeUpdate();
    //被回复的话，叶子节点变为1
    statement.executeUpdate("update article set isleaf = 1 where id=" +id);
    //预防断电，手动提交
    connection.commit();
    connection.setAutoCommit(true);

    statement.close();
    preparedStatement.close();
    connection.close();

    response.sendRedirect("ShowArticleTree.jsp");
%>
<html>
<head>
    <title>回复成功</title>
</head>
<body>

</body>
</html>
