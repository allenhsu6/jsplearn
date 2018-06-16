<%--
  Created by IntelliJ IDEA.
  User: allenhsu
  Date: 2018/6/13
  Time: 下午3:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@page import="java.sql.*" %>
<%
    int pageSize = 3;

    String strPageNo = request.getParameter("pageNo");
    int pageNo;
    if (strPageNo== null  || strPageNo.equals("")){
        pageNo = 1;
    }else {
        try{
            pageNo = Integer.parseInt(strPageNo.trim());
        }catch (NumberFormatException e){
            pageNo = 1;
        }
    }

%>


<%
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/bbs?characterEncoding=utf8&useSSL=false";
    Connection connection = DriverManager.getConnection(url,"root","332999");

    Statement stateCount = connection.createStatement();
    ResultSet pageCount = stateCount.executeQuery("select count(*) from article where pid = 0");
    pageCount.next();
    int countRecords = pageCount.getInt(1);
    int countPages = countRecords%pageSize == 0 ? countRecords/pageSize : countRecords/pageSize+1;
    if (pageNo > countPages) pageNo = countPages;


    int StartPos = (pageNo-1)*pageSize;
    Statement statement = connection.createStatement();
    ResultSet resultSet = statement.executeQuery("select * from article where pid = 0 order by pdate desc limit "+StartPos+","+pageSize);

%>

<html>
<head>
    <title>树状BBS</title>
</head>
<body>
<a href="Post.jsp" >发布新帖</a>
<table border="1" bgcolor="#ffebcd">
<%
    while (resultSet.next()){
        %>
    <tr>

        <td>
        <%=resultSet.getString("title")%>
    </td>
        <td>
            <%=resultSet.getString("cont")%>
        </td>

    </tr>
    <%
    }
        resultSet.close();
        statement.close();
        connection.close();
    %>

</table>
共<%=countPages%>页
&nbsp; 第<%=pageNo%>页 &nbsp;&nbsp;
<a href="ShowArticleFlat.jsp?pageNo=<%=pageNo-1%>">上一页</a>&nbsp;
<a href="ShowArticleFlat.jsp?pageNo=<%=pageNo+1%>">下一页</a>

<p>

<form name="select" >
    <select name="pageNo" onchange="document.select.submit()">
    <%
        for (int i = 1; i <= countPages; i++) {
            %>
        <option value=<%=i%> <%=(pageNo == i)?"selected" : ""%>>第<%=i%>页
        <%
        }
    %>
</select>
</form>
<form name="select2" action="ShowArticleFlat.jsp">
    <input type="text" size="4" name="pageNo" value=<%=pageNo%>>
    <input type="submit" value="go">
</form>
</body>
</html>


