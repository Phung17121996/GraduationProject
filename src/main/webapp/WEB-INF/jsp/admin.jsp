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
    <script type="text/javascript" src="/webjars/jquery/3.2.1/jquery.min.js"></script>

    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/css/util.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/admin.css">

    <script>
        var model=[];
        model.shirt="${shirt}".split(",").map(Number);
        model.jacket="${jacket}".split(",").map(Number);
        model.jean="${jean}".split(",").map(Number);
        model.hoodie="${hoodie}".split(",").map(Number);
    </script>
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
                    <a href="index">Home</a>
                </li>
                <li>Admin</li>
            </ul>
        </div>
    </div>
    <h1 style="text-align: center; color: crimson;"><strong>Monthly Revenue</strong></h1><br>


    <div id="container123" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
    <hr><br>

    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script type="text/javascript">
        $(function () {
            var chart = new Highcharts.chart('container123', {
                title: {
                    text: '',
                    x: -20 //center
                },
                subtitle: {
                    text: "",
                    x: -20
                },
                xAxis: {
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                },
                yAxis: {
                    title: {
                        text: 'Dollar ($)'
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
                },
                tooltip: {
                    valueSuffix: '$'
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0
                },
                series: [{
                    name: 'Shirt',
                    data: model.shirt
                }, {
                    name: 'Jacket',
                    data: model.jacket
                }, {
                    name: 'Jean',
                    data: model.jean
                }, {
                    name: 'Hoodie',
                    data: model.hoodie
                }]
            });
        });
    </script>

    <div class="container" id="status_form">
        <h1 style="text-align: center; color: crimson;"><strong>Daily Status</strong></h1><br>
        <div class="jumbotron" style="font-size: 18px;">
            ${date} :<br>
                &emsp;&emsp;&emsp;You have <strong style="color: red;">${ordersSize[0]}</strong> orders BEING PREPARED.<br>
                &emsp;&emsp;&emsp;You have <strong style="color: red;">${ordersSize[1]}</strong> orders ON HOLD.<br>
                &emsp;&emsp;&emsp;You have <strong style="color: red;">${ordersSize[2]}</strong> orders DELIVERING.<br>
                &emsp;&emsp;&emsp;You have <strong style="color: red;">${ordersSize[3]}</strong> orders CANCELED.
        </div>
        <hr>
    </div>

    <div class="container" id="message_form">
        <h1 style="text-align: center; color: crimson;"><strong>Message of customer</strong></h1><br>
        <div class="jumbotron" style="font-size: 18px;">
            <c:forEach items="${messages}" var="message">
                <form action="sendMessage?email=${message.email}&content=${message.content}" method="post">
                        ${message.email}:<br>
                                Content: ${message.content}.<br>
                    <textarea name="mess" cols="80" rows="2" placeholder="Reply...."></textarea><br>
                    <button type="submit" class="btn btn-default" style="margin-left: 33em; margin-top: 5px;">Send</button>
                    <br>
                </form>
                <hr>
            </c:forEach>
        </div>
        <hr>
    </div>

</body>

<!--===============================================================================================-->
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
