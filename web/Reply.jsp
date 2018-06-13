<%--
  Created by IntelliJ IDEA.
  User: allenhsu
  Date: 2018/6/13
  Time: 下午10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String strID = request.getParameter("id");
    int id = Integer.parseInt(strID);
    int rootid = Integer.parseInt(request.getParameter("rootid"));

%>

<html>
<head>
    <title>回复页面</title>
</head>
<body>
<form action="ReplyOK.jsp" method="post">
    <input type="hidden" name="id" value="<%=id%>">
    <input type="hidden" name="rootid" value="<%=rootid%>">
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
