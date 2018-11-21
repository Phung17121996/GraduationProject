<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Cart</title>
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

    <link rel="stylesheet" href="/resources/vendor/confirm/jquery-confirm.min.css">
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
                <button type="button" class="btn btn-link" id="button_signup" onclick="window.location.href='register'">
                    Sign up
                </button>
                <div class="dropdown">
                    <button class="btn btn-link dropdown-toggle" id="button_signin"
                            type="button" data-toggle="dropdown">Sign in
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
                                            <label style="margin-left: 1em;color: #003eff;padding-bottom: 0.5em;">
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
                        <li class="divider"></li>
                        <li>
                            <input class="btn btn-primary btn-block" type="button"
                                   id="sign-in-google" value="Sign In with Facebook">
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
                    <img src="/resources/images/icons/icon-header-02.png" class="header-icon1 js-show-header-dropdown"
                         alt="ICON">
                    <span class="header-icons-noti">${cartQuantity}</span>

                    <!-- Header cart noti -->
                    <div class="header-cart header-dropdown">
                        <ul class="header-cart-wrapitem">
                            <c:forEach items="${carts}" var="cart">
                                <li class="header-cart-item">
                                    <div class="header-cart-item-img">
                                        <img src="/resources/images/product/${cart.product.imageEntities[0].imageName}"
                                             alt="IMG">
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
                            <span>Order Subtotal: <span style="color: red"><strong>$ ${orderSubtotal}</strong></span></span>
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
                                <a href="checkout" class="flex-c-m size1 bg1 bo-rad-20 hov1 s-text1 trans-0-4 ">
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
<body>
<!-- Cart -->
<section class="cart bgwhite p-t-70 p-b-100">
    <div class="container">
        <!-- Cart item -->
        <form action="updateCart" method="post" id="updateCart">
            <div class="container-table-cart pos-relative">

                <div class="wrap-table-shopping-cart bgwhite">

                    <table class="table-shopping-cart" id="cartTable">
                        <thead>
                        <tr class="table-head">
                            <th class="column-1"></th>
                            <th class="column-2 product_head">Product</th>
                            <th class="column-3">Size</th>
                            <th class="column-4">Price</th>
                            <th class="column-5 p-l-70">Quantity</th>
                            <th class="column-6">SubTotal</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="cart" items="${carts}">
                            <tr class="table-row">
                                <td class="column-1"><a href="index">
                                    <div class="cart-img-product b-rad-4 o-f-hidden">
                                        <img src="/resources/images/product/${cart.product.imageEntities[0].imageName}"
                                             alt="IMG-PRODUCT">
                                    </div>
                                </a>
                                </td>
                                <input type="hidden" value="${cart.product.id}" name="productId" id="productId">
                                <td class="column-2" ><a
                                        href="product-detail?productId=${cart.product.id}"><strong style="font-size: 16px;">${cart.product.productName}</strong></a>
                                </td>
                                <td class="column-3"><strong>${cart.size}</strong></td>
                                <input type="hidden" value="${cart.size}" name="size" id="size">
                                <td><strong>$ ${cart.product.price}</strong></td>
                                <td class="column-5">
                                    <div class="flex-w bo5 of-hidden w-size17">
                                        <button class="btn-num-product-down color1 flex-c-m size7 bg8 eff2">
                                            <i class="fs-12 fa fa-minus" aria-hidden="true"></i>
                                        </button>

                                        <input id="quantity" class="size8 m-text18 t-center num-product"
                                               type="number" name="quantity" max="${cart.product.productQuantityEntity.quantity}" value="${cart.quantityProductCart}">

                                        <button class="btn-num-product-up color1 flex-c-m size7 bg8 eff2" >
                                            <i class="fs-12 fa fa-plus" aria-hidden="true"></i>
                                        </button>
                                    </div>
                                    <br>
                                    <span style="color: #bd2130">${message}</span>
                                </td>
                                <td class="column-6" style="color: red;"><strong>$ ${cart.subTotal}</strong></td>
                                <td>
                                    <button class="btn btn-danger" onclick="deleteCartItem(${cart.product.id})">
                                        <span class="glyphicon glyphicon-trash"></span>
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <th class="column-5 " style="font-size: 20px;"><strong>Order Subtotal:</strong></th>
                            <td><span style="color: red;font-size: 20px;"><strong>$ ${orderSubtotal}</strong></span></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="flex-w flex-sb-m p-t-25 p-b-25 bo8 p-l-35 p-r-60 p-lr-15-sm">
                <div class="flex-w flex-m w-full-sm">
                </div>
                <c:if test="${carts.size() != 0}">
                    <div class="size10 trans-0-4 m-t-10 m-b-10">
                        <!-- Button -->
                        <button type="submit" class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4" style="margin-left: 22em;">
                            Update Cart
                        </button>
                    </div>
                    <div class=" trans-0-4 m-t-10 m-b-10" style="width: 230px;height: 45px; margin-left: 50px;" >
                        <button type="button" class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4"
                                onclick="window.location.href='checkout'">
                            Proceed to Check out
                        </button>
                    </div>
                </c:if>
                <c:if test="${carts.size() == 0}">
                    <div class="size10 trans-0-4 m-t-10 m-b-10">
                    </div>
                    <div class=" trans-0-4 m-t-10 m-b-10" style="width: 230px;height: 45px; margin-left: 50px;" >
                    </div>
                </c:if>
            </div>
        </form>
        <!-- Total -->
    </div>
</section>


</body>




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
<script type="text/javascript">
    function deleteCartItem(productId) {
        if (confirm("Do you really want to delete that product?")) {
            $.ajax({
                type: "POST",
                url: "deleteCartItem?productId=" + productId+ "&size="+ $("#size").val() ,
                //data : comment,
                timeout: 100000,
                success: function (data) {
                    $("#cartTable tbody").html(data);
                }
            });
        }
        else{
            return false;
        }
    }

</script>
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
<script src="/resources/vendor/confirm/jquery-confirm.min.js"></script>

<script src="/resources/js/ajax.js"></script>
<script src="/resources/js/ajaxSession.js"></script>
<!--===============================================================================================-->
<script src="/resources/js/main.js"></script>

</body>
</html>
