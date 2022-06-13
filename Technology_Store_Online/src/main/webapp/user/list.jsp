<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/06/2022
  Time: 9:06 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Responsive Table | Uplon - Responsive Bootstrap 4 Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Responsive bootstrap 4 admin template" name="description">
    <meta content="Coderthemes" name="author">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- App favicon -->
    <link rel="shortcut icon" href="\assets\images\favicon.ico">

    <!-- Responsive Table css -->
    <link href="\assets\libs\rwd-table\rwd-table.min.css" rel="stylesheet" type="text/css">

    <!-- App css -->
    <link href="\assets\css\bootstrap.min.css" rel="stylesheet" type="text/css" id="bootstrap-stylesheet">
    <link href="\assets\css\icons.min.css" rel="stylesheet" type="text/css">
    <link href="\assets\css\app.min.css" rel="stylesheet" type="text/css" id="app-stylesheet">
    <link href="/assets/css/style.css">
</head>

<body>

<!-- Begin page -->
<div id="wrapper">
    <%@include file="/template.jsp" %>

    <!-- Topbar Start -->
 
    <!-- end Topbar -->


    <!-- ========== Left Sidebar Start ========== -->
    <!-- Left Sidebar End -->

    <!-- ============================================================== -->
    <!-- Start Page Content here -->
    <!-- ============================================================== -->

    <div class="content-page">
        <div class="content">

            <!-- Start Content-->
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Uplon</a></li>
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Tables</a></li>
                                    <li class="breadcrumb-item active">Responsive Table</li>
                                </ol>
                            </div>
                            <h4 class="page-title">List User</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-12">
                        <div class="card-box">
                            <div class="responsive-table-plugin">
                                <div class="table-rep-plugin">
                                    <div class="table-responsive" data-pattern="priority-columns">
                                        <table id="tech-companies-1" class="table table-striped">
                                            <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th data-priority="1">UserName</th>
                                                <th data-priority="3">Password</th>
                                                <th data-priority="1">Name</th>
                                                <th data-priority="3">Phone</th>
                                                <th data-priority="3">Email</th>
                                                <th data-priority="6">Address</th>
                                                <th data-priority="6">Status</th>
                                                <th data-priority="6">Role</th>
                                                <th data-priority="6">Action</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                               <c:forEach var="user" items="${users}">
                                                   <tr>
                                                       <td>${user.getId()}</td>
                                                       <td data-priority="1">${user.getUsername()}</td>
                                                       <td data-priority="3">${user.getPassword()}</td>
                                                       <td data-priority="1">${user.getName()}</td>
                                                       <td data-priority="3">${user.getPhone()}</td>
                                                       <td data-priority="3">${user.getEmail()}</td>
                                                       <td data-priority="6">${user.getAddress()}</td>
                                                       <td data-priority="6">${user.getStatus()}</td>
                                                       <td data-priority="6">${user.getRole()}</td>
                                                       <td>

                                                           <c:choose>
                                                               <c:when test = "${user.getStatus() == 'block'}">
                                                                   <a href="/users?action=block&id=${user.getId()}" class="btn btn-outline-danger">
                                                                       <i class="fas fa-unlock"></i>
                                                                   </a>
                                                               </c:when>
                                                               <c:otherwise>
                                                                   <a href="/users?action=block&id=${user.getId()}" class="btn btn-outline-danger">
                                                                       <i class="fas fa-lock"></i>
                                                                   </a>
                                                               </c:otherwise>
                                                           </c:choose>



                                                       </td>
                                                   </tr>
                                               </c:forEach>
                                            </tbody>
                                        </table>
                                    </div> <!-- end .table-responsive -->

                                </div> <!-- end .table-rep-plugin-->
                            </div> <!-- end .responsive-table-plugin-->
                        </div> <!-- end card-box -->
                    </div> <!-- end col -->
                </div>
                <!-- end row -->

            </div> <!-- end container-fluid -->

        </div> <!-- end content -->



        <!-- Footer Start -->
        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        2016 - 2019 &copy; Uplon theme by <a href="">Coderthemes</a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- end Footer -->

    </div>

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->

</div>
<!-- END wrapper -->

<!-- Right Sidebar -->
<div class="right-bar">
    <div class="rightbar-title">
        <a href="javascript:void(0);" class="right-bar-toggle float-right">
            <i class="mdi mdi-close"></i>
        </a>
        <h4 class="font-18 m-0 text-white">Theme Customizer</h4>
    </div>
    <div class="slimscroll-menu">

        <div class="p-4">
            <div class="alert alert-warning" role="alert">
                <strong>Customize </strong> the overall color scheme, layout, etc.
            </div>
            <div class="mb-2">
                <img src="\assets\images\layouts\light.png" class="img-fluid img-thumbnail" alt="">
            </div>
            <div class="custom-control custom-switch mb-3">
                <input type="checkbox" class="custom-control-input theme-choice" id="light-mode-switch" checked="">
                <label class="custom-control-label" for="light-mode-switch">Light Mode</label>
            </div>

            <div class="mb-2">
                <img src="\assets\images\layouts\dark.png" class="img-fluid img-thumbnail" alt="">
            </div>
            <div class="custom-control custom-switch mb-3">
                <input type="checkbox" class="custom-control-input theme-choice" id="dark-mode-switch" data-bsstyle="\assets/css/bootstrap-dark.min.css" data-appstyle="\assets/css/app-dark.min.css">
                <label class="custom-control-label" for="dark-mode-switch">Dark Mode</label>
            </div>

            <div class="mb-2">
                <img src="\assets\images\layouts\rtl.png" class="img-fluid img-thumbnail" alt="">
            </div>
            <div class="custom-control custom-switch mb-5">
                <input type="checkbox" class="custom-control-input theme-choice" id="rtl-mode-switch" data-appstyle="\assets/css/app-rtl.min.css">
                <label class="custom-control-label" for="rtl-mode-switch">RTL Mode</label>
            </div>

            <a href="https://1.envato.market/XY7j5" class="btn btn-danger btn-block mt-3" target="_blank"><i class="mdi mdi-download mr-1"></i> Download Now</a>
        </div>
    </div> <!-- end slimscroll-menu-->
</div>
<!-- /Right-bar -->

<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>

<a href="javascript:void(0);" class="right-bar-toggle demos-show-btn">
    <i class="mdi mdi-settings-outline mdi-spin"></i> &nbsp;Choose Demos
</a>

<!-- Vendor js -->
<script src="\assets\js\vendor.min.js"></script>

<!-- Responsive Table js -->
<script src="\assets\libs\rwd-table\rwd-table.min.js"></script>

<!-- Init js -->
<script src="\assets\js\pages\responsive-table.init.js"></script>

<!-- App js -->
<script src="\assets\js\app.min.js"></script>

</body>
</html>
