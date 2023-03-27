<%-- 
    Document   : moonCakeShop
    Created on : Sep 14, 2021, 3:48:04 PM
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
                                        <c:if test="${not empty FAIL}">  <!-- If login FAIL -->
                                            <div class="row">
                                                <div class="col">
                                                    <div class="alert success" role="alert" style="padding:0px; padding-bottom: 3px; background-color: red">
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
                                </form>
                            </div>                                                                       
                        </div>                                      
                    </div>                    
                </c:if>
                    <c:if test="${not empty FAIL}">  <!-- If login FAIL -->
                        <div class="row">
                            <div class="col">
                                <div class="alert success" role="alert" style="padding:0px; padding-bottom: 3px; background-color: red">
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
                <%--
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
                --%>
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
        <form action="DispatchServlet" method="POST">
            <% 
                String search ="1", txtSearch=""; int max =0, min =0;
                if (request.getAttribute("SEARCH") != null){
                   search = (String) request.getAttribute("SEARCH");
                   if(search.equals("byprice"))
                   {
                       max = (int) request.getAttribute("MAX");
                       min = (int) request.getAttribute("MIN");
                   }else if(search.equals("byname"))
                   {
                       txtSearch=(String) request.getAttribute("TXTSEARCH");
                   }else if(search.equals("byCate"))
                   {
                       txtSearch=(String) request.getAttribute("TXTSEARCH");
                   }
                }
                String url="DispatchServlet?btAction=changePage&txtSearch="+txtSearch+"&min="+min+"&max="+max+"&search="+search+"&index=";
            %>
            <div class="container" style="padding-left: 0px; padding-right: 0px; margin: 0px 300px; ">
                <div class="row">
                    <div class="col-sm-3">
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" style="width: 215px;"><i class="fa fa-list"></i> Categories</button>
                            <div class="dropdown-menu" style="padding: 0px;">
                                <c:set var="cid" value="0"/>
                                <c:if test="${not empty param.cateID}">
                                    <c:set var="cid" value="${CateID}"/>
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
                            </div>
                    </div>
                    <div class="col-sm-9" style="margin-bottom: 830px;">
                        <c:set var="note" value=""/>
                        <c:set var="notFound" value="notFound"/> 
                        <c:if test="${not empty NOTE}">
                            <c:set var="note" value="${requestScope.NOTE}"/>
                        </c:if>
                        <c:if test="${note == notFound}">
                            No results were found
                        </c:if>
                        <c:if test="${note != notFound}">
                            <div class="row">
                                <c:set var="page" value="1"/>
                                <c:if test="${not empty param.pages}">
                                    <c:set var="page" value="${param.pages}"/>
                                </c:if>
                                <c:set var="proList" value="${requestScope.PROLIST}"/>
                                <c:if test="${empty proList}">
                                     No results were found
                                </c:if>
                                <c:if test="${not empty proList}">
                                    <c:forEach items="${proList}" var="proDTO" varStatus="counter">
                                        
                                        <div class="col-12 col-md-6 col-lg-4 " >
                                            <form action="DispatchServlet" method="POST">
                                            <div class="card" style="width: 250px;height: 450px;">
                                                
                                                <img class="carf-img-top" src="image/${proDTO.image}" alt="${proDTO.image}" width="250px" height="230px"/>
                                                <div class="card-body">
                                                    <h4 class="card-title show-txt">
                                                        <input type="hidden" value="${proDTO.cateID}" name="cateID" />
                                                        <input type="hidden" value="${proDTO.proID}" name="txtProID" />
                                                            <a href="DispatchServlet?btAction=detail&proID=${proDTO.proID}" title="View Course">${proDTO.cate.cateName}</a>
                                                    </h4>
                                                    <p class="card-text show_txt">${proDTO.proName}</p>
                                                    <div class="row">
                                                        <div class="col" style="margin-top: 26px;width: 65px;padding-left: 0px;padding-right: 0px;">
                                                            <p class="bloc_left_price" style="color: red; width: 35px;height: 24px; margin-right: 0px">${proDTO.price}$</p>
                                                        </div>
                                                        <div class="col btn tbn-danger btn-block">
                                                            <c:if test="${proDTO.status == false}">
                                                                <button class="btn btn-info" disabled="disabled" type="submit" style="background-color: red; color: black">Sold Out</button>
                                                            </c:if>
                                                            <c:if test="${proDTO.status == true}">
                                                                    <c:set var="role" value="${sessionScope.AccDTO.role}"/>
                                                                    <c:if test="${role != true}">
                                                                        <input class="btn btn-info" type="submit" value="Order" name="btAction" />
                                                                    </c:if>
                                                                    <c:if test="${role == true}">
                                                                        <input class="btn btn-info" disabled="" type="submit" value="Order" name="btAction" />
                                                                    </c:if>
                                                                    
                                                                    <c:set var="index" value="${INDEX}"/>
                                                                    <input type="hidden" value="${index}" name="index" />
                                                                    <c:if test="${empty MAX}">
                                                                     <input type="hidden" value="${index}" name="min" />
                                                                     <input type="hidden" value="${index}" name="max" />
                                                                    </c:if>
                                                                     <c:if test="${not empty MAX}">
                                                                     <input type="hidden" value="${MIN}" name="min" />
                                                                     <input type="hidden" value="${MAX}" name="max" />
                                                                    </c:if>
                                                                    
                                                                    
                                                                    <c:if test="${empty SEARCH}">
                                                                     <input type="hidden" value="${index}" name="search" />
                                                                     <input type="hidden" value="${index}" name="txtSearch" />
                                                                    </c:if>
                                                                    <c:if test="${not empty SEARCH}">
                                                                     <input type="hidden" value="${SEARCH}" name="search" /> 
                                                                     <input type="hidden" value="${TXTSEARCH}" name="txtSearch" />
                                                                    </c:if>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                         
                        </div>
                            <ul class="pagination justify-content-center" style="margin-left: 570px">
                                <c:set var="cateList" value="${requestScope.CATELIST}"/>
                                <c:if test="${not empty param.cateID}">
                                    <c:set var="page" value="1"/>
                                    <c:if test="${not empty param.index}">
                                        <c:set var="page" value="${param.index}"/>
                                    </c:if>  
                                    <c:if test="${page == 1}">
                                        <li class="page-item disabled"><a class="page-link" href="#"><i>Back</i></a></li>
                                    </c:if>
                                    <c:if test="${ page != 1}">
                                        <li class="page-item"><a class="page-link" href="<%=url%>${page-1}&cateID=${param.cateID}"><i>Back</i></a></li>
                                    </c:if>                                
                                    <c:forEach begin="1" end="${ENDPAGE}" var="i">
                                        <c:if test="${i == page}">
                                            <li class="page-item "><a class="page-link" href="<%=url%>${i}&cateID=${param.cateID}" style="background-color: #99ffff">${i}</a></li>
                                        </c:if>
                                        <c:if test="${i != page}">
                                            <li class="page-item"><a class="page-link" href="<%=url%>${i}&cateID=${param.cateID}">${i}</a></li>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${page == ENDPAGE}">
                                        <li class="page-item disabled"><a class="page-link" href="#"><i class="next">Next</i></a></li>
                                    </c:if>
                                    <c:if test="${ page != ENDPAGE}">
                                        <li class="page-item"><a class="page-link" href="<%=url%>${page+1}&cateID=${param.cateID}"><i class="next">Next</i></a></li>
                                    </c:if>                               
                                </c:if>
                                <c:if test="${empty param.cateID}">
                                    <c:set var="page" value="1"/>
                                    <c:if test="${not empty param.index}">
                                        <c:set var="page" value="${param.index}"/>
                                    </c:if>  
                                    <c:if test="${page == 1}">
                                        <li class="page-item disabled"><a class="page-link" href="#"><i>Back</i></a></li>
                                    </c:if>
                                    <c:if test="${ page != 1}">
                                        <li class="page-item"><a class="page-link" href="<%=url%>${page-1}"><i>Back</i></a></li>
                                    </c:if>                                
                                    <c:forEach begin="1" end="${ENDPAGE}" var="i">
                                        <c:if test="${i == page}">
                                            <li class="page-item "><a class="page-link" href="<%=url%>${i}" style="background-color: #99ffff">${i}</a></li>
                                        </c:if>
                                        <c:if test="${i != page}">
                                            <li class="page-item"><a class="page-link" href="<%=url%>${i}">${i}</a></li>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${page == ENDPAGE}">
                                        <li class="page-item disabled"><a class="page-link" href="#"><i class="next">Next</i></a></li>
                                    </c:if>
                                    <c:if test="${ page != ENDPAGE}">
                                        <li class="page-item"><a class="page-link" href="<%=url%>${page+1}"><i class="next">Next</i></a></li>
                                    </c:if>                               
                                </c:if>
                            </ul>
                    </c:if>
                </div>
            </div>
        </form>
    </body>
</html>
