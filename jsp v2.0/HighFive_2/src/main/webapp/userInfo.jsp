<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.sql.Timestamp, java.text.SimpleDateFormat" %>
<!DOCTYPE html>

<jsp:include page="/data/common/header.jsp" />
<style>
    .login {
        background-color: #000000; /* 어두운 배경 색상 */
        padding: 40px 0; /* 상하 여백 */
        color: #FFFFFF; /* 텍스트 기본 색상 */
    }

    .login .container {
        background-color: #212121; /* 내부 컨테이너 배경 */
        border-radius: 10px; /* 모서리 둥글게 */
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* 더 진한 그림자 효과 */
        padding: 30px; /* 패딩 */
    }

    .login h3 {
        font-size: 28px; /* 더 큰 폰트 사이즈 */
        margin-bottom: 25px; /* 제목 하단 여백 */
        color: #FFFFFF; /* 밝은 제목 색상 */
        font-weight: bold; /* 굵은 제목 */
        text-align: center; /* 제목 중앙 정렬 */
    }

    .login table {
        width: 100%; /* 테이블 너비를 100%로 */
        border-collapse: collapse; /* 테두리 겹침 제거 */
        margin-bottom: 25px;
    }

    .login table thead {
        background-color: #ff0000; /* 테이블 헤더 배경색 */
        color: #fff; /* 헤더 글자색 */
        border-radius: 8px;
    }

    .login table thead th {
        padding: 12px; /* 셀 패딩 */
        text-align: center; /* 텍스트 중앙 정렬 */
        font-size: 18px; /* 큰 폰트 */
        font-weight: bold; /* 굵은 글씨 */
    }

    .login table tbody td {
        padding: 12px; /* 셀 패딩 */
        text-align: center; /* 텍스트 중앙 정렬 */
        border-bottom: 1px solid #000000; /* 셀 하단 테두리 색상 어둡게 */
        font-size: 16px;
    }

    .login table tbody tr:nth-child(even) {
        background-color: #212121; /* 짝수 행 배경색 */
    }

    .login table tbody tr:hover {
        background-color: #5A5A8C; /* 마우스 오버 시 배경색 */
    }

    .status-active {
        color: #28A745; /* 활성 상태 텍스트 색상 (초록) */
        font-weight: bold;
    }

    .status-inactive {
        color: #DC3545; /* 비활성 상태 텍스트 색상 (빨강) */
        font-weight: bold;
    }
    
    .button-edit {
        background-color: #007BFF; /* 수정 버튼 배경 */
        color: white; /* 텍스트 색상 */
        padding: 10px 15px; /* 패딩 */
        border-radius: 6px; /* 버튼 모서리 둥글게 */
        text-decoration: none; /* 링크 밑줄 제거 */
        font-weight: bold; /* 굵은 텍스트 */
        display: inline-block; /* 버튼 모양 유지 */
        transition: background-color 0.3s ease; /* 호버 시 배경색 변경 */
    }

    .button-edit:hover {
        background-color: #0056b3; /* 호버 시 더 어두운 파란색 */
    }
</style>

<!-- Normal Breadcrumb Begin -->
<section class="normal-breadcrumb set-bg" data-setbg="data/img/ott.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="normal__breadcrumb__text">
                    <h2>User Info</h2>
                    <p>Welcome to the High Five Cinema</p>
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
            <div class="col-lg-12">
                <h3>User Info</h3>
                <table border="0" cellpadding="10" cellspacing="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Address</th>
                            <th>Phone</th>
                            <th>Role</th>
                            <th>Active</th>
                            <th>Join</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Connection conn = null;
                            PreparedStatement pstmt = null;
                            ResultSet rs = null;
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                String jdbcUrl = "jdbc:mysql://localhost:3306/test";
                                String dbUser = "root";
                                String dbPass = "1234";

                                conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);

                                String sql = "SELECT id, address, phone, role, is_active, created_at, updated_at FROM users";
                                pstmt = conn.prepareStatement(sql);
                                rs = pstmt.executeQuery();
                                

                                while (rs.next()) {
                                    String id = rs.getString("id");
                                    String address = rs.getString("address");
                                    String phone = rs.getString("phone");
                                    String role = rs.getString("role");
                                    boolean isActive = rs.getBoolean("is_active");
                                    Timestamp createdAt = rs.getTimestamp("created_at");
                                    
                                	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                    String formattedCreatedAt = dateFormat.format(createdAt);

                                    %>
                                    <tr>
                                        <td><%= id %></td>
                                        <td><%= address %></td>
                                        <td><%= phone %></td>
                                        <td><%= role %></td>
                                        <td class="<%= isActive ? "status-active" : "status-inactive" %>">
                                            <%= isActive ? "회원" : "휴먼회원" %>
                                        </td>
                                        <td><%= formattedCreatedAt %></td> 
                                    </tr>
                                    <%
                                }
                            } catch (ClassNotFoundException | SQLException e) {
                                e.printStackTrace();
                            } finally {
                                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
    
    
    
    
<!-- Login Section End -->

<jsp:include page="/data/common/footer.jsp" />