<%-- 
    Document   : bai_4
    Created on : Oct 16, 2024, 8:54:05 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đổi tiền ngoại tệ</title>
    </head>
    <body>
        <h1>Đổi ngoại tệ</h1>
        <form action="bai_4.jsp" method="POST">
            Cho biết số tiền: <input type="number" name="sotien" value="" required=""/>
            <br>
            Cho biết loại ngoại tệ: 
            <select name="loaingoaite">
                <option value="USD">USD - Đô la Mỹ</option>
                <option value="GBP">GBP - Bảng Anh</option>
                <option value="EUR">EUR - Euro</option>
                <option value="JPY">JPY - Yên Nhật</option>
                <option value="AUD">AUD - Đô la Úc</option>
            </select>
            <input type="submit" value="Đổi tiền" />
            <input type="reset" value="Tiếp tục" />
        </form>
         <%
        // Lấy dữ liệu từ form
        if (request.getParameter("sotien") != null && request.getParameter("loaingoaite") != null) {
            double sotien = Double.parseDouble(request.getParameter("sotien"));
            String loaingoaite = request.getParameter("loaingoaite");
            double tienvnd = 0;

            // Tính số tiền quy đổi
            switch (loaingoaite) {
                case "USD":
                    tienvnd = sotien * 21380;
                    break;
                case "GBP":
                    tienvnd = sotien * 32622.80;
                    break;
                case "EUR":
                    tienvnd = sotien * 23555.67;
                    break;
                case "JPY":
                    tienvnd = sotien * 178.61;
                    break;
                case "AUD":
                    tienvnd = sotien * 16727.44;
                    break;
            }  

            // Hiển thị kết quả
            out.println("<hr>");
            out.println("<h1>Kết quả đổi tiền</h1>");
            out.println(sotien + " " + loaingoaite + " = " + String.format("%,.0f", tienvnd) + " VND");
        }
        %>
    </body>
</html>
