<%-- 
    Document   : viewDetail
    Created on : Sep 18, 2021, 2:25:27 PM
    Author     : nguye
--%>

<%@page import="hoangnt.Category.CategoryDAO"%>
<%@page import="hoangnt.Category.CategoryDTO"%>
<%@page import="hoangnt.Product.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="hoangnt.Product.ProductDTO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <script src="javascript.js"></script>
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
                        <input type="text" name="txtSearch" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="OrderID..." required
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
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close" style="padding-left: 600px;">
                            <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </div> 
                </div>
            </div>
        </c:if>
            </div>
                <form action="DispatchServlet" method="POST" class="form-inline my-2 my-lg-0" style="width: 600px;margin-left: 30px;">
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
        <form action="DispatchServlet" method="POST">
            <div class="container" style="padding-left: 0px; padding-right: 0px; margin: 0px 300px; ">
                <div class="row">
                    <div class="col-sm-3">
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                        <ul class="list-group category_block">
                            <c:set var="cid" value="0"/>
                            <c:if test="${not empty param.cateID}">
                                <c:set var="cid" value="${param.cateID}"/>
                            </c:if>
                            <c:set var="cateList" value="${requestScope.CATELIST}"/>
                            <c:if test="${not empty cateList}">
                                <c:forEach items="${cateList}" var="cateDTO" varStatus="counter">
                                    <c:if test="${cid == cateDTO.cateID}">
                                        <li class="list-group-item text-white active" ><a style="color: black"  href="DispatchServlet?btAction=searchByCate&cateID=${cateDTO.cateID}">${cateDTO.cateName}</a></li>
                                    </c:if>
                                    <c:if test="${cid != cateDTO.cateID}">
                                        <li class="list-group-item text-white"><a href="DispatchServlet?btAction=searchByCate&cateID=${cateDTO.cateID}">${cateDTO.cateName}</a></li>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty cateList}">
                                 not found           
                            </c:if>
                                    
                        </ul>
                    </div>
                </div>
                    <div class="col-sm-9">
                        <div class="row">
                            <c:set var="proDTO" value="${requestScope.PROLIST}"/>
                            <c:if test="${not empty proDTO}">
                                <div class="container" style="padding: 0px; margin: 0px">
                                    <div class="card" style="width: 1200px; border: 0px">
                                        <div class="row">
                                            <aside class="col-sm-5 border-right">
                                                <article class="gallery-wrap"> 
                                                    <div class="img-big-wrap">
                                                        <div> <a href="#"><img src="image/${proDTO.image}" alt="${proDTO.image}" style="width: 483px; height: 450px"></a></div>
                                                    </div> 
                                                </article> 
                                            </aside>
                                            <aside class="col-sm-7">
                                                <article class="card-body p-5">
                                                    <input type="hidden" value="${proDTO.proID}" name="txtProID"/>
                                                    <h3 class="title mb-3">${proDTO.proName}</h3>
                                                    <p class="price-detail-wrap"> 
                                                        <span class="price h3 text-warning"> 
                                                            <span class="currency">US $</span><span class="num">${proDTO.price}</span>
                                                        </span>
                                                    </p> 
                                                    <dl class="item-property">
                                                        <dt>Description</dt>
                                                        <dd><p>${proDTO.cate.description}</p></dd>
                                                    </dl>
                                                    <dl class="item-property">
                                                        <a>
                                                            <strong style="color: red">Start Date : </strong>${proDTO.startDate} </br>
                                                            <strong style="color: red">End Date: </strong>${proDTO.endDate}
                                                        </a>
                                                    </dl>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-5">
                                                            <dl class="param param-inline">
                                                                <dt>Quantity: </dt>
                                                                <dd>
                                                                    <input type="text" name="txtQuality" value="1" pattern="^[0-9]{0,3}$" title="It's a number and maximun 3 digit" required=""></br>
                                                                </dd>
                                                            </dl> 
                                                        </div>
                                                    </div> 
                                                    <hr>
                                                    <c:if test="${proDTO.status == false}">
                                                        <button class="btn btn-lg btn-outline-primary text-uppercase" disabled="disabled" type="submit" style="background-color: red; color: black">Sold Out</button>
                                                    </c:if>
                                                    <c:if test="${proDTO.status == true}">
                                                        <c:set var="role" value="${sessionScope.AccDTO.role}"/>
                                                        <c:if test="${role != true}">
                                                            <button class="btn btn-lg btn-outline-primary text-uppercase" type="submit" value="Order2" name="btAction" style="background-color: blue; color: white">
                                                                <i class="fas fa-shopping-cart"></i>
                                                                Add to cart
                                                            </button>
                                                            <button class="btn btn-lg btn-outline-primary text-uppercase" type="submit" value="BuyNow" name="btAction" style="background-color: blue; color: white">
                                                                Buy Now
                                                            </button>
                                                        </c:if>
                                                        <c:if test="${role == true}">
                                                            <button class="btn btn-lg btn-outline-primary text-uppercase" type="submit" disabled="" value="Order2" name="btAction" style="background-color: blue; color: white">
                                                                <i class="fas fa-shopping-cart"></i>
                                                                Add to cart
                                                            </button>
                                                            <button class="btn btn-lg btn-outline-primary text-uppercase" type="submit" disabled="" value="BuyNow" name="btAction" style="background-color: blue; color: white">
                                                                Buy Now
                                                            </button>
                                                        </c:if>
                                                            
                                                    </c:if>
                                                </article> 
                                            </aside>
                                        </div> 
                                    </div> 
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
            </form>
    </body>
</html>
