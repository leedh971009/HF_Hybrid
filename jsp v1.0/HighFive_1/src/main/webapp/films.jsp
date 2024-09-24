<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>

<%
    // 세션에서 사용자 정보 가져오기
    HttpSession httpSession = request.getSession();
    String userId = (String) httpSession.getAttribute("userId");
    String password = (String) httpSession.getAttribute("password");
    String address = (String) httpSession.getAttribute("address");
    String phonenumber = (String) httpSession.getAttribute("phone");

    String userType = (String) session.getAttribute("userType");

    //Check if the user is logged in
    boolean isLoggedIn = (userId != null && !userId.isEmpty());

    // 공통 JDBC 드라이버 정보
    String jdbcDriver = "com.mysql.jdbc.Driver";
    String jdbcUrl = "jdbc:mysql://localhost:3306/test";
    String dbUser = "root";
    String dbPass = "1234";

    Connection conn = null; // 중복 선언 방지
    Statement stmt = null;
    ResultSet rs = null;
    PreparedStatement updatestmt = null;
%>



<script>


function purchaseFilm(filmId, button, film_name) {
	//debugger;
    button.disabled = true;
    button.textContent = '구매 중...';
    
    console.log(filmId);
    console.log(film_name);

//    const url = `purchase.jsp?filmId=` + filmId + film_name ;
    const url = `purchase.jsp?filmId=` + filmId  ;
   
    console.log("Request URL:", url);
    
    const data = new URLSearchParams();
    data.append('filmName', film_name);
    console.log(data)
    

       fetch(url, {
        method: 'POST', // POST 요청
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded' // 데이터 타입 설정
        },
        body: data.toString() // 데이터 전송
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('구매가 완료되었습니다!');
        } else {
            alert('구매 실패. 남은 수량을 확인해주세요.');
        }
    })
    .catch(error => console.error('Error:', error))
    .finally(() => {
        button.disabled = false; // 버튼 활성화
        button.textContent = 'purchase'; // 버튼 텍스트 초기화
    });
}
</script>

<jsp:include page="/data/common/header.jsp" />

