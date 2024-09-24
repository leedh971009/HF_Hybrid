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
                    <a href="./films.jsp">&ensp;LastFilms&ensp;</a>                      
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
                                    <h4>Lastfilms</h4>
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
                                        case 1: imagePath = "data/img/lastfilms/begin_again.jpg"; break;
                                        case 2: imagePath = "data/img/lastfilms/ironman.jpg"; break;
                                        case 3: imagePath = "data/img/lastfilms/joker.jpg"; break;
                                        case 4: imagePath = "data/img/lastfilms/kingsman.jpg"; break;
                                        case 5: imagePath = "data/img/lastfilms/parasite.jpg"; break;
                                        case 6: imagePath = "data/img/lastfilms/showman.jpg"; break;
                                        case 7: imagePath = "data/img/lastfilms/spiderman.jpg"; break;
                                        case 8: imagePath = "data/img/lastfilms/ToyStory4.jpg"; break;
                                        case 9: imagePath = "data/img/lastfilms/up.jpg"; break;
                                        default: imagePath = "data/img/lastfilms/default.jpg"; break;
                                    }

                                    // Select query
                                    String selectSql = "SELECT * FROM lastfilms WHERE id=" + filmId2 + ";";
                                    rs = stmt.executeQuery(selectSql);


                                  

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
                            <h5>Top Views</h5>
                        </div>
                        <ul class="filter__controls">
                            <li class="active" data-filter="*">Day</li>
                            <li data-filter=".week">Week</li>
                            <li data-filter=".month">Month</li>
                            <li data-filter=".years">Years</li>
                        </ul>
                        <div class="filter__gallery">
                                <div class="product__sidebar__view__item set-bg mix day years"
                                data-setbg="data/img/sidebar/begin-again_1.jpg">
                                <div class="ep">15000₩</div>
                                <div class="view"><i class="fa fa-eye"></i> 10000</div>
                                <h5><a href="#">BEGIN AGAIN</a></h5>
                            </div>
                            <div class="product__sidebar__view__item set-bg mix month week"
                            data-setbg="data/img/sidebar/ironman.jpg">
                            <div class="ep">15000₩</div>
                            <div class="view"><i class="fa fa-eye"></i> 9700</div>
                            <h5><a href="#">IRONMAN3</a></h5>
                        </div>
                        <div class="product__sidebar__view__item set-bg mix week years"
                        data-setbg="data/img/sidebar/ToyStory4.jpg">
                        <div class="ep">16000₩</div>
                        <div class="view"><i class="fa fa-eye"></i> 9141</div>
                        <h5><a href="#">TOY STORY 4</a></h5>
                    </div>
                    <div class="product__sidebar__view__item set-bg mix years month"
                    data-setbg="data/img/sidebar/joker.jpg">
                    <div class="ep">15000₩</div>
                    <div class="view"><i class="fa fa-eye"></i> 7892</div>
                    <h5><a href="#">JOKER</a></h5>
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
