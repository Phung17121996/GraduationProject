<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Home</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="/resources/images/icons/favicon.png"/>
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/webjars/bootstrap/3.3.7/css/bootstrap.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/webjars/font-awesome/4.7.0/css/font-awesome.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/fonts/themify/themify-icons.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/fonts/elegant-font/html-css/style.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/animate/animate.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/css-hamburgers/hamburgers.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/animsition/css/animsition.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/select2/select2.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/daterangepicker/daterangepicker.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/slick/slick.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/lightbox2/css/lightbox.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
	<!--===============================================================================================-->
</head>
<body class="animsition">

<!-- Header -->
<header class="header1">
	<!-- Header desktop -->
	<div class="container-menu-header">
		<div class="topbar">
			<div class="topbar-social">
				<a href="https://www.facebook.com/vanphung.it" class="topbar-social-item fa fa-facebook"></a>
				<a href="https://www.instagram.com/" class="topbar-social-item fa fa-instagram"></a>
				<a href="https://www.youtube.com/channel/UCH0aZyYuO_yWo_qc0DDormQ?view_as=subscriber" class="topbar-social-item fa fa-youtube-play"></a>
			</div>

			<span class="topbar-child1">
					Free shipping for standard order over $500
				</span>
			<div class="topbar-child2">
				<button type="button" class="btn btn-link" id="button_signup" onclick="window.location.href='register'">Sign up</button>
				<div class="dropdown" >
					<button class="btn btn-link dropdown-toggle" id="button_signin"
							type="button" data-toggle="dropdown" >Sign in
						<span class="caret"></span></button>
					<ul class="dropdown-menu dropdown-menu-right" id="login_menu">
						<li>
							<div class="row">
								<div class="col-md-12">
									<form class="form" role="form"
										  method="post" action="login" id="login-nav">
										<div class="form-group">
											<input type="email" class="form-control"
												   name="email" placeholder="Email address" id="email" required
												   style="margin-bottom: 10px">
											<input type="password" class="form-control"
												   name="password" placeholder="Password" id="password" required>
										</div>
										<div >
											<a href="https://www.facebook.com/dialog/oauth?client_id=705084929853943&redirect_uri=https://localhost:8081/login-facebook">Login Facebook</a>
										</div>
										<div class="form-group">
											<button type="submit" class="btn btn-success btn-block">Sign in
											</button>
										</div>
									</form>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="wrap_header">
			<!-- Logo -->
			<a href="index" class="logo">
				<img src="/resources/images/icons/logo.png" alt="IMG-LOGO">
			</a>

			<!-- Menu -->
			<div class="wrap_menu">
				<nav class="menu">
					<ul class="main_menu">
						<li>
							<a href="index">Home</a>
						</li>

						<li>
							<a href="product?categoryId=5">Shop</a>
						</li>

						<li>
							<a href="contact">Contact</a>
						</li>
					</ul>
				</nav>
			</div>

			<!-- Header Icon -->
			<div class="header-icons">
				<%--<a href="#" class="header-wrapicon1 dis-block">--%>
					<%--<img src="/resources/images/icons/icon-header-01.png" class="header-icon1" alt="ICON">--%>
				<%--</a>--%>

				<span class="linedivide1"></span>

				<div class="header-wrapicon2">
					<img src="/resources/images/icons/icon-header-02.png" class="header-icon1 js-show-header-dropdown" alt="ICON">
					<span class="header-icons-noti" id ="header-icons">${cartQuantity}</span>

					<!-- Header cart noti -->
					<div class="header-cart header-dropdown">
						<ul class="header-cart-wrapitem">
							<c:forEach items="${carts}" var="cart" >
								<li class="header-cart-item">
									<div class="header-cart-item-img">
										<img src="/resources/images/product/${cart.product.imageEntities[0].imageName}" alt="IMG">
									</div>

									<div class="header-cart-item-txt">
										<a href="product-detail?productId=${cart.product.id}" class="header-cart-item-name">
												${cart.product.productName}
										</a>

										<span class="header-cart-item-info">
												${cart.quantityProductCart} x $${cart.product.price}
											</span>
									</div>
								</li>
							</c:forEach>
						</ul>

						<div class="header-cart-total">
							Order Subtotal: <span style="color: red"><strong>$ ${orderSubtotal}</strong></span>
						</div>

						<div class="header-cart-buttons">
							<div class="header-cart-wrapbtn">
								<!-- Button -->
								<a href="viewCart" class="flex-c-m size1 bg1 bo-rad-20 hov1 s-text1 trans-0-4">
									View Cart
								</a>
							</div>

							<div class="header-cart-wrapbtn">
								<!-- Button -->
								<a href="checkout" class="flex-c-m size1 bg1 bo-rad-20 hov1 s-text1 trans-0-4">
									Check Out
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>