<body>
<!-- Breadcrumb Begin -->
<div class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__links">
                    <a href="./index.jsp"><i class="fa fa-home"></i>Home&ensp;></a>
                    <a href="./films.jsp">&ensp;Films&ensp;</a>                      
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Product Section Begin -->
<section class="product-page spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="product__page__content">
                    <div class="product__page__title">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-6">
                                <div class="section-title">
                                    <h4>films</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6">
                                <div class="product__page__filter">
                                    <p>Order by:</p>
                                    <select>
                                        <option value="">A-Z</option>
                                        <option value="">1-10</option>
                                        <option value="">10-50</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <%
                            try {
                                Class.forName(jdbcDriver);
                                conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
                                stmt = conn.createStatement();

                                // Update 가격과 영화 데이터 출력하는 공통 로직
                                for (int filmId2 = 1; filmId2 <= 9; filmId2++) {
                                    String imagePath = "";

                                    // 영화 ID에 따라 다른 이미지 경로 설정
                                    switch (filmId2) {
                                        case 1: imagePath = "data/img/films/12.png"; break;
                                        case 2: imagePath = "data/img/films/alien.jpg"; break;
                                        case 3: imagePath = "data/img/films/avatar.jpg"; break;
                                        case 4: imagePath = "data/img/films/Dune.png"; break;
                                        case 5: imagePath = "data/img/films/panda.jpg"; break;
                                        case 6: imagePath = "data/img/films/the_admiral.jpg"; break;
                                        case 7: imagePath = "data/img/films/the_roundup.jpg"; break;
                                        case 8: imagePath = "data/img/films/topgun.jpg"; break;
                                        case 9: imagePath = "data/img/films/interstellar.jpg"; break;
                                        default: imagePath = "data/img/films/default.jpg"; break;
                                    }

                                    // Select query
                                    String selectSql = "SELECT * FROM films WHERE id=" + filmId2 + ";";
                                    rs = stmt.executeQuery(selectSql);


                                    // 영화 ID 목록
                                    int[] filmIds = {1, 2, 3,4,5,6,7,8,9};

                                    // 가격 업데이트 쿼리
                                    String updateSql = "UPDATE films SET price = ? WHERE id = ?";
                                    updatestmt = conn.prepareStatement(updateSql);

                                    for (int filmId : filmIds) {
                                        // 예: 특정 ID에 따라 가격을 다르게 설정
                                        int newPrice;
                                        if (filmId == 1) {
                                            newPrice = 14000; // 영화 ID가 1이면 12000
                                        } else if (filmId == 2) {
                                            newPrice = 16000; // 영화 ID가 2이면 15000
                                        } else if (filmId == 3) {
                                            newPrice = 16000; // 영화 ID가 2이면 15000
                                        }else if (filmId == 4) {
                                            newPrice = 14000; // 영화 ID가 2이면 15000
                                        }else if (filmId == 5) {
                                            newPrice = 15000; // 영화 ID가 2이면 15000
                                        }else if (filmId == 6) {
                                            newPrice = 15000; // 영화 ID가 2이면 15000
                                        }else if (filmId == 7) {
                                            newPrice = 14000; // 영화 ID가 2이면 15000
                                        }else if (filmId == 8) {
                                            newPrice = 16000; // 영화 ID가 2이면 15000
                                        }else {
                                            newPrice = 14000; // 나머지는 10000
                                        }
                                        updatestmt.setInt(1, newPrice);
                                        updatestmt.setInt(2, filmId);
                                        updatestmt.executeUpdate();
                                    }

                                    // 영화 데이터가 존재하면 HTML 출력
                                    if (rs.next()) {
                                        String name = rs.getString("name");
                                        int price = rs.getInt("price");
                                        String platform = rs.getString("platform");
                                        String category = rs.getString("CATEGORY");
                                        String comment = rs.getString("COMMENT");
                                        String view = rs.getString("VIEW");
                        %>
                                       <div class="col-lg-4 col-md-6 col-sm-6">
                                            <div class="product__item">
                                                <!-- 가격을 오른쪽 정렬하고, 그 아래에 구매하기 버튼을 추가 -->
												<div class="product__item__pic set-bg" data-setbg="<%= imagePath %>">
												    <div class="price-wrapper" style="text-align: right;">
												        <div class="ep" margin-bottom: 10px;"><%= price %>₩</div>
												      
												         <% if (session.getAttribute("userId") != null) { %>
												       <button class="purchase-button" onclick="purchaseFilm(<%= rs.getInt("ID") %>, this, '<%= rs.getString("name") %>')" style="margin-top: 10px; font-size: 12px; padding: 2px 10px; background-color: #4CAF50; color: white; border: none; cursor: pointer; border-radius: 4px;">
													    purchase
														</button><% } %>
														
														
													

												    </div>
												    <div class="comment"><i class="fa fa-comments"></i> <%= comment %> </div>
												    <div class="view"><i class="fa fa-eye"></i> <%= view %> </div>
												</div>
                                                <div class="product__item__text">
                                                    <ul>
                                                        <li><%= platform %></li>
                                                        <li><%= category %></li>
                                                    </ul>
                                                    <h5 style="color: white;"><%= name %></h5>
                                                </div>
                                            </div>
                                        </div>

                        <%
                                    }
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            } finally {
                                try {
                                    if (rs != null) rs.close();
                                    if (stmt != null) stmt.close();
                                    if (conn != null) conn.close();
                                } catch (SQLException se) {
                                    se.printStackTrace();
                                }
                            }
                        %>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-md-6 col-sm-8">
                <div class="product__sidebar">
                    <div class="product__sidebar__view">
                        <div class="section-title">
                            <h5>Top Recommends</h5>
                        </div>
                        <ul class="filter__controls">
                            <li class="active" data-filter="*">Day</li>
                            <li data-filter=".week">Week</li>
                            <li data-filter=".month">Month</li>
                            <li data-filter=".years">Years</li>
                        </ul>
                        <div class="filter__gallery">
                            <div class="product__sidebar__view__item set-bg mix day" data-setbg="data/img/sidebar/panda.jpg">
                                <div class="ep">15000₩</div>
                                <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                <h5><a href="#">Kung Fu Panda 4</a></h5>
                            </div>
                            <div class="product__sidebar__view__item set-bg mix month week" data-setbg="data/img/sidebar/avatar.jpg">
                                <div class="ep">16000₩</div>
                                <div class="view"><i class="fa fa-eye"></i> 8501</div>
                                <h5><a href="#">Avatar</a></h5>
                            </div>
                            <div class="product__sidebar__view__item set-bg mix day years" data-setbg="data/img/sidebar/alien.jpg">
                                <div class="ep">16000₩</div>
                                <div class="view"><i class="fa fa-eye"></i> 7896</div>
                                <h5><a href="#">Alien: Romulus</a></h5>
                            </div>
                            <div class="product__sidebar__view__item set-bg mix week years" data-setbg="data/img/sidebar/topgun.jpg">
                                <div class="ep">16000₩</div>
                                <div class="view"><i class="fa fa-eye"></i> 7365</div>
                                <h5><a href="#">Top Gun: Maverick</a></h5>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->

<jsp:include page="/data/common/footer.jsp" />

</body>
</html>
