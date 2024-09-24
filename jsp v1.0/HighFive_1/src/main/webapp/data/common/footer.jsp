<% 
    // 세션에서 사용자 역할을 가져옴
    String userId = (String) session.getAttribute("userId");
    String userRole = (String) session.getAttribute("role");
%>
<!-- Footer Section Begin -->
<footer class="footer">
<div class="page-up">
    <a href="#" id="scrollToTopButton"><span class="arrow_carrot-up"></span></a>
</div>
<div class="container">
    <div class="row">
        <div class="col-lg-3">
            <div class="footer__logo">
                <a href="./index.html"><img src="data/img/logo.png" alt=""></a>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="footer__nav">
                  <ul>
                                <li><a href="./index.jsp">HomePage</a></li>
                                <li><a href="./films.jsp">Films</a></li>                                                   
<%--                                 <li>    <%= session.getAttribute("userId") %></li> --%>
                                 <% if (session.getAttribute("userId") != null && "admin".equals(userRole)) { %> <!-- admin 역할일 때만 보이도록 조건 추가 -->
							        <li><a href="lastFilms.jsp">LastFilms</a></li>
							    <% } %>                     
                                                       
                            </ul>
            </div>
        </div>
        <div class="col-lg-3">
            <p>
              This template is made with by HIFIVE
              </p>

          </div>
      </div>
  </div>
</footer>
<!-- Footer Section End -->
<!-- Search model Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch"><i class="icon_close"></i></div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>
<!-- Search model end -->

<!-- Js Plugins -->
<script src="data/js/jquery-3.3.1.min.js"></script>
<script src="data/js/bootstrap.min.js"></script>
<script src="data/js/player.js"></script>
<script src="data/js/jquery.nice-select.min.js"></script>
<script src="data/js/mixitup.min.js"></script>
<script src="data/js/jquery.slicknav.js"></script>
<script src="data/js/main.js"></script>
<script src="data/js/owl.carousel.min.js"></script>


</body>

</html>