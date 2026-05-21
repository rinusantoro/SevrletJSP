<%-- 
    Document   : validasi
    Created on : 21 May 2026, 14.47.05
    Author     : sonas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String userId = request.getParameter("userId");
            String password = request.getParameter("password");
            Cookie cookie;

            if ((userId != null) && (userId.equalsIgnoreCase("ADMIN"))
                    && (password != null) && (password.equalsIgnoreCase("ADMIN"))) {

                java.text.SimpleDateFormat waktu =
                    new java.text.SimpleDateFormat("HH:mm:ss dd-MM-yyyy");

                java.util.Date waktuLogin = new java.util.Date();
session.setAttribute("userLogin", "Administrator");
session.setAttribute("waktuLogin", waktu.format(waktuLogin));
session.setMaxInactiveInterval(20);

cookie = new Cookie("nama", "Administrator");
cookie.setMaxAge(15);
response.addCookie(cookie);

String nilaiWaktu = waktu.format(waktuLogin);
cookie = new Cookie("waktuLogin", java.net.URLEncoder.encode(nilaiWaktu, "UTF-8"));
cookie.setMaxAge(20);
response.addCookie(cookie);
} else {
// Baris 39
String pesanError = "User ID atau password salah";
cookie = new Cookie("keterangan", java.net.URLEncoder.encode(pesanError, "UTF-8"));
cookie.setMaxAge(15);
response.addCookie(cookie);
}

response.sendRedirect("index.jsp");
%>
</body>
</html>
