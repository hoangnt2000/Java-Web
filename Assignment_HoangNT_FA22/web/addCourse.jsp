<%-- 
    Document   : addProduct
    Created on : Sep 20, 2021, 1:19:49 PM
    Author     : nguye
--%>
<%@page import="java.util.Date"%>
<%@page import="hoangnt.Product.ProductDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
        <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="style.css" type="text/css">
        <script src="javascript.js" type="text/javascript"></script>
        <title>Music Shop</title>
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
            </div>
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
        </nav>
                    <form action="DispatchServlet" method="POST" style=" padding-left: 300px;"> 
                    <c:set var="supDTO" value="${SUPLIST}"/>
                    <c:set var="cateDTO" value="${CATELIST}"/>
                        <div class="container" style="padding-left: 0px; padding-right: 0px; margin: 0px 200px; ">
                            <div class="row" style="margin-right: 500px; width: 900px;">
                                <div class="col-sm-6"> 
                                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                        <Strong>Course ID: </Strong>  
                                        <input style="width: 350px;" value="" name="txtID"  type="text" id="inputEmail" class="form-control" readonly>
                                        <input value="${sessionScope.AccDTO.ID}" name="txtUserID" type="hidden"/>
                                    </div>
                                </div>
                                <div class="col-sm-6"> 
                                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                        <Strong>Course Name: </Strong> 
                                        <input style="width: 350px;" value="" name="txtName"  type="text" id="inputEmail" class="form-control" autofocus="" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-right: 500px; width: 900px;">
                                <div class="col-sm-6"> 
                                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                        <Strong style="padding-right: 50px;">Supplier Name: </Strong> </br>
                                        <select name="txtSupName" style="width: 350px;">
                                            <c:forEach var="sdto" items="${supDTO}">
                                                <option>
                                                 ${sdto.companyName}   
                                                </option>
                                            </c:forEach>
                                        </select></br>
                                    </div>
                                </div>
                                <div class="col-sm-6"> 
                                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                        <Strong style="padding-right: 39px;">Category Name : </Strong></br>
                                        <select name="txtCateName" style="width: 350px;">
                                            <c:forEach var="cdto" items="${cateDTO}">
                                                <option>
                                                 ${cdto.cateName}   
                                                </option>
                                            </c:forEach>
                                        </select><br>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-right: 500px; width: 900px;">
                                <div class="col-sm-6"> 
                                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                        <Strong>Quantity Unit: </Strong>
                                        <input style="width: 350px;" value="" name="txtQuantity"  type="text" id="inputEmail" class="form-control" required pattern="[0-9]+">
                                    </div>
                                </div>
                                <div class="col-sm-6"> 
                                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                        <Strong>Unit Price: </Strong>
                                        <input style="width: 350px;" value="" name="txtPrice"  type="text" id="inputEmail" class="form-control" required pattern="[0-9]+">
                                    </div>
                                </div>
                            </div> 
                            <div class="row" style="margin-right: 500px; width: 900px;">
                                <div class="col-sm-6" style="padding-top: 27px;"> 
                                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                        <div class="form-group">
                                            <input type="file" class="form-control-file border" name="file" style="width: 350px;" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-right: 500px;width: 900px;"> 
                                <div class="col-sm-6"> 
                                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                        <Strong style="padding-right: 50px;">Status: </Strong></br>
                                        <select name="txtStatus" >
                                            <option selected="">Avaliable</option>
                                            <option>Sold Out</option>
                                        </select></br>    
                                    </div>
                                </div>
                                <div class="col-sm-6"> 
                                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                        <Strong>Delete: </Strong></br>
                                        <select name="txtDelete" >
                                            <option >Yes</option>
                                            <option selected="">No</option>
                                        </select></br> 
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-right: 500px; width: 900px;">
                                <div class="col-sm-6"> 
                                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                        <Strong class="control-label" for="datepicker-start">Start Date</Strong>
                                        <input type="date" class="form-control" width="220" value="" name="txtStart" required>
                                    </div>
                                </div>
                                <div class="col-sm-6"> 
                                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                        <Strong class="control-label" for="datepicker-end">End Date</Strong>
                                         <input type="date" class="form-control" width="220" value="" name="txtEnd" required>
                                    </div>
                                </div>
                            </div>
                        <button type="summit" class="btn btn-primary" name="btAction" value="Create" style=" width: 140px;height: 40px;margin-bottom: 5px;margin-left: 700px;">Create Course</button>
                        </div>
                        
                    </form> 
            </c:if>
                       
        </c:if>

    </body>
</html>
