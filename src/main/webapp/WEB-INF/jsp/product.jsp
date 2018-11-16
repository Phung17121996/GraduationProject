<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Product</title>
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
	<link rel="stylesheet" type="text/css" href="/resources/vendor/noui/nouislider.min.css">
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
				<a href="https://www.facebook.com/tribute.to.chester" class="fs-18 color1 p-r-20 fa fa-facebook"></a>
				<a href="https://www.instagram.com/matxe__/" class="fs-18 color1 p-r-20 fa fa-instagram"></a>
				<a href="#" class="topbar-social-item fa fa-pinterest-p"></a>
				<a href="#" class="topbar-social-item fa fa-snapchat-ghost"></a>
				<a href="#" class="topbar-social-item fa fa-youtube-play"></a>
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
												   name="email"  id="email" placeholder="Email address" required
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
							<a href="about">About</a>
						</li>

						<li>
							<a href="contact">Contact</a>
						</li>
					</ul>
				</nav>
			</div>

			<!-- Header Icon -->
			<div class="header-icons">

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
<section class="bg-title-page p-t-50 p-b-40 flex-col-c-m" style="background-image: url(/resources/images/category/banner_heading.png);">
	<h2 class="l-text2 t-center">
		MEN
	</h2>
	<p class="m-text13 t-center">
		New Arrivals Men Collection 2018
	</p>
</section>


<!-- Content page -->
<section class="bgwhite p-t-55 p-b-65">
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
				<div class="leftbar p-r-20 p-r-0-sm">
					<!--  -->
					<h4 class="m-text14 p-b-7">
						Categories
					</h4>

					<ul class="p-b-54">
						<li class="p-t-4">
							<a href="product?categoryId=5" class="s-text13 active">
								All
							</a>
						</li>

						<li class="p-t-4">
							<a href="product?categoryId=1" class="s-text13 active" >
								Shirts
							</a>
						</li>

						<li class="p-t-4">
							<a href="product?categoryId=2" class="s-text13 active">
								Jeans
							</a>
						</li>

						<li class="p-t-4">
							<a href="product?categoryId=3" class="s-text13 active">
								Jacket
							</a>
						</li>

						<li class="p-t-4">
							<a href="product?categoryId=4" class="s-text13 active">
								Hoodie
							</a>
						</li>
					</ul>

					<!--  -->

				</div>
			</div>

			<div class="col-sm-6 col-md-8 col-lg-9 p-b-50">
				<!--  -->
				<div class="flex-sb-m flex-w p-b-35">
					<div class="flex-w">

							<div class="dropdown">
								<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Sort
									<span class="caret"></span></button>
								<ul class="dropdown-menu">
									<li><a href="/sortLow?categoryId=${categoryId}">Price: Low to High</a></li>
									<li><a href="/sortHigh?categoryId=${categoryId}">Price: High to Low</a></li>
									<li><a href="/sortView?categoryId=${categoryId}">Highest View</a></li>
								</ul>
							</div>

					</div>
					<div class="search-product pos-relative bo4 of-hidden">
						<form action="searchProduct" method="post">
						<input class="s-text7 size6 p-l-23 p-r-50" type="text" name="productName" placeholder="Search Products...">

						<button type="submit" class="flex-c-m size5 ab-r-m color2 color0-hov trans-0-4">
							<i class="fs-12 fa fa-search" aria-hidden="true"></i>
						</button>
						</form>
					</div>
				</div>

				<!-- Product -->
				<div class="row" id="product_grid">
					<c:forEach var="product" items="${products}">
					<div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
						<!-- Block2 -->

						<div class="block2">
							<c:if test="${product.productQuantityEntity.quantity == 0 }">
								<div class="block2-img wrap-pic-w of-hidden pos-relative block2-labelsoldout">
									<img src="/resources/images/product/${product.imageEntities.get(0).imageName}" alt="IMG-PRODUCT"
										 style="size: 720px; height: 351px;" \>
									<div class="block2-overlay trans-0-4">
										<a  class="block2-btn-addwishlist hov-pointer trans-0-4" onclick="favourite(${product.id})">
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
							</c:if>
							<c:if test="${product.productQuantityEntity.quantity != 0}">
							<div class="block2-img wrap-pic-w of-hidden pos-relative " >
								<img src="/resources/images/product/${product.imageEntities.get(0).imageName}" alt="IMG-PRODUCT"
									 style="size: 720px; height: 351px;" \>
								<div class="block2-overlay trans-0-4">
									<a  class="block2-btn-addwishlist hov-pointer trans-0-4" onclick="favourite(${product.id})">
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
						</c:if>
							<div class="block2-txt p-t-20">
								<a href="product-detail?productId=${product.id}" class="block2-name dis-block s-text3 p-b-5">
										${product.productName}
								</a>
								<span style="color: red;font-size: medium" class="block2-price m-text6 p-r-5">
									<strong> $ ${product.price}</strong>
								</span>
							</div>
						</div>

					</div>
					</c:forEach>


			</div>

				<nav aria-label="Page navigation">
					<ul class="pagination" id="pagination"></ul>
				</nav>
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
					Any questions? Let us know in store at 49 Dinh Cong Trang, Thuan Phuoc Zone or call us on (+86) 96 716 0352
				</p>

				<div class="flex-m p-t-30">
					<a href="https://www.facebook.com/tribute.to.chester" class="fs-18 color1 p-r-20 fa fa-facebook"></a>
					<a href="https://www.instagram.com/matxe__/" class="fs-18 color1 p-r-20 fa fa-instagram"></a>
					<a href="#" class="fs-18 color1 p-r-20 fa fa-pinterest-p"></a>
					<a href="#" class="fs-18 color1 p-r-20 fa fa-snapchat-ghost"></a>
					<a href="#" class="fs-18 color1 p-r-20 fa fa-youtube-play"></a>
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
					<a href="about" class="s-text7">
						About Us
					</a>
				</li>

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

