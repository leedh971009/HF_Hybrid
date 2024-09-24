
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" href="data/img/data/movie.png">
    <title>HighFive</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="data/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="data/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="data/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="data/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="data/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="data/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="data/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="data/css/style.css" type="text/css">
</head>

<body>
<% 
    // 세션에서 사용자 역할을 가져옴
    String userId = (String) session.getAttribute("userId");
    String userRole = (String) session.getAttribute("role");
%>

<style>
.header__right {
    display: flex;
    align-items: center; /* 수직 가운데 정렬 */
}

.header__right a {
    display: flex; /* 아이콘과 텍스트를 가로로 정렬 */
    align-items: center; /* 아이콘과 텍스트를 수직 가운데 정렬 */
    margin-left: 10px; /* 링크 간 간격 */
    text-decoration: none; /* 밑줄 제거 */
    color: #fff; /* 텍스트 색상 */
    padding: 5px; /* 내부 여백 */
    position: relative; /* 가상 요소에 대한 위치 설정 */
}

.header__right a span {
    display: flex; /* 아이콘도 flex로 설정 */
    align-items: center; /* 아이콘을 수직 가운데 정렬 */
    margin-right: 5px; /* 아이콘과 텍스트 사이 간격 */
}

.header__right a:hover {
    color: #ccc; /* 마우스 오버 시 색상 변경 */
}

.header__right a::after {
    content: ''; /* 가상 요소 생성 */
    position: absolute; /* 부모 요소를 기준으로 절대 위치 설정 */
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    border: 2px solid red; /* 빨간 테두리 */
    opacity: 0; /* 초기에는 투명 */
    transition: opacity 0.3s; /* 투명도 애니메이션 추가 */
    z-index: -1; /* 텍스트 뒤에 배치 */
}

.header__right a:hover::after {
    opacity: 1; /* 마우스 오버 시 불투명하게 설정 */
}



</style>

<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Header Section Begin -->
<header class="header" style="height: 64px;">
    <div class="container">
        <div class="row">
            <div class="col-lg-2">
                <div class="header__logo">
                    <div class="header__nav">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li class="active"><a href="./index.jsp"><span class="icon_like"></span>&ensp;High Five</a></li>
                        </ul>
                    </nav>
                </div>
                </div>
            </div>
           <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li class="<%= request.getRequestURI().equals("/index.jsp") ? "active" : "" %>"><a href="./index.jsp">HomePage</a></li>
                                <li class="<%= request.getRequestURI().equals("/films.jsp") ? "active" : "" %>"><a href="./films.jsp">Films</a></li>                          
                                <li class="<%= request.getRequestURI().equals("/snack.jsp") ? "active" : "" %>"> <a href="./snack.jsp" >Snack</a></li>
								<li class="<%= request.getRequestURI().equals("/month.jsp") ? "active" : "" %>"><a href="./month.jsp">Monthly Films</a></li>
                                 <% if (session.getAttribute("userId") != null && "admin".equals(userRole)) { %> <!-- admin 역할일 때만 보이도록 조건 추가 -->
							        <li class="<%= request.getRequestURI().equals("/lastFilms.jsp") ? "active" : "" %>"><a href="lastFilms.jsp">LastFilms</a></li>
							        <li class="<%= request.getRequestURI().equals("/userInfo.jsp") ? "active" : "" %>"><a href="userInfo.jsp">User Info</a></li>
							    <% } %>                     
<%-- <li>    <%= session.getAttribute("userId") %></li> --%>			    
<%-- <li><%= request.getRequestURI()%></li> --%>
							    
							    
							    
                            </ul>
                        </nav>
                    </div>
                </div>

             
               <div class="col-lg-2">
				    <div class="header__right" >
				        <% if (session.getAttribute("userId") != null) { %>
				            <a href="" style="color: red; margin-top: -8px;"><%=session.getAttribute("userId") %></a>
				            <a href="login.jsp?action=logout" style="margin-top: -8px;"><span class="arrow_right_alt"></span> Logout</a> 
				            <a href="mypage.jsp" style="margin-top: -8px;"><span class="icon_profile"></span> Mypage</a>  
				        <% } else { %>
				            <a href="./join.jsp" style="margin-top: -8px;"><span class="arrow_right_alt"></span> Join</a>
				            <a href="./login.jsp" style="margin-top: -8px;"><span class="icon_profile"></span> Login</a>
				        <% } %>
				    </div>
        	</div>
               
        <div id="mobile-menu-wrap"></div>
    </div>
</header>
<!-- Header End -->