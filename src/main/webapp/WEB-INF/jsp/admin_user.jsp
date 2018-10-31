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
                <li>Manage User</li>
            </ul>
        </div>
    </div>
    <div class="container">
        <h1 style="text-align: center"><strong>List User</strong></h1>
        <table class="table" id="dataTable">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Address</th>
                <th>Phone</th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.fullName}</td>
                    <td>${user.email}</td>
                    <td>${user.address}</td>
                    <td>${user.phone}</td>
                    <td><button class="btn btn-primary"
                                onclick="window.location.href='detailUser?userId=${user.id}'"><strong>Details</strong></button></td>
                    <td><button class="confirm btn btn-danger" onclick="deleteUser(${user.id})">
                        <strong>Delete</strong>
                    </button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="container">
        <h1 style="text-align: center"><strong>List Disabled User</strong></h1>
        <table class="table" id="tableDisable">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Address</th>
                <th>Phone</th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${userDisable}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.fullName}</td>
                    <td>${user.email}</td>
                    <td>${user.address}</td>
                    <td>${user.phone}</td>
                    <td><button class="btn btn-primary"
                                onclick="window.location.href='detailUser?userId=${user.id}'"><strong>Details</strong></button></td>
                    <td><button class="confirm btn btn-default" onclick="enableUser(${user.id})">
                        <strong>Enable</strong>
                    </button></td>
                </tr>
            </c:forEach>
            </tbody>
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
    $(document).ready( function () {
        var table = $('#tableDisable').DataTable({
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
    function deleteUser(userId) {
        if (confirm("Do you really want to delete that user?")) {
            $.ajax({
                type : "POST",
                url : "deleteUser?id=" + userId,
                //data : comment,
                timeout : 100000,
                success : function(data) {
                    var newData= data.split("||");
                    console.log(data);
                    $("#dataTable tbody").html(newData[0]);
                    $("#tableDisable tbody").html(newData[1]);
                }
            });
        } else {
        }
    }

    function enableUser(userId) {
        if (confirm("Do you really want to enable that user?")) {
            $.ajax({
                type : "POST",
                url : "enableUser?id=" + userId,
                //data : comment,
                timeout : 100000,
                success : function(data) {
                    var newData= data.split("||");
                    console.log(data);
                    $("#dataTable tbody").html(newData[0]);
                    $("#tableDisable tbody").html(newData[1]);
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
