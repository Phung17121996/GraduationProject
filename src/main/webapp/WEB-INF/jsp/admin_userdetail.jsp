<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <title>Admin Page</title>
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
    <link rel="stylesheet" type="text/css" href="/resources/css/admin.css">

</head>

<header class="header1">
    <!-- Header desktop -->
    <div class="container-menu-header">
        <div class="topbar">
            <div class="topbar-social">
                <a target="_blank" href="https://www.facebook.com/vanphung.it" class="topbar-social-item fa fa-facebook"></a>
                <a target="_blank" href="https://www.instagram.com/" class="topbar-social-item fa fa-instagram"></a>
                <a target="_blank" href="https://www.youtube.com/channel/UCH0aZyYuO_yWo_qc0DDormQ?view_as=subscriber" class="topbar-social-item fa fa-youtube-play"></a>
            </div>

            <span class="topbar-child1">
					Free shipping for standard order over $500
				</span>
            <div class="topbar-child2">

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
                            <a href="admin_product">Product</a>
                        </li>

                        <li>
                            <a href="admin_user">User</a>
                        </li>

                        <li>
                            <a href="admin_order">Order</a>
                        </li>

                        <li>
                            <a href="admin_banner">Banner</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</header>
<body>
    <div class="row">
        <div class="col-md-12">
            <ul class="breadcrumb">
                <li>
                    <a href="admin">Admin</a>
                </li>
                <li>Manage UserDetail</li>
            </ul>
        </div>
    </div>
    <div class="container" id="userdetail_form">
        <h1 style="text-align: center"><strong>User Detail</strong></h1>
        <form action="" method="post">
            <div class="form-group">
                <label>ID:</label>
                <input type="text" class="form-control"
                       tabindex="1" id="userId" value="${user.id}" readonly/>
            </div>
            <div class="form-group">
                <label >Full Name:</label>
                <input type="text" class="form-control"
                       tabindex="2" name="fullName" value="${user.fullName}" readonly/>
            </div>
            <div class="form-group">
                <label>Address:</label>
                <textarea rows="3" class="form-control"
                          tabindex="3" name="address" readonly>${user.address}</textarea>
            </div>
            <div class="form-group">
                <label>Email:</label>
                <input type="text" class="form-control"
                       tabindex="4" name="email" value="${user.email}" readonly/>
            </div>
            <div class="form-group">
                <label>Phone:</label>
                <input type="number" class="form-control"
                       tabindex="5" name="phone" value="${user.phone}" readonly/>
            </div>
        </form>
        <hr>
    </div>
    <div class="container">
        <h1 style="text-align: center"><strong>List Order</strong></h1>
        <table class="table" id="orderTable">
            <thead>
            <tr>
                <th>Oder ID</th>
                <th>Created Date</th>
                <th>Total</th>
                <th>State</th>
                <th>View</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orders}" var="order">
                <tr>
                    <td>${order.id}</td>
                    <td>${order.createdDate}</td>
                    <td>${order.orderTotal}</td>
                    <td>
                        <c:if test="${order.stateEntity.id == 1}">
                            <span class="label label-info">${order.stateEntity.stateName}</span>
                        </c:if>
                        <c:if test="${order.stateEntity.id == 2}">
                            <span class="label label-warning">${order.stateEntity.stateName}</span>
                        </c:if>
                        <c:if test="${order.stateEntity.id == 3}">
                            <span class="label label-primary">${order.stateEntity.stateName}</span>
                        </c:if>
                        <c:if test="${order.stateEntity.id == 4}">
                            <span class="label label-danger">${order.stateEntity.stateName}</span>
                        </c:if>
                        <c:if test="${order.stateEntity.id == 5}">
                            <span class="label label-success">${order.stateEntity.stateName}</span>
                        </c:if>
                    </td>
                    <td><button class="btn btn-primary"
                                onclick="window.location.href='detailOrder?id=${order.id}'"><strong>Details</strong></button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <hr>
    </div>
    <div class="container">
        <h1 style="margin-left: 15em;font-size: xx-large;font-style: initial; margin-bottom: 1em"><strong>List Favourite</strong></h1>
        <table class="table table-xs">
            <tr>
                <th></th>
                <th>Product</th>
                <th>Category</th>
                <th>View</th>
                <th>Price</th>
            </tr>
            <c:forEach var="favourite" items="${favouriteList}">
                <tr class="item-row" id="item-row">
                    <td> <img style="height: 50px;width: 50px" src="/resources/images/product/${favourite.productEntity.imageEntities[0].imageName}"/></td>
                    <td>${favourite.productEntity.productName}</td>
                    <td>${favourite.productEntity.categoryEntity.categoryName}</td>
                    <td>${favourite.productEntity.viewEntity.count}</td>
                    <td style="color: red;"><strong>$ ${favourite.productEntity.price}</strong></td>
                </tr>
            </c:forEach>
        </table>
    </div>

</body>

<!--===============================================================================================-->
<script type="text/javascript" src="/webjars/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.confirm.js"></script>


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

<script type="text/javascript">

</script>

<!--===============================================================================================-->
<script src="/resources/js/main.js"></script>
<script src="/resources/js/ajaxSession.js"></script>

</html>