<!-- Slide1 -->
<%--<section class="slide1">--%>
	<%--<div class="wrap-slick1">--%>
		<%--<div class="slick1">--%>
			<%--<div class="item-slick1 item1-slick1" style="background-image: url(/resources/images/banner/${banners[0]});">--%>
				<%--<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">--%>
						<%--<span class="caption1-slide1 m-text1 t-center animated visible-false m-b-15" data-appear="fadeInDown">--%>
							<%--Collection 2018--%>
						<%--</span>--%>

					<%--<h2 class="caption2-slide1 xl-text1 t-center animated visible-false m-b-37" data-appear="fadeInUp">--%>
						<%--New arrivals--%>
					<%--</h2>--%>

					<%--<div class="wrap-btn-slide1 w-size1 animated visible-false" data-appear="zoomIn">--%>
						<%--<!-- Button -->--%>
						<%--<a href="product?categoryId=5" class="flex-c-m size2 bo-rad-23 s-text2 bgwhite hov1 trans-0-4">--%>
							<%--Shop Now--%>
						<%--</a>--%>
					<%--</div>--%>
				<%--</div>--%>
			<%--</div>--%>

			<%--<div class="item-slick1 item2-slick1" style="background-image: url(/resources/images/banner/${banners[1]});">--%>
				<%--<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">--%>
						<%--<span class="caption1-slide1 m-text1 t-center animated visible-false m-b-15" data-appear="rollIn">--%>
							<%--Collection 2018--%>
						<%--</span>--%>

					<%--<h2 class="caption2-slide1 xl-text1 t-center animated visible-false m-b-37" data-appear="lightSpeedIn">--%>
						<%--New arrivals--%>
					<%--</h2>--%>

					<%--<div class="wrap-btn-slide1 w-size1 animated visible-false" data-appear="slideInUp">--%>
						<%--<!-- Button -->--%>
						<%--<a href="product?categoryId=5" class="flex-c-m size2 bo-rad-23 s-text2 bgwhite hov1 trans-0-4">--%>
							<%--Shop Now--%>
						<%--</a>--%>
					<%--</div>--%>
				<%--</div>--%>
			<%--</div>--%>

			<%--<div class="item-slick1 item3-slick1" style="background-image: url(/resources/images/banner/${banners[2]});">--%>
				<%--<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">--%>
						<%--<span class="caption1-slide1 m-text1 t-center animated visible-false m-b-15" data-appear="rotateInDownLeft">--%>
							<%--Collection 2018--%>
						<%--</span>--%>

					<%--<h2 class="caption2-slide1 xl-text1 t-center animated visible-false m-b-37" data-appear="rotateInUpRight">--%>
						<%--New arrivals--%>
					<%--</h2>--%>

					<%--<div class="wrap-btn-slide1 w-size1 animated visible-false" data-appear="rotateIn">--%>
						<%--<!-- Button -->--%>
						<%--<a href="product?categoryId=5" class="flex-c-m size2 bo-rad-23 s-text2 bgwhite hov1 trans-0-4">--%>
							<%--Shop Now--%>
						<%--</a>--%>
					<%--</div>--%>
				<%--</div>--%>
			<%--</div>--%>

			<%--<div class="item-slick1 item3-slick1" style="background-image: url(/resources/images/banner/banner_6.jpg);">--%>
				<%--<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">--%>
						<%--<span class="caption1-slide1 m-text1 t-center animated visible-false m-b-15" data-appear="rotateInDownLeft">--%>
							<%--Collection 2018--%>
						<%--</span>--%>

					<%--<h2 class="caption2-slide1 xl-text1 t-center animated visible-false m-b-37" data-appear="rotateInUpRight">--%>
						<%--New arrivals--%>
					<%--</h2>--%>

					<%--<div class="wrap-btn-slide1 w-size1 animated visible-false" data-appear="rotateIn">--%>
						<%--<!-- Button -->--%>
						<%--<a href="product?categoryId=5" class="flex-c-m size2 bo-rad-23 s-text2 bgwhite hov1 trans-0-4">--%>
							<%--Shop Now--%>
						<%--</a>--%>
					<%--</div>--%>
				<%--</div>--%>
			<%--</div>--%>

		<%--</div>--%>
	<%--</div>--%>
