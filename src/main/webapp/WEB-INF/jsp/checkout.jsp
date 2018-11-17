<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Checkout Page</title>
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
    <link rel="stylesheet" type="text/css" href="/resources/css/checkout.css">
</head>

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
                                          method="post" action="/login" id="login-nav">
                                        <div class="form-group">
                                            <input type="email" class="form-control"
                                                   name="email" placeholder="Email address" id="email" required
                                                   style="margin-bottom: 10px">
                                            <input type="password" class="form-control"
                                                   name="password" placeholder="Password" id="password" required>
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
<body>
    <div class="row" style="background-color: #dfdfdf;">
        <div class="col-md-12">
            <div class="container breadcrumb_checkout">
                <ul class="breadcrumb">
                    <li>
                        <a href="index">Home</a>
                    </li>
                    <li>Checkout - Order review</li>
                </ul>
            </div>
        </div>
        <div class="col-md-9 container checkout_container">
            <div class="panel-heading">
                <div class="row">
                    <a class="active">Delivery Address</a>
                </div>
            </div>
            <div class="panel-body">
                <form:form id="checkout-form" action="checkout" method="post"
                      role="form" style="display: block;" modelAttribute="user">
                    <div class="form-group">
                        <lable><strong>Full Name:<span style="color:red;">*</span></strong></lable>
                        <form:input type="text" name="fullName" path="fullName"
                               tabindex="1" class="form-control form_input" maxlength="20" required="required" />
                    </div>

                    <div class="form-group">
                        <lable><strong>Address:<span style="color:red;">*</span></strong></lable>
                        <form:textarea name="address" path="address" rows="3" tabindex="2"
                                  class="form-control form_input" required="required" />
                    </div>

                    <div class="form-group">
                        <lable><strong>Email:<span style="color:red;">*</span></strong></lable>
                        <form:input type="email" name="email" path="email"
                               tabindex="3" class="form-control form_input" required="required" />
                    </div>

                    <div class="form-group">
                        <lable><strong>Phone:<span style="color:red;">*</span></strong></lable>
                        <form:input type="text" name="phone" path="phone"
                               tabindex="4" class="form-control form_input" maxlength="10" required="required" />
                    </div>

                    <div class="form-group">
                        <lable><strong>Discount code:</strong></lable>
                        <input type="text" name="discountCode" id="discountCode" tabindex="5" style="width: 7em; align-content: right" />
                        <span style="color: #bd2130">${message}</span>
                    </div>

                    <div class="form-group">
                        <lable><strong>Note:</strong></lable>
                        <textarea type="text" name="note"
                                    tabindex="6" class="form-control form_input" >
                        </textarea>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-6 col-sm-offset-3">
                                <input type="submit" name="btn-checkout"
                                       tabindex="7" class="form-control btn btn-checkout" value="Buy Now">
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>



        <div class="col-md-3">
            <div class="box" id="order-summary">
                <div class="box-header">
                    <br>
                    <h3>Order summary</h3>
                </div>
                <div class="table-responsive">
                    <table class="table table_order">
                        <thead>
                        <tr>
                            <td>Product</td>
                            <td>Quantity</td>
                            <td>Subtotal</td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${carts}" var="cart" >
                        <tr>
                            <td class="column-1">
                                <div class="cart-img-product b-rad-4 o-f-hidden">
                                    <img src="/resources/images/product/${cart.product.imageEntities[0].imageName}"
                                         alt="IMG-PRODUCT">
                                </div>
                            </td>
                            <td>${cart.quantityProductCart}</td>
                            <td style="color: red"><strong>$ ${cart.subTotal}</strong></td>
                        </tr>
                        </c:forEach>
                        <tr id="total">
                            <td></td>
                            <td style="font-size: small;text-align: right;">
                                <strong>Subtotal:<br>
                                Shipping fee:
                                </strong>
                            </td>
                            <td id="orderSubtotal" style="font-size: small">
                                <strong>
                                    $ ${orderSubtotal}<br>
                                    <c:if test="${orderSubtotal > 500}">
                                        $ 0
                                    </c:if>
                                    <c:if test="${orderSubtotal < 500 }">
                                        $ 50
                                    </c:if>
                                </strong>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
</body>
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
                    <a href="contact" class="s-text7">
                        Contact Us
                    </a>
                </li>
            </ul>
        </div>
    </div>


</footer>
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
<script src="/resources/js/map-custom.js"></script>
<!--===============================================================================================-->
<script src="/resources/js/main.js"></script>
<script src="/resources/js/ajax.js"></script>
<script src="/resources/js/ajaxSession.js"></script>
</html>
