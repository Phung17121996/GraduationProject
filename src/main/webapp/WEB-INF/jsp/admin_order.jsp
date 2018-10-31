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

    <link rel="stylesheet" href="/resources/vendor/datatables/jquery.dataTables.min.css">

    <link rel="stylesheet" type="text/css" href="/resources/css/util.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/admin.css">
    <style>
        #dataTable tr th{
            text-align: center;
        }
        #dataTable tr td{
            text-align: center;
        }
    </style>
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
                <li>Manage Order</li>
            </ul>
        </div>
    </div>
    <div class="container">
        <h1 style="text-align: center"><strong>List Order</strong></h1>
        <table class="display" id="dataTable">
            <thead>
            <tr>
                <th>Oder ID</th>
                <th>Created Date</th>
                <th>Total</th>
                <th>State</th>
                <th>View</th>
                <th>Action</th>
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
                    <td>
                        <button class="btn btn-primary"
                                onclick="window.location.href='detailOrder?id=${order.id}'"><strong>Details</strong>
                        </button>
                    </td>
                    <td>
                        <c:if test="${order.stateEntity.id == 1}">
                            <button class="btn btn-danger"onclick="window.location.href='cancelOrder?orderId=${order.id}'"><strong>Cancel</strong></button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <hr>
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
    $(document).ready( function () {
        var table = $('#dataTable').DataTable({
            "order": [[ 0, "desc" ]],
            "language": {
                "lengthMenu": "Show _MENU_ records for 1 page",
                "zeroRecords": "No data",
                "info": "show page _PAGE_ of _PAGES_",
                "infoEmpty": "No data found",
                "paginate": {
                    "first":      "First",
                    "last":       "Last",
                    "next":       "Next",
                    "previous":   "Previous"
                },
            }
        })
    });

    function deleteProduct(orderId) {
        if (confirm("Do you really want to cancel that order?")) {
            $.ajax({
                type : "POST",
                url : "cancelOrder?orderId=" + orderId,
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
<script src="/resources/vendor/datatables/jquery.dataTables.min.js"></script>

<!--===============================================================================================-->
<script src="/resources/js/main.js"></script>
<script src="/resources/js/ajaxSession.js"></script>

</html>