<%--</section>--%>

<div class="container-fluid">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
				<div class="item active">
					<img src="/resources/images/banner/${banners[0].bannerName}" style="width:100%;"/>
					<div class="carousel-caption">
						<p>
							<a href="product?categoryId=5" style="color: white;font-size: 35px;">
								<strong>Collection 2018</strong></a></p>
						<p >
							<a href="product?categoryId=5"
							   style="color: white; margin-top: 10px; text-decoration: none; font-size: 25px;">
								<strong>New arrivals</strong></a>
						</p>
						<button class="btn btn-default btn-lg" onclick="window.location.href='product?categoryId=5'"
								style="margin-bottom: 40%; margin-top: 7px;"><strong>Shop now</strong></button>
					</div>
				</div>

			<div class="item">
				<img src="/resources/images/banner/${banners[1].bannerName}"/>
				<div class="carousel-caption" >
					<p>
						<a href="product?categoryId=5" style="color: white;font-size: 35px;">
							<strong>Collection 2018</strong></a></p>
					<p >
						<a href="product?categoryId=5"
						   style="color: white; margin-top: 10px; text-decoration: none; font-size: 25px;">
							<strong>New arrivals</strong></a>
					</p>
					<button class="btn btn-default btn-lg" onclick="window.location.href='product?categoryId=5'"
							style="margin-bottom: 40%; margin-top: 7px;"><strong>Shop now</strong></button>
				</div>
			</div>
			<div class="item">
				<img src="/resources/images/banner/${banners[2].bannerName}"/>
				<div class="carousel-caption" >
					<p>
						<a href="product?categoryId=5" style="color: white;font-size: 35px;">
							<strong>Collection 2018</strong></a></p>
					<p >
						<a href="product?categoryId=5"
						   style="color: white; margin-top: 10px; text-decoration: none; font-size: 25px;">
							<strong>New arrivals</strong></a>
					</p>
					<button class="btn btn-default btn-lg" onclick="window.location.href='product?categoryId=5'"
							style="margin-bottom: 40%; margin-top: 7px;"><strong>Shop now</strong></button>
				</div>
			</div>
			<div class="item">
				<img src="/resources/images/banner/${banners[3].bannerName}"/>
				<div class="carousel-caption" >
					<p>
						<a href="product?categoryId=5" style="color: white;font-size: 35px;">
							<strong>Collection 2018</strong></a></p>
					<p >
						<a href="product?categoryId=5"
						   style="color: white; margin-top: 10px; text-decoration: none; font-size: 25px;">
							<strong>New arrivals</strong></a>
					</p>
					<button class="btn btn-default btn-lg" onclick="window.location.href='product?categoryId=5'"
							style="margin-bottom: 39%; margin-top: 7px;"><strong>Shop now</strong></button>
				</div>
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
</div>

