<%-- 
    Document   : managerProduct
    Created on : Sep 19, 2021, 1:00:06 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="style.css" type="text/css">
        <script src="javascript.js"></script>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
        <title>Music a shop</title>
    </head>
    <body>
        <c:if test="${empty sessionScope.NAME}">
            <Strong href="DispatchServlet"> You do not have permission</Strong>
            <a href="DispatchServlet"> Main Page</a>
        </c:if>

        <c:if test="${not empty sessionScope.NAME}">
            <c:set var="role" value="${sessionScope.AccDTO.role}"/>
            <c:if test="${role == false}">
                <Strong href="DispatchServlet"> You do not have permission</Strong>
                <a href="DispatchServlet"> Main Page</a>
            </c:if>
            <c:if test="${role == true}">
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
        <c:if test="${not empty SIGNAL}">
            <c:set var="signal" value="${SIGNAL}"/>
            <c:set var="successfull" value="successfull"/>
            <c:set var="failDate" value="failDate"/>
            <c:set var="fail" value="fail"/>
            <c:if test="${signal == successfull}">
                <div class="row">
                    <div class="col">
                        <div class="alert success" role="alert" style="padding:0px; padding-bottom: 3px;background-color: greenyellow">
                            <div class="col">
                                <strong>Edit Successfull!</strong>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close" style="padding-left: 100px;">
                                <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </div> 
                    </div>
                </div>                
            </c:if>
            <c:if test="${signal == fail}">
                <div class="row">
                    <div class="col">
                        <div class="alert success" role="alert" style="padding:0px; padding-bottom: 3px;background-color: red">
                            <div class="col">
                                <strong>Edit Fail!</strong>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close" style="padding-left: 100px;">
                                <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </div> 
                    </div>
                </div>                
            </c:if>
            <c:if test="${signal == failDate}">
                <div class="row">
                    <div class="col">
                        <div class="alert success" role="alert" style="padding:0px; padding-bottom: 3px;background-color: red">
                            <div class="col">
                                <strong>Expiration Date Is Invalid !!!</strong>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close" style="padding-left: 100px;">
                                <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </div> 
                    </div>
                </div>                
            </c:if>
        </c:if>
            </div>
                <%--
                <form action="DispatchServlet" method="POST" class="form-inline my-2 my-lg-0">
                    <div class="input-group input-group-sm">
                        <font class="show-txt" style="padding-right: 7px;color: white;padding-top: 3px;"> Price : </font>
                        <input type="text" name="min" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Min" required pattern="[0-9]+"/>
                        <input type="text" name="max" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Max" required pattern="[0-9]+"/>
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-secondary btn-number" name="btAction" value="SearchByPrice">
                                    <i class="fa fa-search"></i>
                                </button>
                        </div>
                    </div>
                </form>
                --%>
                <form action="DispatchServlet" method="POST" class="form-inline my-2 my-lg-0" style="width: 600px;margin-left: 30px;">
                    <div class="input-group input-group-sm">
                        <input type="text" name="txtSearch" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search..." required/>
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-secondary btn-number" name="btAction" value="Search">
                                    <i class="fa fa-search"></i>
                                </button>
                        </div>
                </form>
        </nav>
        
        <div class="container" style="margin: 0px 300px; padding: 0px;">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Course</b></h2>
                        </div>
                        <div class="col-sm-6" style="padding-left: 375px;">
                            <form action="DispatchServlet">
                                <input type="submit" class="btn btn-primary" value="AddCourse" name="btAction"  style="background-color: green; color: #ffffff"/>	  
                            </form>
                            				
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Image</th>
                            <th>Status</th>
                            <th>Is Delete</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${not empty PROLIST}">
                        <c:forEach items="${PROLIST}" var="o">
                            <form action="DispatchServlet" method="POST">
                            <tr>
                                <td>
                                    ${o.proID}
                                    <input type="hidden" name="txtID" value="${o.proID}" />
                                </td>
                                
                                <td>${o.proName}</td>
                                <td>${o.quantity}</td>
                                <td>${o.price}$</td>
                                <td>
                                    <img src="image/${o.image}"/>
                                </td>
                                <td>
                                <c:if test="${o.status == false}">
                                    Sold Out
                                </c:if>
                                <c:if test="${o.status == true}">
                                    Avaliable
                                </c:if>    
                                </td>
                                <td>${o.isDelete}</td>
                                <td>${o.startDate} </td>
                                <td>${o.endDate}</td>
                                <td>
                                    <c:if test="${empty INDEX}">
                                        <input type="hidden" value="1" name="index">
                                    </c:if>
                                    <c:if test="${not empty INDEX}">
                                        <input type="hidden" value="${INDEX}" name="index">
                                    </c:if>
                                    <button type="summit" class="btn btn-primary" name="btAction" value="Edit" style=" width: 70px; height: 40px; margin-bottom: 5px">Edit</button>
                                    <button type="summit" class="btn btn-primary" name="btAction" value="Delete" onclick="return confirm('Press OK to delete')" style=" width: 70px; height: 40px;">Delete</button>
                                </td>
                            </tr>
                            </form>
                        </c:forEach>                            
                        </c:if>
                    </tbody>
                </table>
            </div>
            <ul class="pagination justify-content-center" >
                                <% 
                                    String url="DispatchServlet?btAction=managerChange&index=";
                                %>
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
                            </ul>
            </div>
            <script src="javascript.js" type="text/javascript"></script>
            </c:if>
        

        </c:if>
    </body> 
</html>