<!--===============================================================================================-->
<script type="text/javascript" src="/resources/vendor/daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="/resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="/resources/vendor/slick/slick.min.js"></script>
<script type="text/javascript" src="/resources/js/slick-custom.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="/resources/vendor/sweetalert/sweetalert.min.js"></script>


<!--===============================================================================================-->
<script type="text/javascript" src="/resources/vendor/noui/nouislider.min.js"></script>
<script type="text/javascript">

    // Ajax favourite
    function favourite (productId) {
       	$.ajax({
       	    type: "POST",
       	    url: "favourite?productId=" + productId,
       	    timeout: 100000,
       	    success: function (data) {
       	    }
       	});
	};

    var filterBar = document.getElementById('filter-bar');

    noUiSlider.create(filterBar, {
        start: [ 50, 200 ],
        connect: true,
        range: {
            'min': 50,
            'max': 200
        }
    });

    var skipValues = [
        document.getElementById('value-lower'),
        document.getElementById('value-upper')
    ];

    filterBar.noUiSlider.on('update', function( values, handle ) {
        skipValues[handle].innerHTML = Math.round(values[handle]) ;
    });



</script>
<script type="text/javascript">
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: 20,
            visiblePages: 7
        }).on('page', function (event, page) {
            $.ajax({
                type : "POST",
                contentType : "application/json",
                url : "product/" + page,
                //data : comment,
                timeout : 100000,
                success : function(data) {
                    console.log(data);
                    display(data);
                }
            });
        });

        function display(data) {
            $("#product_grid").html(data);
        }
    });
</script>

<script src="/resources/js/jquery.twbsPagination.min.js"/>

<script src="/resources/js/ajax.js"></script>
<script src="/resources/js/ajaxSession.js"></script>
<!--===============================================================================================-->
<script src="/resources/js/main.js"></script>

</body>
</html>
