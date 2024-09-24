<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.sql.Timestamp, java.text.SimpleDateFormat" %>
<%
// 세션에서 사용자 정보 가져오기
HttpSession httpSession = request.getSession();
String userId = (String) httpSession.getAttribute("userId");
String password = (String) httpSession.getAttribute("password");
String address = (String) httpSession.getAttribute("address");
String phonenumber = (String) httpSession.getAttribute("phone");
%>

<style>
    .login {
        background-color: #000000; /* 어두운 배경 색상 */
        padding: 40px 0; /* 상하 여백 */
        color: #FFFFFF; /* 텍스트 기본 색상 */
    }

    .login .container {
        background-color: #212121; /* 내부 컨테이너 배경 */
        border-radius: 10px; /* 모서리 둥글게 */
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
d
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
    
    .login__form h3,
    .login__form .form-control,
    .login__register h3,
    .login__register table th,
    .login__register table td {
        color: white; /* 글씨 색상을 흰색으로 설정 */
    }

    .login__register {
        background-color: rgba(0, 0, 0, 0.7); /* 배경색을 조금 어둡게 설정하여 가독성 향상 */
        padding: 20px; /* 여백 추가 */
    }
    
        .input__item {
        margin-right: 20px; /* 오른쪽 여백 설정 (원하는 크기로 조정 가능) */
    }

    .form-control {
        width: 100%; /* 입력 필드가 전체 너비를 차지하도록 설정 */
    }
    
        .input__item {
        display: flex; /* Flexbox 사용 */
        align-items: center; /* 수직 정렬 */
        margin-bottom: 15px; /* 각 입력 항목 간의 간격 */
    }

    .input__item span {
        margin-right: 10px; /* 아이콘과 입력 필드 간의 간격 */
    }

    .form-control {
        flex-grow: 1; /* 입력 필드가 가능한 공간을 차지하도록 설정 */
    }
    
	.input__item {
    position: relative;
    margin-bottom: 15px;
	}

	.form-control {
    padding-left: 30px; /* 아이콘 공간을 위한 패딩 */
	}

	.input__item span {
    position: absolute;
    left: 10px; /* 아이콘 위치 조정 */
    top: 50%;
    transform: translateY(-50%); /* 아이콘 세로 가운데 정렬 */
    pointer-events: none; /* 아이콘 클릭 방지 */
    color: #000000; /* 아이콘 색깔 흰색 */
	}

	.input__item input[readonly] {
    background-color: #f9f9f9; /* 읽기 전용 배경색 조정 */
	}
</style>


<jsp:include page="/data/common/header.jsp" />

<!-- Normal Breadcrumb Begin -->
<section class="normal-breadcrumb set-bg" data-setbg="data/img/ott.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="normal__breadcrumb__text">
                    <h2>My Page</h2>
                    <p>Welcome to the High Five CINEMA</p>
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
                <div class="login__register">
                    <h3><br><br>My Page</h3>
                    <form action="#">
                        <div class="input__item">
                        	<span class="icon_mail"></span>
    						<input type="text" class="form-control" placeholder="ID" value="&nbsp;&nbsp;&nbsp;&nbsp; id : &nbsp;<%= session.getAttribute("userId") != null ? session.getAttribute("userId") : "" %>" readonly />
   							
						</div>
                        <div class="input__item">
                        	<span class="icon_lock"></span>
                            <input type="text" class="form-control" placeholder="Password" value="&nbsp;&nbsp;&nbsp;&nbsp; Password : &nbsp;<%= session.getAttribute("password") != null ? session.getAttribute("password") : "" %>" readonly />
                            
                        </div>
                        <div class="input__item">
                        	<span class="icon_tags"></span>
                            <input type="text" class="form-control" placeholder="address" value="&nbsp;&nbsp;&nbsp;&nbsp; address : &nbsp;<%= session.getAttribute("address") != null ? session.getAttribute("address") : "" %>" readonly />
                            
                        </div>
                        <div class="input__item">
                        	<span class="icon_phone"></span>
                            <input type="text" class="form-control"  placeholder="Phone number" value="&nbsp;&nbsp;&nbsp;&nbsp; Phone number : &nbsp;<%= session.getAttribute("phone") != null ? session.getAttribute("phone") : "" %>" readonly />                            
                        </div><br>
                    </form>
                </div>
            </div>
            
              <div class="col-lg-6">
                <div class="login__register"><br><br>
                    <h3>Purchase Logs</h3>
                    <table border="0" cellpadding="10" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                if (userId != null) {
                                    Connection conn = null;
                                    PreparedStatement pstmt = null;
                                    ResultSet rs = null;
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        String jdbcUrl = "jdbc:mysql://localhost:3306/test";
                                        String dbUser = "root";
                                        String dbPass = "1234";

                                        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);

                                        String sql = "SELECT p.film_name, p.purchase_date " +
                                                      "FROM purchases p " +
                                                      "WHERE p.user_id = ? " +
                                                      "ORDER BY p.purchase_date DESC";
                                        pstmt = conn.prepareStatement(sql);
                                        pstmt.setString(1, userId); // 사용자 ID를 바인딩
                                        rs = pstmt.executeQuery();

                                        while (rs.next()) {
                                            String film_name = rs.getString("film_name");
                                            Timestamp purchase_date = rs.getTimestamp("purchase_date");

                                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                            String formattedCreatedAt = dateFormat.format(purchase_date);
                            %>
                                            <tr>
                                                <td><%= film_name %></td>
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
                                } else {
                                    out.println("<tr><td colspan='2'>로그인 후 구매 정보를 확인하세요.</td></tr>");
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <div class="login__social">
            <div class="row d-flex justify-content-center">
                <div class="col-lg-6">
                    <div class="login__social__links">
                        <!-- 소셜 로그인 링크 -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Login Section End -->

<jsp:include page="/data/common/footer.jsp" />