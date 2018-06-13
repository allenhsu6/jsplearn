<%--
  Created by IntelliJ IDEA.
  User: allenhsu
  Date: 2018/6/13
  Time: 下午3:21
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.*" %>

<%
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/bbs?characterEncoding=utf8&useSSL=false";
    Connection connection = DriverManager.getConnection(url,"root","332999");

    Statement statement = connection.createStatement();
    ResultSet resultSet = statement.executeQuery("select * from article where pid = 0");
    while (resultSet.next()){
        str += "<tr><td>" + resultSet.getInt("id") +"</td><td>"+
                "<a href='ShowArticleDetail.jsp?id="+
                resultSet.getInt("id")+"'>"+
                resultSet.getString("title")+
                "</a>"+"</td></tr>";
        if (resultSet.getInt("isleaf")!=0){
            tree(connection,resultSet.getInt("id"),1);
        }
    }
%>
<%!
    String str = "";
    private void tree(Connection connection, int id, int level){
        Statement statement = null;
        ResultSet resultSet = null;
        String preStr = "";
        for (int i = 0; i < level; i++) {
            preStr += "----";
        }
        try {
            statement = connection.createStatement();
            String sql =  "select * from article where pid = " + id;
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                str += "<tr><td>" + resultSet.getInt("id") +"</td><td>"+
                        preStr+"<a href='ShowArticleDetail.jsp?id="+
                        resultSet.getInt("id")+"'>"+
                        resultSet.getString("title")+
                        "</a>"+
                        "</td></tr>";
                if (resultSet.getInt("isleaf")!=0){
                    tree(connection,resultSet.getInt("id"),level+1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            try {
                if (resultSet != null){
                    resultSet.close();
                }
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

%>
<%
    resultSet.close();
    statement.close();
    connection.close();
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>树状BBS</title>
</head>
<body>
<table border="1" bgcolor="#8a2be2">
    <%=str%>
</table>
</body>
</html>
