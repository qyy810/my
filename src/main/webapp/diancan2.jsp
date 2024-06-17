<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>点餐页面</title>
    <style>
        /* 简单的样式 */
        .menu-item {
            margin-bottom: 10px;
        }
        #cart {
            margin-top: 20px;
            border: 1px solid #ccc;
            padding: 10px;
        }
    </style>
</head>
<body>
<%
Class.forName("org.mariadb.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mariadb://192.168.166.161:3306/db1?user=root&password=123456");
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("select * from cai");
while(rs.next()){
	out.println("<div id='lit'>");
	String name = rs.getString("name");
	out.println("<li>菜名:" + name + "</li>");
	String price = rs.getString("price");
	out.println("<li>价格:" + price + "</li>");
	out.println("<hr>");
	out.println("</div>");
}
out.println("</u1>");
rs.close();
stmt.close();
conn.close();
%>
    <h1>菜单</h1>
    <div id="menu">
        <!-- 菜品将动态插入到这里 -->
    </div>
    <button onclick="showCart()">查看购物车</button>
    <div id="cart" style="display: none;">
        <h2>购物车</h2>
        <!-- 购物车内容将动态插入到这里 -->
    </div>

    <script src="script.js"></script>
</body>
</html>
