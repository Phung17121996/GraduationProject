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
                <li>Edit Product</li>
            </ul>
        </div>
    </div>

    <div class="container" id="editProduct_form">
        <h1 style="text-align: center"><strong>Edit Product</strong></h1>
        <form action="editProduct" method="post">
            <div class="form-group">
                <label>ID:</label>
                <input type="text" class="form-control"
                            tabindex="1" name="id" value="${product.id}" readonly/>
            </div>
            <div class="form-group">
                <label >Name:</label>
                <input type="text" class="form-control"
                            tabindex="2" name="productName" value="${product.productName}" />
            </div>
            <div class="form-group">
                <label>Description:</label>
                <textarea rows="3" class="form-control"
                               tabindex="3" name="description" >${product.description}</textarea>
            </div>
            <div class="form-group">
                <label>Price:</label>
                <input type="number" class="form-control"
                               tabindex="4" name="price" value="${product.price}"/>
            </div>
            <div class="form-group">
                <label>Quantity:</label>
                <input type="number" class="form-control"
                            tabindex="5" name="quantity" value="${product.productQuantityEntity.quantity}"/>
            </div>
            <div class="form-group">
                <label>Category:</label>
                <input type="text" class="form-control"
                       tabindex="6" name="category" value="${product.categoryEntity.categoryName}" readonly/>
            </div>
            <button type="submit" class="btn btn-success" id="editButton"><strong>Update</strong></button>
        </form>
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
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: 20,
            visiblePages: 7
        }).on('page', function (event, page) {
            $.ajax({
                type : "POST",
                contentType : "application/json",
                url : "admin/" + page,
                //data : comment,
                timeout : 100000,
                success : function(data) {
                    console.log(data);
                    display(data);
                }
            });
        });

        function display(data) {
            $("#dataTable tbody").html(data);
        }
    });

    function deleteProduct(productId) {
        if (confirm("Do you really want to delete that product?")) {
            $.ajax({
                type : "POST",
                url : "deleteProduct?productId=" + productId,
                //data : comment,
                timeout : 100000,
                success : function(data) {
                    console.log(data);
                    $("#dataTable tbody").html(data);
                }
            });
        } else {
        }
    }
</script>
<script src="/resources/js/jquery.twbsPagination.min.js"/>

<!--===============================================================================================-->
<script src="/resources/js/main.js"></script>
<script src="/resources/js/ajaxSession.js"></script>

</html>
