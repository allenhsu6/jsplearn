<%--
  Created by IntelliJ IDEA.
  User: allenhsu
  Date: 2018/6/14
  Time: 下午11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //正常这里的name和password需要连接数据库
  String name = request.getParameter("name");
  String password = request.getParameter("password");

  if (name.equalsIgnoreCase("admin")&& password.equalsIgnoreCase("admin")){
      //session非常典型的用法
      session.setAttribute("admin","true");
      response.sendRedirect("ShowArticleTree.jsp");
  }else{
      out.print("错误的账号或密码，请返回登录界面重新登录");
  }
%>
<html>
<head>
    <title>登录页面</title>
</head>
<body>

</body>
</html>
