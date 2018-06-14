<%--
  Created by IntelliJ IDEA.
  User: allenhsu
  Date: 2018/6/14
  Time: 下午2:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<%@ page import="java.awt.desktop.SystemEventListener" %>
<%
    String strID = request.getParameter("id");
    int id = Integer.parseInt(strID);
    int pid = Integer.parseInt(request.getParameter("pid"));


    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/bbs?characterEncoding=utf8&useSSL=false";
    Connection connection = DriverManager.getConnection(url,"root","332999");

    connection.setAutoCommit(false);
    delete(connection,id);
    Statement statement = connection.createStatement();
    ResultSet resultSet = statement.executeQuery("select count(*) from article where pid ="+pid);
    resultSet.next();
    int count = resultSet.getInt(1);
    System.out.println(count);
    resultSet.close();
    statement.close();
    if (count<=0){
        Statement s = connection.createStatement();
        s.executeUpdate("update article set isleaf = 0 where id=" +pid);
        s.close();

    }
    connection.commit();
    connection.setAutoCommit(true);
    connection.close();

    //删帖的想法：确定要删除的对象是否是叶子节点，不是的话，需要用到递归删除

    response.sendRedirect("ShowArticleTree.jsp");
%>

<%!
    String str = "";
    private void delete(Connection connection, int id){
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            statement = connection.createStatement();
            String sql =  "select * from article where pid = " + id;
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                    delete(connection,resultSet.getInt("id"));
            }
            statement.executeUpdate("delete from article where id="+id);
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
<html>
<head>
    <title>删除帖子</title>
</head>
<body>

</body>
</html>
