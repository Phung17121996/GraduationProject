<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Product Detail</title>
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

<!-- breadcrumb -->


<!-- Product Detail -->

<div class="container bgwhite p-t-35 p-b-80">
	<div class="flex-w flex-sb">
		<div class="w-size13 p-t-30 respon5">
			<div class="wrap-slick3 flex-sb flex-w">
				<div class="wrap-slick3-dots"></div>

				<div class="slick3">
					<c:forEach items="${product.imageEntities}" var="entity">
						<div class="item-slick3" data-thumb="/resources/images/product/${entity.imageName}">
							<div class="wrap-pic-w">
								<img src="/resources/images/product/${entity.imageName}" alt="IMG-PRODUCT">
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

		<div class="w-size14 p-t-30 respon5">
			<h4 class="product-detail-name m-text16 p-b-13">
				${product.productName}
			</h4>

			<c:if test="${product.productQuantityEntity.quantity == 0 }">
				<span style="color: #bd2130">NOTE: This product is currently out of stock. We sincerely apologize for this inconvenience. </span>
			</c:if>
			<br>
			<span class="m-text17" style="color: red">
				<strong> $ ${product.price}</strong>
				</span>

			<p class="s-text8 p-t-10">
				${product.description}<br>
			</p>

			<!--  -->
			<div class="p-t-33 p-b-60">
				<form action="addToCart" method="post">
					<input type="hidden" value="${product.id}" id="productId" name="productId">
				<div class="flex-m flex-w p-b-10">
					<div class="s-text15 w-size15 t-center">
						Size
					</div>

					<div class="rs2-select2 rs3-select2 bo4 of-hidden w-size16">
						<select class="selection-2" name="size" id="size">
							<c:forEach items="${sizeEntities}" var="size">
								<option>${size.sizeName}</option>
							</c:forEach>
						</select>
					</div>
				</div>

				<div class="flex-r-m flex-w p-t-10">
					<div class="w-size16 flex-m flex-w">
                        <c:if test="${product.productQuantityEntity.quantity != 0 }">
                            <div class="btn-addcart-product-detail size9 trans-0-4 m-t-10 m-b-10">
                                <!-- Button -->
                                <button  type="submit" class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4" >
                                    Add to Cart
                                </button>
                            </div>
                        </c:if>
					</div>
				</div>
				</form>
			</div>

			<p style="font-size: small">YOU MIGHT ALSO LIKE...</p>

			<%--Recommend product--%>
			<div class="row">
				<c:forEach items="${recommendProducts}" var="recommendProduct">
					<div class="col-md-4">
						<div class="thumbnail">
							<a href="product-detail?productId=${recommendProduct.id}">
								<img src="/resources/images/product/${recommendProduct.imageEntities[0].imageName}" alt="Lights" style="width:10em">
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
			<span class="s-text8">Categories: <a href = product?categoryId=${product.categoryEntity.id}  class="label label-default" style="color: white" >${product.categoryEntity.categoryName}</a></span>
		</div>
	</div>
</div>



<!-- Related Hot Product -->
<section class="relateproduct bgwhite p-t-45 p-b-138">
	<div class="container">
		<div class="sec-title p-b-60">
			<h3 class="m-text5 t-center">
				Related Hot Products
			</h3>
		</div>

		<!-- Slide2 -->
		<div class="wrap-slick2">
			<div class="slick2">
				<c:forEach items="${hotProducts}" var="product">
				<div class="item-slick2 p-l-15 p-r-15">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-img wrap-pic-w of-hidden pos-relative block2-labelhot ">
							<img src="/resources/images/product/${product.imageEntities[0].imageName}" alt="IMG-PRODUCT">

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

							<span style="color: red;font-size: medium" class="block2-price m-text6 p-r-5">
									$${product.price}
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

    // Ajax favourite
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
</script>
<!--===============================================================================================-->
<script type="text/javascript" src="/resources/vendor/slick/slick.min.js"></script>
<script type="text/javascript" src="/resources/js/slick-custom.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="/resources/vendor/sweetalert/sweetalert.min.js"></script>

<script src="/resources/js/ajax.js"></script>
<script src="/resources/js/ajaxSession.js"></script>
<!--===============================================================================================-->
<script src="/resources/js/main.js"></script>

</body>
</html>