<!-- Banner -->
<section class="banner bgwhite p-t-40 p-b-40">
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-md-8 col-lg-4 m-l-r-auto">
				<!-- block1 -->
				<div class="block1 hov-img-zoom pos-relative m-b-30">
					<img src="/resources/images/category/banner_shirt.jpg" alt="IMG-BENNER">

					<div class="block1-wrapbtn w-size2">
						<!-- Button -->
						<a href="product?categoryId=1" class="flex-c-m size2 m-text2 bg3 hov1 trans-0-4">
							Shirts
						</a>
					</div>
				</div>

				<!-- block1 -->
				<div class="block1 hov-img-zoom pos-relative m-b-30">
					<img src="/resources/images/category/banner_jeans.jpg" alt="IMG-BENNER">

					<div class="block1-wrapbtn w-size2">
						<!-- Button -->
						<a href="product?categoryId=2" class="flex-c-m size2 m-text2 bg3 hov1 trans-0-4">
							Jeans
						</a>
					</div>
				</div>
			</div>

			<div class="col-sm-10 col-md-8 col-lg-4 m-l-r-auto">
				<!-- block1 -->
				<div class="block1 hov-img-zoom pos-relative m-b-30">
					<img src="/resources/images/category/banner_jacket.jpg" alt="IMG-BENNER">

					<div class="block1-wrapbtn w-size2">
						<!-- Button -->
						<a href="product?categoryId=3" class="flex-c-m size2 m-text2 bg3 hov1 trans-0-4">
							Jackets
						</a>
					</div>
				</div>

				<!-- block1 -->
				<div class="block1 hov-img-zoom pos-relative m-b-30">
					<img src="/resources/images/category/banner_hoodie.jpg" alt="IMG-BENNER">

					<div class="block1-wrapbtn w-size2">
						<!-- Button -->
						<a href="product?categoryId=4" class="flex-c-m size2 m-text2 bg3 hov1 trans-0-4">
							Hoodies
						</a>
					</div>
				</div>
			</div>

			<div class="col-sm-10 col-md-8 col-lg-4 m-l-r-auto">
				<!-- block1 -->
				<div class="block1 hov-img-zoom pos-relative m-b-30">
					<img src="/resources/images/category/banner_all.jpg" alt="IMG-BENNER">

					<div class="block1-wrapbtn w-size2">
						<!-- Button -->
						<a href="product?categoryId=5" class="flex-c-m size2 m-text2 bg3 hov1 trans-0-4">
							All
						</a>
					</div>
				</div>

				<!-- block2 -->
				<div class="block2 wrap-pic-w pos-relative m-b-30">
					<img src="/resources/images/icons/bg-01.jpg" alt="IMG"
						 style="height: 340px;">

					<div class="block2-content sizefull ab-t-l flex-col-c-m">
						<h4 class="m-text4 t-center w-size3 p-b-8">
							Sign up & get 20% off
						</h4>

						<p class="t-center w-size4">
							Be the first to know about the latest fashion news and get exclu-sive offers
						</p>

						<div class="w-size2 p-t-25">
							<!-- Button -->
							<c:if test="${user == null}">
								<a href="register" class="flex-c-m size2 bg4 bo-rad-23 hov1 m-text3 trans-0-4">
									Sign Up
								</a>
							</c:if>
							<c:if test="${user != null}">
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Hot Product -->
<section class="newproduct bgwhite p-t-45 p-b-105">
	<div class="container">
		<div class="sec-title p-b-60">
			<h3 class="m-text5 t-center">
				Featured Products
			</h3>
		</div>

		<!-- Slide2 -->
		<div class="wrap-slick2">
			<div class="slick2">
			<c:forEach items="${products}" var="product">
				<div class="item-slick2 p-l-15 p-r-15">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-img wrap-pic-w of-hidden pos-relative block2-labelhot ">
							<img src="/resources/images/product/${product.imageEntities[0].imageName}" alt="IMG-PRODUCT"
								 style="size: 720px; height: 351px;">

							<div class="block2-overlay trans-0-4">
								<a  class="block2-btn-addwishlist hov-pointer trans-0-4">
									<i class="icon-wishlist icon_heart_alt" aria-hidden="true"></i>
									<i class="icon-wishlist icon_heart dis-none" aria-hidden="true"></i>
								</a>

								<div class="block2-btn-addcart w-size1 trans-0-4">
									<!-- Button -->
									<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4" onclick="window.location.href='product-detail?productId=${product.id}'">
										Detail
									</button>
								</div>
							</div>
						</div>

                        <a hidden id="product_id">${product.id}</a>

                        <c:if test="${product.productQuantityEntity.quantity != 0}">
						<div class="block2-txt p-t-20">
							<a href="product-detail?productId=${product.id}" class="block2-name dis-block s-text3 p-b-5">
									${product.productName}
							</a>


							<span class="block2-price m-text6 p-r-5" style="color: red">
								<strong> $${product.price}</strong>
								</span>
						</div>
                        </c:if>
                        <c:if test="${product.productQuantityEntity.quantity == 0}">
                            <div class="block2-txt p-t-20">
                                <a href="product-detail?productId=${product.id}" class="block2-name dis-block s-text3 p-b-5">
                                        ${product.productName}
                                </a>

                                <span class="block2-price m-text6 p-r-5" style="color: red">
                                    <strong> <del> $${product.price}</del></strong>
                                    <span class="label label-danger">Sold out</span>
								</span>
                            </div>
                        </c:if>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>

	</div>
</section>

<!-- Banner2 -->
<section class="banner2 bg5 p-t-55 p-b-55">

</section>

