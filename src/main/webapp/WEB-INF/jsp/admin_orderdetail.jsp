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

    <link rel="stylesheet" type="text/css" href="/resources/vendor/printjs/print.min.css">
    <script src="/resources/vendor/printjs/print.min.js"></script>

    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/css/util.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/admin.css">
    <style>
        #order_detail_page{
            border: 1px solid black;
            width: 75%;
            margin-left: 10em;
        }
        #order_detail_page tr{
            border: 1px solid black;
            padding: 8px;
        }
        #order_detail_page tr td{
            text-align: center;
            padding: 8px;
            color: black;
        }
        #order_detail_page tr th{
            text-align: center;
             padding: 8px;
            color: black;
         }
    </style>

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
                <li>Order Detail</li>
            </ul>
        </div>
    </div>

    <div class="container" id="editProduct_form">
        <h1 style="text-align: center"><strong>Order Detail</strong></h1>
        <form action="updateOrder" method="post">
            <div class="form-group">
                <label>ID:</label>
                <input type="text" class="form-control"
                            tabindex="1" name="id" value="${order.id}" readonly/>
            </div>
            <div class="form-group">
                <label >Full Name:</label>
                <input type="text" class="form-control"
                            tabindex="2" name="fullName" value="${order.fullName}" readonly/>
            </div>
            <div class="form-group">
                <label>Address:</label>
                <textarea rows="3" class="form-control"
                               tabindex="3" name="address" readonly>${order.address}</textarea>
            </div>
            <div class="form-group">
                <label>Email:</label>
                <input type="text" class="form-control"
                               tabindex="4" name="email" value="${order.email}" readonly/>
            </div>
            <div class="form-group">
                <label>Phone:</label>
                <input type="number" class="form-control"
                            tabindex="5" name="phone" value="${order.phone}" readonly/>
            </div>
            <div class="form-group">
                <label>Created Date:</label>
                <input type="text" class="form-control"
                       tabindex="6" name="createdDate" value="${order.createdDate}" readonly/>
            </div>
            <div class="form-group">
                <label>Total Price:</label>
                <input type="text" class="form-control"
                       tabindex="7" name="totalPrice" value="${order.orderTotal}" style="color: red;" readonly/>
            </div>
            <div class="form-group">
                <label>Note:</label>
                <textarea rows="3" class="form-control"
                          tabindex="8" name="note" readonly>${order.note}</textarea>
            </div>
            <div class="form-group">
                <label>State:</label>
                <select class="form-control" name="state" tabindex="9">
                    <option value="${order.stateEntity.id}">${order.stateEntity.stateName}</option>
                    <c:forEach items="${states}" var="state">
                        <option value="${state.id}">${state.stateName}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" class="btn btn-success" id="editButton"><strong>Update</strong></button>
        </form>

    </div>
    <hr>

    <div class="container">
        <br>
        <h1 style="text-align: center; margin-top: 20px;"><strong>List Product of Order</strong></h1>
        <hr>
        <button class="btn btn-primary" onclick="printDetail()" style="margin-left: 80%;margin-bottom: 1em;">
            <strong>Print&nbsp;<i class="fa fa-print" style="font-size:20px;"></i></strong>
        </button>

        <table id="order_detail_page">
            <tr>
                <th style="text-align: left;"><h2><strong>Order Detail #${order.id}</strong></h2>
                <strong>Name:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${order.fullName}<br>
                <strong>Address:</strong> ${order.address}<br>
                <strong>Phone:</strong>&nbsp;&nbsp;&nbsp;&nbsp;${order.phone}<br>
                <strong>Shipping within 3 days</strong>
                </th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
            <tr>
                <th style="border: 1px solid black;">Product</th>
                <th style="border: 1px solid black;">Size</th>
                <th style="border: 1px solid black;">Quantity</th>
                <th style="border: 1px solid black;">Price</th>
                <th style="border: 1px solid black;">SubTotal</th>
            </tr>
            <c:forEach items="${orderDetailList}" var="orderdetail">
                <tr>
                    <td style="border: 1px solid black;">${orderdetail.productEntity.productName}</td>
                    <td style="border: 1px solid black;">${orderdetail.size}</td>
                    <td style="border: 1px solid black;">${orderdetail.quantity}</td>
                    <td style="border: 1px solid black;">${orderdetail.productEntity.price}</td>
                    <td style="border: 1px solid black;">$ ${orderdetail.subTotal}</td>
                </tr>
            </c:forEach>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td style="text-align: right; border: 1px solid black;">
                    Subtotal<br>
                    Discount<br>
                    Shipping fee
                </td>
                <td style="border: 1px solid black;">
                    <strong>$ ${order.orderSubtotal}<br>
                    - ${order.discount}%<br>
                    $ ${order.shippingFee}</strong>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td style="font-size: 22px; text-align: right; border: 1px solid black;">
                    <strong>Total</strong>
                </td>
                <td>
                    <span style="color: red; font-size: 22px;">
                        <strong>$ ${order.orderTotal}</strong>
                    </span>
                </td>
            </tr>
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

    function printDetail(){
        printJS({
            printable: 'order_detail_page',
            type: 'html',
            gridStyle: 'border: 1px solid black;'
        })
    }
</script>
<script src="/resources/js/jquery.twbsPagination.min.js"/>


<!--===============================================================================================-->
<script src="/resources/js/main.js"></script>
<script src="/resources/js/ajaxSession.js"></script>

</html>
