<%-- 
    Document   : viewCart
    Created on : Sep 21, 2021, 12:16:40 PM
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
                                <a href="DispatchServlet?btAction=manage" class="show-txt" color ="red">Manage Course</a>
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
        <c:if test="${not empty NOTE}">
            <c:set var="note" value="${NOTE}"/>
            <c:set var="successfull" value="Success"/>
            <c:set var="fail" value="fail"/>
            <c:if test="${note == successfull}">
                <div class="row">
                    <div class="col">
                        <div class="alert success" role="alert" style="padding:0px; padding-bottom: 3px;background-color: #0000ff">
                            <div class="col">
                                <strong>Your Order Code is ${ORDERID}</strong>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close" style="padding-left: 100px;">
                                <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </div> 
                    </div>
                </div>                
            </c:if>
            <c:if test="${note != successfull}">
                <div class="row">
                    <div class="col">
                        <div class="alert success" role="alert" style="padding:0px; padding-bottom: 3px;background-color: #0000ff">
                            <div class="col">
                                <strong>
                                    Order Fail <button type="button" class="close" data-dismiss="alert" aria-label="Close" style="padding-left: 100px;"><span aria-hidden="true">&times;</span></button>
                                </strong>
                            </div>
                        </div> 
                    </div>
                </div>                
            </c:if>
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
                <form action="DispatchServlet" method="POST" class="form-inline my-2 my-lg-0" style="width: 900px;margin-left: 30px;">
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
                            <h2>Your <b>Shopping Cart</b></h2>
                        </div>
                        <c:if test="${empty sessionScope.CART}">
                            <div class="col-sm-2" style="margin-left: 350px;">
                                <strong>Total: </strong>0$
                            </div>
                        </c:if>
                        <c:if test="${not empty sessionScope.CART}">
                            <div class="col-sm-2" style="padding-right: 0px;margin-left: 250px;">
                                <strong>Total : </strong>${requestScope.TOTAL}$
                                <input type="hidden" name="txtTotal" value="${requestScope.TOTAL}"/>
                            </div>
                        </c:if>
                        <c:if test="${not empty sessionScope.CART}">
                        <div class="col-sm-3" style="padding-left: 22px;margin-left: 30px;padding-right: 0px;">
                            <form action="DispatchServlet" method="POST">
                                <button type="summit" class="btn btn-primary" name="btAction" value="OrderYourCard" style="height: 40px;margin-right: 30px;">Purchase</button>
                                <button type="summit" class="btn btn-primary" name="btAction" value="DeleteCart" onclick="return confirm('Press OK to delete')" style="height: 40px; background-color: red;">Remove Cart</button>
                                <input type="hidden" name="txtID" value="1"/>
                                <input type="hidden" name="txtTotal" value="${requestScope.TOTAL}"/>
                                <input type="hidden" name="typeRemove" value="removeAll"/>
                            </form>		
                        </div>
                        </c:if>
                    </div>
                </div>
                <c:set var="proList" value="${requestScope.PROLIST}"/>
                <c:set var="cartObj" value="${sessionScope.CART}"/>
                <c:if test="${empty cartObj}">
                    <strong>You have nothing in your shopping cart. </strong>
                </c:if>
                <c:if test="${not empty cartObj}">
                    <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Total</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${not empty proList}">
                            <c:forEach items="${proList}" var="proDTO">
                                <c:forEach items="${cartObj.items}" var="cartDTO" varStatus="counter">
                                    <c:if test="${proDTO.proID == cartDTO.key}">
                                        <form action="DispatchServlet" method="POST">
                                            <tr>
                                                <input type="hidden" name="txtID" value="${proDTO.proID}" />
                                                <td>
                                                    <img src="image/${proDTO.image}" style="width: 100px; height: 100px;"/>
                                                </td>
                                                <td>${proDTO.proName}</td>
                                                <td><input type="text" name="txtQuantity" value="${cartDTO.value}" pattern="^[0-9]{0,3}$" title="It's a number and maximun 3 digit" required=""/></td>
                                                <td>${proDTO.price}$</td>
                                                <td>${proDTO.price * cartDTO.value}$</td>
                                                <td>
                                                    <c:set var="role" value="${sessionScope.AccDTO.role}"/>
                                                    <c:if test="${role != true}">
                                                        <button type="summit" class="btn btn-primary" name="btAction" value="UpdateCart" style=" width: 70px; height: 40px;">Update</button>
                                                        <button type="summit" class="btn btn-primary" name="btAction" value="DeleteCart" onclick="return confirm('Press OK to Delete !')" style=" width: 70px; height: 40px;">Delete</button>
                                                        <input type="hidden" name="typeRemove" value="removeOnePro"/>
                                                    </c:if>
                                                    <c:if test="${role == true}">
                                                        <button type="summit" class="btn btn-primary" name="btAction" disabled="" value="UpdateCart" style=" width: 70px; height: 40px;">Update</button>
                                                        <button type="summit" class="btn btn-primary" name="btAction" disabled="" value="DeleteCart" onclick="return confirm('Press OK to delete')" style=" width: 70px; height: 40px;">Delete</button>
                                                        <input type="hidden" name="typeRemove" value="removeOnePro"/>
                                                    </c:if>
                                                    
                                                </td>
                                            </tr>
                                        </form>
                                    </c:if>
                                </c:forEach>
                        </c:forEach>                            
                        </c:if>
                    </tbody>
                </table>
                </c:if>
            </div>
            </div>
    </body>
</html>
