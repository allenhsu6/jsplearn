<%--
  Created by IntelliJ IDEA.
  User: allenhsu
  Date: 2018/6/5
  Time: 下午5:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<html>
  <head>
    <title>compute</title>
  </head>
  <body bgcolor="#f5f5dc">
  <div align="center">
    <form method="post" action="Compute.jsp">
      <p>选择要做的计算
        <input type="radio" name="compute" value="division"  checked>
        除法
        <input type="radio" name="compute" value="multiplication">
        乘法
      </p>
      <p>被除数（被乘数）
        <input type="text" name="value1">
        除数（乘数）
        <input type="text" name="value2">
      </p>
      <p>
        <input type="submit" name="Submit" value="计算结果">
      </p>
    </form>
  </div>
  </body>
</html>