<%--
  Created by IntelliJ IDEA.
  User: allenhsu
  Date: 2018/6/13
  Time: 下午10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>

<%
    request.setCharacterEncoding("utf-8");
    String action = request.getParameter("action");
    if (action != null && action.equalsIgnoreCase("post")){



    String title = request.getParameter("title");
    String cont = request.getParameter("cont");

    cont = cont.replaceAll("\n", "<br>");

    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/bbs?characterEncoding=utf8&useSSL=false";
    Connection connection = DriverManager.getConnection(url,"root","332999");

    connection.setAutoCommit(false);

    String sql = "insert into article values (null, 0, ?, ?, ?, now(), 0)";
    PreparedStatement preparedStatement = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
    Statement statement = connection.createStatement();

    preparedStatement.setInt(1, -1);
    preparedStatement.setString(2,title);
    preparedStatement.setString(3,cont);
    preparedStatement.executeUpdate();

    ResultSet rsKey = preparedStatement.getGeneratedKeys();
    rsKey.next();
    int Key = rsKey.getInt(1);
    System.out.println(Key);
    rsKey.close();
    String sql1 = "update article set rootid =";
    String sql2 = "where id =";
    statement.executeUpdate( "update article set rootid = " + Key + "where id =" + Key);
    //预防断电，手动提交
    connection.commit();
    connection.setAutoCommit(true);

    statement.close();
    preparedStatement.close();
    connection.close();

    response.sendRedirect("ShowArticleTree.jsp");
    }

%>

<html>
<head>
    <title>发布新帖</title>
</head>
<body>
<form action="Post.jsp" method="post">
    <input type="hidden", name="action" value="post">
    <table border="1" align="center" bgcolor="#ffd700">
        <tr>
            <td align="center">
                <input type="text" name="title" size="50">
            </td>
        </tr>
        <tr>
            <td>
                <textarea cols="80" rows="12" name="cont"></textarea>
            </td>
        </tr>
        <tr>
            <td align="center">
                <input type="submit" value="提交">
            </td>
        </tr>
    </table>
</form>


</body>
</html>
