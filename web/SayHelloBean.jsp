<%--
  Created by IntelliJ IDEA.
  User: allenhsu
  Date: 2018/6/12
  Time: 上午9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="bean.*" %>
<%
    //将传来的request统一编码，一定要放在获取request前
    request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="hello" class="bean.HelloBean" scope="request">
    <jsp:setProperty name="hello" property="*"/>
    <%--这种用法Struts常见--%>

</jsp:useBean>

<%
   String name = request.getParameter("name");
   //将原来的编码转换为我们想要的编码 网络传输中的编码方式为ISO8859_1
   //out.println(new String(name.getBytes("ISO8859_1"),"gb2312"));
%>
<html>
<head>
    <title>HelloBean</title>
</head>
<body bgcolor="#faebd7">
<div align="center">
    <p>
        <h2>欢迎</h2>
    </p>
    <p>
        <jsp:getProperty name="hello" property="name"></jsp:getProperty>
        <jsp:getProperty name="hello" property="sex"></jsp:getProperty>
    </p>
</div>

</body>
</html>
