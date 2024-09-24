<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*" %>

<% 
    // 세션에서 사용자 역할을 가져옴
    String userId = (String) session.getAttribute("userId");
    String userRole = (String) session.getAttribute("role");
%>


<jsp:include page="/data/common/header.jsp" />







<!-- Hero Section Begin -->
<section class="hero">
    <div class="container">
        <div class="hero__slider owl-carousel">
            <div class="hero__items set-bg" data-setbg="data/img/homepage/cgv.png">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="hero__text">
                            <div class="label">CGV</div>
                            <h2>CGV</h2>
                            <p>CJ Golden Village</p>
                            <a href="#"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero__items set-bg" data-setbg="data/img/homepage/lotte.png">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="hero__text">
                            <div class="label">LOTTE CINEMA</div>
                            <h2>LOTTE CINEMA</h2>
                            <p>Leading Culture-Makers</p>
                            <a href="#"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero__items set-bg" data-setbg="data/img/homepage/megabox.png">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="hero__text">
                            <div class="label">MEGABOX</div>
                            <h2>MEGABOX</h2>
                            <p>Meet Play Share</p>
                            <a href="#"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Hero Section End -->
<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
	</div>
</div>
</section>
<!-- Product Section End -->



<!-- Js Plugins -->
<script src="data/js/jquery-3.3.1.min.js"></script>
<script src="data/js/bootstrap.min.js"></script>
<script src="data/js/player.js"></script>
<script src="data/js/jquery.nice-select.min.js"></script>
<script src="data/js/mixitup.min.js"></script>
<script src="data/js/jquery.slicknav.js"></script>
<script src="data/js/owl.carousel.min.js"></script>
<script src="data/js/main.js"></script>

</body>

</html>

<jsp:include page="/data/common/footer.jsp" />
