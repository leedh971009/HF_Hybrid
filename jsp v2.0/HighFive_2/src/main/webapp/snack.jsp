<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>


<jsp:include page="/data/common/header.jsp" />




    <!-- Normal Breadcrumb Begin -->
    <section class="normal-breadcrumb set-bg" data-setbg="data/img/ott.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>Snack</h2>
                        <p>
                            Movie snacks like popcorn and candy enhance the cinema experience.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->

<!-- Product Section Begin -->
<section class="product-page spad" style="display: flex; justify-content: center; align-items: center; height: 100vh; margin-top: 80px;">
    <div class="col-lg-8" style="display: flex; flex-direction: column; align-items: center;">
        <div class="product__page__content">
            <div class="product__page__title">
                <div class="row" style="width: 100%;">
                    <div class="col-lg-8 col-md-8 col-sm-6">
                        <div class="section-title">
                            <h4>CGV</h4>
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
            <div class="row" style="width: 100%; justify-content: center;">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="data/img/snack/set1.jpg">
                            <div class="ep">11000₩</div>
                        </div>
                        <div class="product__item__text">
                            <h5><a href="#">CGV COMBO 1</a></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="data/img/snack/set2.jpg">
                            <div class="ep">25000₩</div>
                        </div>
                        <div class="product__item__text">

                            <h5><a href="#">CGV COMBO 2</a></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="data/img/snack/hot.jpg">
                            <div class="ep">5000₩</div>
                        </div>
                        <div class="product__item__text">
                            <h5><a href="#">Chili Cheese Hot Dog</a></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="data/img/snack/snack.jpg">
                            <div class="ep">5500₩</div>
                        </div>
                        <div class="product__item__text">
                            <h5><a href="#">Chili Cheese Nachos</a></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="data/img/snack/ade.jpg">
                            <div class="ep">5500₩</div>
                        </div>
                        <div class="product__item__text">
                            <h5><a href="#">Select Aid Drink</a></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="data/img/snack/cola.jpg">
                            <div class="ep">FREE</div>
                        </div>
                        <div class="product__item__text">
                            <h5><a href="#">Carbonated drink cola</a></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>                
    </div>
</section>
<!-- Product Section End -->

<!-- Product Section Begin -->
<section class="product-page spad" style="display: flex; justify-content: center; align-items: center; height: 100vh; margin-top: 80px;">
    <div class="col-lg-8" style="display: flex; flex-direction: column; align-items: center;">
        <div class="product__page__content">
            <div class="product__page__title">
                <div class="row" style="width: 100%;">
                    <div class="col-lg-8 col-md-8 col-sm-6">
                        <div class="section-title">
                            <h4>LOTTE CINEMA</h4>
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
            <div class="row" style="width: 100%; justify-content: center;">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="data/img/snack3/1.png">
                            <div class="ep">15000₩</div>
                        </div>
                        <div class="product__item__text">
                            <h5><a href="#">Double Set</a></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="data/img/snack3/2.png">
                            <div class="ep">11000₩</div>
                        </div>
                        <div class="product__item__text">

                            <h5><a href="#">Couple Set &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="data/img/snack3/3.jpg">
                            <div class="ep">7000₩</div>
                        </div>
                        <div class="product__item__text">
                            <h5><a href="#">Half Popcorn &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="data/img/snack3/4.png">
                            <div class="ep">6000₩</div>
                        </div>
                        <div class="product__item__text">
                            <h5><a href="#">Consomme Popcorn</a></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="data/img/snack3/5.png">
                            <div class="ep">7000₩</div>
                        </div>
                        <div class="product__item__text">
                            <h5><a href="#">Caramel Popcorn</a></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="data/img/snack3/6.png">
                            <div class="ep">FREE</div>
                        </div>
                        <div class="product__item__text">
                            <h5><a href="#">Coca Cola</a></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>                
    </div>
</section>
<!-- Product Section End -->

<!-- Product Section Begin -->
<section class="product-page spad" style="display: flex; justify-content: center; align-items: center; height: 100vh; margin-top: 80px;">
    <div class="col-lg-8" style="display: flex; flex-direction: column; align-items: center;">
        <div class="product__page__content">
            <div class="product__page__title">
                <div class="row" style="width: 100%;">
                    <div class="col-lg-8 col-md-8 col-sm-6">
                        <div class="section-title">
                            <h4>MEGABOX</h4>
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
            <div class="row" style="width: 100%; justify-content: center;">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="data/img/snack2/1.png">
                            <div class="ep">45000₩</div>
                        </div>
                        <div class="product__item__text">
                            <h5><a href="#">Family Set</a></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="data/img/snack2/2.png">
                            <div class="ep">8900₩</div>
                        </div>
                        <div class="product__item__text">

                            <h5><a href="#">Fried Squid Set &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="data/img/snack2/3.png">
                            <div class="ep">9900₩</div>
                        </div>
                        <div class="product__item__text">
                            <h5><a href="#">Love Combo &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="data/img/snack2/4.png">
                            <div class="ep">12900₩</div>
                        </div>
                        <div class="product__item__text">
                            <h5><a href="#">Double Combo</a></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="data/img/snack2/5.png">
                            <div class="ep">FREE</div>
                        </div>
                        <div class="product__item__text">
                            <h5><a href="#">Dried pollack snack</a></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="data/img/snack2/6.png">
                            <div class="ep">6900₩</div>
                        </div>
                        <div class="product__item__text">
                            <h5><a href="#">Fried Squid snack</a></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>                
    </div>
</section>
<!-- Product Section End -->



<br><br>
<jsp:include page="/data/common/footer.jsp" />