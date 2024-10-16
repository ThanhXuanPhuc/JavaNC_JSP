<%@page import="my.common.DatabaseUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Tra cứu điểm</h1>
        <form action="tracuudiem.jsp" method="POST">
            Số báo danh <input type="text" name="sobd" value=""/>
            Họ tên <input type="text" name="hoten" value=""/>
            <button type="submit">Tra cứu</button>
        </form>
                
        <%
            request.setCharacterEncoding("UTF-8");
            String hoten = request.getParameter("hoten");
            String sobd = request.getParameter("sobd");
            if(hoten!=null || sobd !=null) {
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    conn = DatabaseUtil.getConnection();
                    if (conn != null) {
                        if(hoten!=null && !hoten.isEmpty()) {
                            ps = conn.prepareStatement("select * from thisinh where hoten like ?");
                            ps.setString(1, "%" + hoten + "%");
                        } else if(sobd!=null && !sobd.isEmpty()) {
                            ps = conn.prepareStatement("select * from thisinh where sobd=?");
                            ps.setString(1, sobd);
                        }

                        rs = ps.executeQuery();
        %>
                        <table border="1">
                            <tr>
                                <th>Số báo danh</th>
                                <th>Họ tên</th>
                                <th>Địa chỉ</th>
                                <th>Điểm toán</th>
                                <th>Điểm lý</th>
                                <th>Điểm hoá</th>
                                <th>Tổng điểm</th>
                            </tr>
        <%
                        while(rs.next()) {
                            double tongdiem = rs.getFloat("toan") + rs.getFloat("ly") + rs.getFloat("hoa");
        %>
                            <tr>
                                <td><%= rs.getString("sobd") %></td>
                                <td><%= rs.getString("hoten") %></td>
                                <td><%= rs.getString("diachi") %></td>
                                <td><%= rs.getFloat("toan") %></td>
                                <td><%= rs.getFloat("ly") %></td>
                                <td><%= rs.getFloat("hoa") %></td>
                                <td><%= tongdiem %></td>
                            </tr>
        <%
                        }
                    } else {
                        out.println("Không thể thiết lập kết nối cơ sở dữ liệu.");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (Exception e) { }
                    if (ps != null) try { ps.close(); } catch (Exception e) { }
                    if (conn != null) try { conn.close(); } catch (Exception e) { }
                }
            }
        %>
                    </table>
    </body>
</html>