<!-- Shipping -->
<section class="shipping bgwhite p-t-62 p-b-46">
	<div class="flex-w p-l-15 p-r-15">
		<div class="flex-col-c w-size5 p-l-15 p-r-15 p-t-16 p-b-15 respon1">
			<h4 class="m-text12 t-center">
				Delivery Worldwide
			</h4>

		</div>

		<div class="flex-col-c w-size5 p-l-15 p-r-15 p-t-16 p-b-15 bo2 respon2">
			<h4 class="m-text12 t-center">
				30 Days Return
			</h4>

			<span class="s-text11 t-center">
					Simply return it within 30 days for an exchange.
				</span>
		</div>

		<div class="flex-col-c w-size5 p-l-15 p-r-15 p-t-16 p-b-15 respon1">
			<h4 class="m-text12 t-center">
				Store Opening
			</h4>

			<span class="s-text11 t-center">
					Shop open from Monday to Sunday
				</span>
		</div>
	</div>
</section>


<!-- Footer -->
<footer class="bg6 p-t-45 p-b-43 p-l-45 p-r-45" >
	<div class="flex-w p-b-90" style="margin-left: 400px;">
		<div class="w-size6 p-t-30 p-l-15 p-r-15 respon3">
			<h4 class="s-text12 p-b-30">
				GET IN TOUCH
			</h4>

			<div>
				<p class="s-text7 w-size27">
                    Any questions? Let us know in store at 54 Nguyen Luong Bang, Da Nang or call us on (+84) 38 245 1973
				</p>

				<div class="flex-m p-t-30">
					<a href="https://www.facebook.com/vanphung.it" class="fs-18 color1 p-r-20 fa fa-facebook"></a>
					<a href="https://www.instagram.com/" class="fs-18 color1 p-r-20 fa fa-instagram"></a>
					<a href="https://www.youtube.com/channel/UCH0aZyYuO_yWo_qc0DDormQ?view_as=subscriber" class="fs-18 color1 p-r-20 fa fa-youtube-play"></a>
				</div>
			</div>
		</div>

		<div class="w-size7 p-t-30 p-l-15 p-r-15 respon4">
			<h4 class="s-text12 p-b-30">
				Categories
			</h4>

			<ul>
				<li class="p-b-9">
					<a href="product?categoryId=1" class="s-text7">
						Shirt
					</a>
				</li>

				<li class="p-b-9">
					<a href="product?categoryId=2" class="s-text7">
						Jeans
					</a>
				</li>

				<li class="p-b-9">
					<a href="product?categoryId=3" class="s-text7">
						Jacket
					</a>
				</li>

				<li class="p-b-9">
					<a href="product?categoryId=4" class="s-text7">
						Hoodie
					</a>
				</li>
			</ul>
		</div>

		<div class="w-size7 p-t-30 p-l-15 p-r-15 respon4">
			<h4 class="s-text12 p-b-30">
				Links
			</h4>

			<ul>
				<li class="p-b-9">
					<a href="contact" class="s-text7">
						Contact Us
					</a>
				</li>
			</ul>
		</div>
	</div>


</footer>



<!-- Back to top -->
<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
</div>

<!-- Container Selection1 -->
<div id="dropDownSelect1"></div>



<!--===============================================================================================-->
<script type="text/javascript" src="/webjars/jquery/3.2.1/jquery.min.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="/resources/vendor/bootstrap/js/popper.js"></script>
<script type="text/javascript" src="/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="/resources/vendor/select2/select2.min.js"></script>
<script type="text/javascript">
    $('.block2-btn-addwishlist').each(function () {
        var productId = $(this).parent().parent().parent().find('#product_id').html();
        $(this).on('click', function () {
            $.ajax({
                type: "POST",
                url: "favourite?productId=" + productId,
                timeout: 100000,
                success: function (data) {
                }
            });
        });
    });
    $(".selection-1").select2({
        minimumResultsForSearch: 20,
        dropdownParent: $('#dropDownSelect1')
    });
</script>
<!--===============================================================================================-->
<script type="text/javascript" src="/resources/vendor/slick/slick.min.js"></script>
<script type="text/javascript" src="/resources/js/slick-custom.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="/resources/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="/resources/vendor/lightbox2/js/lightbox.min.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="/resources/vendor/sweetalert/sweetalert.min.js"></script>

<script src="/resources/js/ajax.js"></script>
<script src="/resources/js/ajaxSession.js"></script>
<!--===============================================================================================-->
<script src="/resources/js/main.js"></script>

</body>
</html>
