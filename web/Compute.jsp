<%--
  Created by IntelliJ IDEA.
  User: allenhsu
  Date: 2018/6/11
  Time: 下午7:07
这个例子主要说明两种include手段
第一种是：include    动态编译，会传参
第二种是：@ include 原封不动拿来
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //完善写法：检验是否为空值
    String value1 = request.getParameter("value1");
    String value2 = request.getParameter("value2");
%>

<%
    if (request.getParameter("compute").equalsIgnoreCase("division"))
    { %>
<jsp:include page="divide.jsp" flush="true">
    <jsp:param name="v1" value="<%=value1%>"/>
    <jsp:param name="v2" value="<%=value2%>"/>
</jsp:include>
<%
    } else {
%>
<!--这种方式无法传参数 -->
    <%@ include file="multiply.jsp" %>
<% } %>