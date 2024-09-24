<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<link rel="icon" href="data/img/data/movie.png">


<body>
  <%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
    if (request.getMethod().equalsIgnoreCase("post")) {
    if (id == null || id.isEmpty() || password == null || password.isEmpty()) {
        out.println("<script>alert('ID와 Password는 필수 입력 항목입니다.'); </script>");
    } else {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcUrl = "jdbc:mysql://localhost:3306/test";
            String dbUser = "root";
            String dbPass = "1234";

            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);

            // role 컬럼에 기본값으로 'user'를 설정
            String sql = "INSERT INTO users (id, password, address, phone, role) VALUES (?, ?, ?, ?, 'user')";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            pstmt.setString(3, address);
            pstmt.setString(4, phone);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<script>alert('회원가입 성공!'); location.href='index.jsp';</script>");
            } else {
                out.println("<script>alert('회원가입 실패!'); </script>");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
           // out.println("<h3>회원가입 중 오류 발생!</h3>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    }
%>

<jsp:include page="/data/common/header.jsp" />

<!-- Normal Breadcrumb Begin -->
<section class="normal-breadcrumb set-bg" data-setbg="data/img/ott.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="normal__breadcrumb__text">
                    <h2>Join</h2>
                   <p>Welcome to the High Five CINEMA</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Normal Breadcrumb End -->

<!-- Signup Section Begin -->
<section class="signup spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="login__form">
                    <h3>Join</h3>
                    <form action="join.jsp" method="post">
                        <div class="input__item">
                            <input type="text" placeholder="Your id" name="id">
                            <span class="icon_profile"></span>
                        </div>
                        <div class="input__item">
                            <input type="password" placeholder="Password" name="password">
                            <span class="icon_lock"></span>
                        </div>
                        <div class="input__item">
                            <input type="text" placeholder="address" name="address">
                            <span class="icon_tags"></span>
                        </div>
                        <div class="input__item">
                            <input type="text" placeholder="Phone number" name="phone">
                            <span class="icon_phone"></span>
                        </div>

                        <button type="submit" class="site-btn">Join Now</button>
                    </form>
                    <h5>Already have an account? <a href="#">Log In!</a></h5>
                </div>
            </div>
            <div class="col-lg-6">
                 <div class="login__register"><br><br>
                    <div class="product__item__pic set-bg" data-setbg="data/img/films/zootopia.jpg">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Signup Section End -->

<jsp:include page="/data/common/footer.jsp" />
