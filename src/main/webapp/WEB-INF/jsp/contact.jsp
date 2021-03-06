<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Contact</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
	<link rel="stylesheet" type="text/css" href="/resources/vendor/slick/slick.css">
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
												   name="email" id="email" placeholder="Email address" required
												   style="margin-bottom: 10px">
											<input type="password" class="form-control"
												   name="password" id="password" placeholder="Password" required>
										</div>
										<div >
											<label style="margin-left: 1em;color: #003eff">
												<a href="/reset_password">Forgot Your Password??</a>
											</label>
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
					<span class="header-icons-noti">${cartQuantity}</span>

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

<!-- Title Page -->
<section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(/resources/images/category/banner_heading.png);">
	<h2 class="l-text2 t-center">
		Contact
	</h2>
</section>

<!-- content page -->
<section class="bgwhite p-t-66 p-b-60">
	<div class="container">
		<div class="row">
			<div class="col-md-6 p-b-30">
				<div class="p-r-20 p-r-0-lg">
					<%--<div class="contact-map size21" id="google_map" data-map-x="16.089344" data-map-y="108.218952" data-pin="/resources/images/icons/icon-position-map.png" data-scrollwhell="0" data-draggable="1"></div>--%>
					<div class="contact-map size21" >
						<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4559.227852349865!2d108.14823909751185!3d16.073875693609192!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314218d68e8ccb03%3A0x64dc2cb3e38bbdaf!2zNTQgTmd1eeG7hW4gTMawxqFuZyBC4bqxbmcsIEhvw6AgS2jDoW5oIELhuq9jLCBMacOqbiBDaGnhu4N1LCDEkMOgIE7hurVuZyA1NTAwMDAsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1542814754120" width="550" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
					</div>
				</div>
			</div>

			<div class="col-md-6 p-b-30">
				<form class="leave-comment"  action="message" method="post">
					<h4 class="m-tetopbarxt26 p-b-36 p-t-15">
						Send us your message
					</h4>
					<span style="color: #138496;font-size: medium">${notify}</span><br>

					<div class="bo4 of-hidden size15 m-b-20">
						<input class="sizefull s-text7 p-l-22 p-r-22"  type="email" name="email" value="${user.email}" placeholder="Email Address" required>
					</div>
					<textarea class="dis-block s-text7 size20 bo4 p-l-22 p-r-22 p-t-13 m-b-20" id="content" name="content" placeholder="Message"></textarea>

					<div class="w-size25">
						<!-- Button -->
						<button type="submit" class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
							Send
						</button>
					</div>
				</form>
			</div>
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

	<%--<div class="t-center p-l-15 p-r-15">--%>
	<%--<a href="#">--%>
	<%--<img class="h-size2" src="/resources/images/icons/paypal.png" alt="IMG-PAYPAL">--%>
	<%--</a>--%>

	<%--<a href="#">--%>
	<%--<img class="h-size2" src="/resources/images/icons/visa.png" alt="IMG-VISA">--%>
	<%--</a>--%>

	<%--<a href="#">--%>
	<%--<img class="h-size2" src="/resources/images/icons/mastercard.png" alt="IMG-MASTERCARD">--%>
	<%--</a>--%>

	<%--<a href="#">--%>
	<%--<img class="h-size2" src="/resources/images/icons/express.png" alt="IMG-EXPRESS">--%>
	<%--</a>--%>

	<%--<a href="#">--%>
	<%--<img class="h-size2" src="/resources/images/icons/discover.png" alt="IMG-DISCOVER">--%>
	<%--</a>--%>

	<%--<div class="t-center s-text8 p-t-20">--%>
	<%--Copyright © 2018 All rights reserved.--%>
	<%--</div>--%>
	<%--</div>--%>
</footer>



<!-- Back to top -->
<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
</div>

<!-- Container Selection -->
<div id="dropDownSelect1"></div>
<div id="dropDownSelect2"></div>



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
    $(".selection-1").select2({
        minimumResultsForSearch: 20,
        dropdownParent: $('#dropDownSelect1')
    });

    $(".selection-2").select2({
        minimumResultsForSearch: 20,
        dropdownParent: $('#dropDownSelect2')
    });
</script>
<!--===============================================================================================-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
<script src="/resources/js/map-custom.js"></script>
<!--===============================================================================================-->
<script src="/resources/js/main.js"></script>
<script src="/resources/js/ajax.js"></script>
<script src="/resources/js/ajaxSession.js"></script>

</body>
</html>
