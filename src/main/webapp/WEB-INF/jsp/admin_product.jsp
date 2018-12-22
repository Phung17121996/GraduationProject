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
                <li>Manage Product</li>
            </ul>
        </div>
    </div>

    <div class="container">
        <h1 style="text-align: center"><strong>List Product</strong></h1>
        <hr>
        <button class="btn btn-success" onclick="window.location.href='#addProduct_form'"
                style="margin-left: 58.3em;margin-bottom: 10px;width:210px;font-size: 16px;">
            <strong>Add New Product</strong></button>
        <table class="display" id="dataTable">
            <thead>
            <tr>
                <th>ID</th>
                <th>Image</th>
                <th>Name</th>
                <th>Price</th>
                <th>Category</th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${products}" var="product">
                <tr>
                    <td id="product_id">${product.id}</td>
                    <td><img src="/resources/images/product/${product.imageEntities.get(0).imageName}"
                             style="height: 50px;"/></td>
                    <td>${product.productName}</td>
                    <td>$${product.price}</td>
                    <td>${product.categoryEntity.categoryName}</td>
                    <td><button class="btn btn-primary"
                                onclick="window.location.href='editProduct?id=${product.id}'"><strong>Edit</strong></button></td>
                    <td><button class="confirm btn btn-danger" onclick="deleteProduct(${product.id})">
                        <strong>Delete</strong>
                    </button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <hr>
    </div>

    <div class="container">
        <h1 style="text-align: center"><strong>List Disabled Product</strong></h1>
        <hr>
        <table class="display" id="tableDisable">
            <thead>
            <tr>
                <th>ID</th>
                <th>Image</th>
                <th>Name</th>
                <th>Price</th>
                <th>Category</th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${productDisable}" var="product">
                <tr>
                    <td>${product.id}</td>
                    <td><img src="/resources/images/product/${product.imageEntities.get(0).imageName}"
                             style="height: 50px;"/></td>
                    <td>${product.productName}</td>
                    <td>$${product.price}</td>
                    <td>${product.categoryEntity.categoryName}</td>
                    <td><button class="btn btn-primary"
                                onclick="window.location.href='editProduct?id=${product.id}'"><strong>Edit</strong></button></td>
                    <td><button class="confirm btn btn-default" onclick="enableProduct(${product.id})">
                        <strong>Enable</strong>
                    </button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <hr>
    </div>


    <div class="container" id="addProduct_form">
        <h1 style="text-align: center"><strong>Add New Product</strong></h1>
        <form:form action="addProduct" method="post"
                   modelAttribute="productEntity" enctype="multipart/form-data" >
            <div class="form-group">
                <label >Name:</label>
                <form:input type="text" class="form-control"
                            tabindex="1" path="productName" required="required"></form:input>
            </div>
            <div class="form-group">
                <label>Description:</label>
                <form:textarea rows="3" class="form-control"
                               tabindex="2" path="description" required="required"></form:textarea>
            </div>
            <div class="form-group">
                <label>Price:</label>
                <form:input type="number" class="form-control"
                               tabindex="3" path="price" value="0.0" required="required"></form:input>
            </div>
            <div class="form-group">
                <label>Image:</label>
                <input name="file" type="file" tabindex="4" class="form-control"  multiple required/>
            </div>
            <div class="form-group">
                <label>Category:</label>
                <select class="form-control" name="categoryName" tabindex="5" required>
                    <option value="Shirts">Shirts</option>
                    <option value="Jeans">Jeans</option>
                    <option value="Jacket">Jacket</option>
                    <option value="Hoodie">Hoodie</option>
                </select>
            </div>
            <div class="form-group">
                <label>Quantity:</label>
                <input type="number" class="form-control"
                            tabindex="6" name="quantity" value="0" required/>
            </div>
            <form:button type="submit" class="btn btn-success btn-md">
                <strong style="align-items: center;padding: 3em;">ADD</strong>
            </form:button>
        </form:form>
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

    function deleteProduct(productId) {
        if (confirm("Do you really want to delete that product?")) {
            $.ajax({
                type : "POST",
                url : "deleteProduct?productId=" + productId,
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
    function enableProduct(productId) {
        if (confirm("Do you really want to enable that product?")) {
            $.ajax({
                type : "POST",
                url : "enableProduct?productId=" + productId,
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
