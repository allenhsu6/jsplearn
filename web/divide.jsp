<%--
  Created by IntelliJ IDEA.
  User: allenhsu
  Date: 2018/6/11
  Time: 下午7:18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Divide</title>
</head>
<body bgcolor="#7fffd4">
<center>
    <h1>
        <%
            try {
                float dividend =Float.parseFloat(request.getParameter("v1"));
                float dividsor = Float.parseFloat(request.getParameter("v2"));
                float result = dividend/dividsor;
                %>
        <%=result%>
        <%
            }
            catch (Exception e){
                out.println("不合法的被乘数或除数");
            }
        %>
    </h1>
</center>

</body>
</html>
