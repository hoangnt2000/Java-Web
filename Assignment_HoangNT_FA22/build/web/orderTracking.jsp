<%-- 
    Document   : orderTracking
    Created on : Sep 23, 2021, 1:37:12 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="style.css" type="text/css">
        <script src="javascript.js" type="text/javascript"></script>
        <title>Music shop</title>
    </head>
<body>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark" >
            <div class="container" style="margin: 0px 200px; padding: 0px; ">
                <a class="navbar-brand" href="DispatchServlet">Music Shop</a>
                <c:set var="name" value="${sessionScope.NAME}"/>
                <c:if test="${not empty NAME}">
                    <form action="DispatchServlet" method="POST" class="form-inline my-2 my-lg-0" style="width: 450px;margin-left: 30px;">
                    <div class="input-group input-group-sm">
                        <input type="text" name="txtSearch" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="OrderID..." required pattern="[0-9]+"
                               title="OrderID is a number "/>
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-secondary btn-number" name="btAction" value="OrderTracking">
                                    <i class="fa fa-search"></i>
                                </button>
                        </div>
                    </div>
                    </form>
                    <div class="collapse navbar-collapse">
                        <font class="show-txt" style="color :red; width:150px "> Welcome ${sessionScope.NAME}</font>
                        <a href="LogoutServlet" class="show-txt" color ="red">Logout</a>
                    </div>
                        <c:set var="role" value="${sessionScope.AccDTO.role}"/>
                        <c:if test="${role == true}">
                            <div class="collapse navbar-collapse">
                                <a href="DispatchServlet?btAction=manage" class="show-txt" style="width:150px; margin-left: 10px; ">Manage Course</a>
                            </div>                            
                        </c:if>
                </c:if>
                <c:if test="${empty NAME}">
                    <div class="collapse navbar-collapse">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Mymodal">Login</button> <!-- .Launch Modal Button-->
                    </div>
                    <!-- .modal -->
                    <div class="modal fade" id="Mymodal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button> 
                                    <h4 class="modal-title">Login</h4>                                                             
                                </div> 
                                <form action="DispatchServlet" method="POST" class="form-signin" >
                                    <div class="modal-body">
                                        <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Sign in</h1>
                                        <input name="txtUserName"  type="text" id="inputEmail" class="form-control" placeholder="Username" required="" autofocus="">
                                        <input name="txtPassword"  type="password" id="inputPassword" class="form-control" placeholder="Password" required="">
                                    </div>   
                                    <div class="modal-footer">
                                        <button class="btn btn-success btn-block" type="submit" name="btAction" value="Login">Login</button>                                 
                                    </div>
                                </form>
                            </div>                                                                       
                        </div>                                      
                    </div>                    
                </c:if>
        <c:if test="${not empty FAIL}">
            <div class="row">
                <div class="col">
                    <div class="alert success" role="alert" style="padding:0px; padding-bottom: 3px;">
                        <div class="col">
                            <strong>Login Fail!</strong>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close" style="padding-left: 100px;">
                            <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </div> 
                </div>
            </div>
        </c:if>
            </div>
                
                <form action="DispatchServlet" method="POST" class="form-inline my-2 my-lg-0" style="width: 450px;margin-left: 30px;">
                    <div class="input-group input-group-sm">
                        <input type="text" name="txtSearch" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search..." required/>
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-secondary btn-number" name="btAction" value="Search">
                                    <i class="fa fa-search"></i>
                                </button>
                        </div>
                    </div>
                </form>
                 <c:set var="role" value="${sessionScope.AccDTO.role}"/>
                 <c:if test="${empty role}">
                     <form action="DispatchServlet" method="POST" class="form-inline my-2 my-lg-0" style="width: 200px;margin-left:5px;">
                        <div class="input-group input-group-sm" style="height: 30px;">
                        <c:if test="${empty sessionScope.CART}">
                            <button class="btn btn-success btn-sm ml-3" value="show" name="btAction">
                                <i class="fa fa-shopping-cart"></i> Cart
                                <span class="badge badge-light">0</span>
                            </button>   
                        </c:if>
                        <c:if test="${not empty sessionScope.CART}">
                            <c:set var="cart" value="${sessionScope.CART}"/>
                            <c:set var="count" value="1"/>
                            <button class="btn btn-success btn-sm ml-3" value="show" name="btAction">
                                <i class="fa fa-shopping-cart"></i> Cart
                                <span class="badge badge-light">${sessionScope.COUNT}</span>
                            </button>>   
                        </c:if> 
                        </div>
                    </form>
                 </c:if>
                 <c:if test="${role == false}">
                    <form action="DispatchServlet" method="POST" class="form-inline my-2 my-lg-0" style="width: 200px;margin-left:5px;">
                        <div class="input-group input-group-sm" style="height: 30px;">
                        <c:if test="${empty sessionScope.CART}">
                            <button class="btn btn-success btn-sm ml-3" value="show" name="btAction">
                                <i class="fa fa-shopping-cart"></i> Cart
                                <span class="badge badge-light">0</span>
                            </button>   
                        </c:if>
                        <c:if test="${not empty sessionScope.CART}">
                            <c:set var="cart" value="${sessionScope.CART}"/>
                            <c:set var="count" value="1"/>
                            <button class="btn btn-success btn-sm ml-3" value="show" name="btAction">
                                <i class="fa fa-shopping-cart"></i> Cart
                                <span class="badge badge-light">${sessionScope.COUNT}</span>
                            </button>>   
                        </c:if> 
                        </div>
                    </form>
                 </c:if>
        </nav>
                 
        <div class="container" style="margin: 0px 300px; padding: 0px;">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-4">
                            <h2>Order Detail</h2>
                        </div>  
                    </div>
                </div>
                <c:set var="order" value="${requestScope.ORDERDTO}"/>
                <c:if test="${empty order}">
                    <strong>OrderID not avaliable</strong>
                </c:if>
                <c:if test="${not empty order}">
                    <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>UserName</th>
                            <th>Order ID</th>
                            <th>Order Date</th>
                            <th>Price</th>
                            <th>Payment</th>
                            <th>Payment Status</th>
                            <th>Shipping Address</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${order.contactName}</td>
                            <td>${order.orderID}</td>
                            <td>${order.orderDate}</td>
                            <td>${order.totalPrice}$</td>
                            <td>${order.payment}</td>
                            <td>${order.paymentStatus}</td>
                            <td>${order.addr}</td>
                            <td style="width: 110px;">
                                <button type="button"  class="btn btn-primary" data-toggle="modal" data-target="#myModal">View more</button>
                                <!-- .modal -->
                                <div class="modal fade" id="myModal">
                                    <div class="modal-dialog" style=" margin-left: 200px; margin-right: 0px">
                                        <div class="modal-content" style="width: 1500px;">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>                                                            
                                            </div> 
                                            <table class="table table-striped table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>Image</th>
                                                        <th>Name</th>
                                                        <th>Quantity</th>
                                                        <th>Price</th>
                                                        <th>Total</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:if test="${not empty LISTPRODTO}">
                                                        <c:forEach items="${LISTPRODTO}" var="proDTO">
                                                            <c:forEach items="${DETAILDTO}" var="listproduct" varStatus="counter">
                                                                <c:if test="${proDTO.proID == listproduct.key}">
                                                                    <form action="DispatchServlet" method="POST">
                                                                        <tr>
                                                                            <input type="hidden" name="txtID" value="${proDTO.proID}" />
                                                                            <td>
                                                                                <img src="image/${proDTO.image}" style="width: 100px; height: 100px;"/>
                                                                            </td>
                                                                            <td>${proDTO.proName}</td>
                                                                            <td>${listproduct.value}</td>
                                                                            <td>${proDTO.price}$</td>
                                                                            <td>${proDTO.price * listproduct.value}$</td>
                                                                        </tr>
                                                                    </form>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:forEach>                            
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>                                                                       
                                    </div>                                      
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                </c:if>
            </div>
            </div>
    </body>
</html>
