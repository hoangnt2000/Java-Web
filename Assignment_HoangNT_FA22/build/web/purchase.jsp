<%-- 
    Document   : purchase
    Created on : Sep 21, 2021, 7:27:23 PM
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
                    <div class="collapse navbar-collapse">
                        <font class="show-txt" color ="red"> Welcome ${sessionScope.NAME}</font>
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
                <form action="DispatchServlet" method="POST" class="form-inline my-2 my-lg-0">
                    <div class="input-group input-group-sm">
                        <font class="show-txt" style="padding-right: 7px;color: white;padding-top: 3px;"> Price : </font>
                        <input type="text" name="min" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Min" required pattern="[0-9]+"
                               title="Number Only"/>
                        <input type="text" name="max" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Max" required pattern="[0-9]+"
                               title="Number Only"/>
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-secondary btn-number" name="btAction" value="SearchByPrice">
                                    <i class="fa fa-search"></i>
                                </button>
                        </div>
                    </div>
                </form>
                <form action="DispatchServlet" method="POST" class="form-inline my-2 my-lg-0" style="width: 450px;margin-left: 30px;">
                    <div class="input-group input-group-sm">
                        <input type="text" name="txtSearch" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search..." required
                               title="Not blank"/>
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
        <c:set var="cartObj" value="${sessionScope.CART}"/>
                <c:if test="${empty cartObj}">
                    <strong>You have nothing in your shopping cart. </strong>
                </c:if>
                <c:if test="${not empty cartObj}">
                    <c:if test="${empty AccDTO}">
                        <form action="DispatchServlet" method="POST" style=" padding-left: 300px;"> 
                        <div class="container" style="padding-left: 0px; padding-right: 0px; margin: 0px 200px; ">
                            <div class="row" style="margin-right: 500px; width: 900px;">
                                <div class="col-sm-6"> 
                                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                        <input value="1" name="txtUserID" type="hidden"/>
                                        <Strong>Your Name: </Strong>  
                                        <input style="width: 350px;" value="" name="txtName"  type="text" id="inputEmail" class="form-control" pattern="([a-zA-Z\s]){0,50}" required=""
                                               title="Name Without Special Characters and in range 50 characters">
                                    </div>
                                </div>
                                <div class="col-sm-6"> 
                                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                        <Strong>Your Phone : </Strong> 
                                        <input style="width: 350px;" value="" name="txtPhone"  type="text" id="inputEmail" class="form-control" pattern="(0+[1-9]{9})" required
                                               title="Phone Number invalid">
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-right: 500px; width: 900px;">
                                <div class="col-sm-6"> 
                                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                        <Strong>Address:  </Strong>  
                                        <input style="width: 350px;" value="" name="txtAdd"  type="text" id="inputEmail" class="form-control" pattern="([a-zA-Z0-9\s]+[,]?){0,150}" required=""
                                               title="Address Without Special Characters">
                                    </div>
                                </div>
                                <div class="col-sm-6"> 
                                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                        <Strong >Payment :  </Strong> 
                                        <select name="txtPayment" style="width: 350px;margin-top: 7px;">
                                            <option selected="">Cash</option>
                                            <option>Credit card</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-right: 500px; width: 900px;">
                                <div class="col-sm-6"> 
                                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                        <strong>Total :</strong>
                                        <input name="txtPrice" value="${requestScope.TOTAL}" type="hidden">
                                        <a class="btn btn-number disabled" style=" color: black;width: 120px;height: 40px;margin-bottom: 5px;margin-top: 7px;"><strong>${requestScope.TOTAL} $</strong></a> 
                                    </div>
                                </div>
                                <div class="col-sm-6"> 
                                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                        <input name="txtType" value="notLogin" type="hidden">
                                        <button type="summit" class="btn btn-primary" name="btAction" value="Purchase" style=" width: 120px;height: 40px;margin-top: 70px;;margin-left: 300px;">Purchase</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>    
                    </c:if>
                    <c:if test="${not empty AccDTO}">
                        <form action="DispatchServlet" method="POST" style=" padding-left: 300px;"> 
                        <div class="container" style="padding-left: 0px; padding-right: 0px; margin: 0px 200px; ">
                            <div class="row" style="margin-right: 500px; width: 900px;">
                                <div class="col-sm-6"> 
                                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                        <input value="${AccDTO.ID}" name="txtUserID" type="hidden"/>
                                        <Strong>Your Name: </Strong>  
                                        <input style="width: 350px;" value="${AccDTO.fullname}" name="txtName"  type="text" id="inputEmail" class="form-control" pattern="([a-zA-Z\s]){0,50}" required=""
                                               title="Name Without Special Characters and in range 50 characters">
                                    </div>
                                </div>
                                <div class="col-sm-6"> 
                                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                        <Strong>Your Phone : </Strong> 
                                        <input style="width: 350px;" value="${AccDTO.phone}" name="txtPhone"  type="text" id="inputEmail" class="form-control" pattern="(0+[1-9]{9})" required
                                               title="Phone Number invalid">
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-right: 500px; width: 900px;">
                                <div class="col-sm-6"> 
                                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                        <Strong>Address:  </Strong>  
                                        <input style="width: 350px;" value="" name="txtAdd"  type="text" id="inputEmail" class="form-control" pattern="([a-zA-Z0-9\s]+[,]?){0,150}" required=""
                                               title="Address Without Special Characters">
                                    </div>
                                </div>
                                <div class="col-sm-6"> 
                                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                        <Strong >Payment :  </Strong> 
                                        <select name="txtPayment" style="width: 350px;margin-top: 7px;">
                                            <option selected="">Cash</option>
                                            <option>Credit card</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-right: 500px; width: 900px;">
                                <div class="col-sm-6"> 
                                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                        <strong>Total :</strong>
                                        <input name="txtPrice" value="${requestScope.TOTAL}" type="hidden">
                                        <a class="btn btn-number disabled"  name="txtPrice" style=" color: black;width: 120px;height: 40px;margin-bottom: 5px;margin-top: 7px;"><strong>${requestScope.TOTAL} $</strong></a> 
                                    </div>
                                </div>
                                <div class="col-sm-6"> 
                                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                        <input name="txtType" value="Logined" type="hidden">
                                        <button type="summit" class="btn btn-primary" name="btAction" value="Purchase" style=" width: 120px;height: 40px;margin-top: 70px;;margin-left: 300px;">Purchase</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>    
                    </c:if>
                </c:if>
    </body>
</html>
