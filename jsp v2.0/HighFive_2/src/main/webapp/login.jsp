<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<link rel="icon" href="data/img/data/movie.png">

<body>
    <%
    // 폼이 제출되었는지 확인
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String jdbcDriver = "com.mysql.cj.jdbc.Driver";
        String jdbcUrl = "jdbc:mysql://localhost:3306/test";
        String dbUser = "root";
        String dbPass = "1234";

        try {
            Class.forName(jdbcDriver);
            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);

            String sql = "SELECT * FROM users WHERE id = ? AND password = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // 로그인 성공 시 세션에 사용자 정보 저장
                session.setAttribute("userId", id);
                session.setAttribute("password", password);
                session.setAttribute("address", rs.getString("address"));
                session.setAttribute("phone", rs.getString("phone"));
                session.setAttribute("role", rs.getString("role")); 
                // 성공 알림 후 메인 페이지로 이동
                out.println("<script>alert('로그인 성공!'); location.href='index.jsp';</script>");
            } else {
                // 로그인 실패 시 메시지 출력
                out.println("<script>alert('로그인 실패. ID 또는 패스워드를 확인하세요.');</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('데이터베이스 연결 오류'); history.back();</script>");
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    // 로그아웃 동작 처리
    String action = request.getParameter("action");
    if ("logout".equals(action)) {
        // 세션 무효화
        session.invalidate();
        // 로그아웃 알림 후 메인 페이지로 이동
        out.println("<script>alert('로그아웃 되었습니다.'); location.href='index.jsp';</script>");
    }
%>
 
 <jsp:include page="/data/common/header.jsp" />

<!-- Normal Breadcrumb Begin -->
<section class="normal-breadcrumb set-bg" data-setbg="data/img/ott.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="normal__breadcrumb__text">
                    <h2>Login</h2>
                    <p>Welcome to the High Five CINEMAS</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Normal Breadcrumb End -->

<!-- Login Section Begin -->
<section class="login spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="login__form">
                    <h3>Login</h3>
                    <form action="login.jsp" method="post">
                        <div class="input__item">
                            <input type="text" placeholder="Email address" name="id">
                            <span class="icon_mail"></span>
                        </div>
                        <div class="input__item">
                            <input type="password" placeholder="Password" name="password">
                            <span class="icon_lock"></span>
                        </div>
                        <button type="submit" class="site-btn">Login Now</button>
                    </form>
                    <a href="#" class="forget_pass">Forgot Your Password?</a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="login__register">
                                    <div class="product__item__pic set-bg" data-setbg="data/img/films/inside.jpg">
                </div>
            </div>
        </div>
        <div class="login__social">
            <div class="row d-flex justify-content-center">
                <div class="col-lg-6">
                    <div class="login__social__links">
                        <span></span>
                        <ul>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Login Section End -->

<jsp:include page="/data/common/footer.jsp" />