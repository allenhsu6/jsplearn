<%--
  Created by IntelliJ IDEA.
  User: allenhsu
  Date: 2018/6/11
  Time: 下午8:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="bean.*" %>
<html>
<head>
    <title>testBean</title>
</head>
<%
    CounterBean cb = new CounterBean();
%>
<body>
<%--
<div align="center">
    <font color="#dc143c" size="5">
        <%=cb.getCount()%>
    </font>
</div>
--%>
<jsp:useBean id="bg" class="bean.CounterBean" scope="session">
</jsp:useBean>

<jsp:getProperty name="bg" property="count"></jsp:getProperty>
</body>
</html>
