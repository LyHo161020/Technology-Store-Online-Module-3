<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/06/2022
  Time: 2:00 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Datatables | Uplon - Responsive Bootstrap 4 Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Responsive bootstrap 4 admin template" name="description">
    <meta content="Coderthemes" name="author">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- App favicon -->
    <link rel="shortcut icon" href="\assets\images\favicon.ico">

    <!-- Table datatable css -->
    <link href="\assets\libs\datatables\dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">

    <link href="\assets\libs\datatables\buttons.bootstrap4.min.css" rel="stylesheet" type="text/css">
    <link href="\assets\libs\datatables\responsive.bootstrap4.min.css" rel="stylesheet" type="text/css">
    <link href="\assets\libs\datatables\select.bootstrap4.min.css" rel="stylesheet" type="text/css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- App css -->
    <link href="/assets/css/style.css" rel="stylesheet">
    <link href="\assets\css\bootstrap.min.css" rel="stylesheet" type="text/css" id="bootstrap-stylesheet">
    <link href="\assets\css\icons.min.css" rel="stylesheet" type="text/css">
    <link href="\assets\css\app.min.css" rel="stylesheet" type="text/css" id="app-stylesheet">


</head>

<body>

<!-- Begin page -->
    <div id="wrapper">

        <%@include file="/template.jsp"%>
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
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Forms</a></li>
                                        <li class="breadcrumb-item active">Form Validation</li>
                                    </ol>
                                </div>
                                <h2 class="page-title">Delete User</h2>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <div class="row">
                        <div class="col-12">
                            <div class="card-box">

                                <div class="row">

                                    <div class="col-lg-12">
                                        <div class="mt-4 mt-lg-0">
                                            <div class="row">
                                                <div class="col-lg-8">
                                                    <h3 class="header-title"><i>Please confirm to delete this user</i></h3>
                                                </div>

                                                <div class="col-lg-3">
                                                    <a href="/users" class="btn btn-outline-primary btn-add" style="margin-left: 15px">
                                                        <i class="fas fa-list"></i> Back to List User
                                                    </a>
                                                </div>
                                            </div>

                                            <p class="sub-header"></p>


                                            <form role="form" class="parsley-examples" data-parsley-validate="" novalidate="" method="post">

                                                <div class="form-group row">
                                                    <label for="userName" class="col-md-2 col-form-label">Username<span class="text-danger">*</span></label>
                                                    <div class="col-md-8">
                                                        <input disabled name="userName" id="userName" type="text" placeholder="Username" required="" class="form-control" value="${user.getUsername()}">
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="password" class="col-md-2 col-form-label">Password
                                                        <span class="text-danger">*</span></label>
                                                    <div class="col-md-8">
                                                        <input disabled name="password" type="text" required="" placeholder="Password" class="form-control" id="password" value="${user.getPassword()}">
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="name" class="col-md-2 form-control-label">Name<span class="text-danger">*</span></label>
                                                    <div class="col-md-8">
                                                        <input disabled name="price" type="text" required=""  class="form-control" id="name" placeholder="Name" value="${user.getName()}">
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="phone" class="col-md-2 form-control-label">Phone<span class="text-danger">*</span></label>
                                                    <div class="col-md-8">
                                                        <input disabled name="phone" type="text" required=""  class="form-control" id="phone" placeholder="Phone" value="${user.getPhone()}">
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="email" class="col-md-2 form-control-label">Email<span class="text-danger">*</span></label>
                                                    <div class="col-md-8">
                                                        <input disabled name="email" type="text" required=""  class="form-control" id="email" placeholder="Email" value="${user.getEmail()}">
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="address" class="col-md-2 form-control-label">Address<span class="text-danger">*</span></label>
                                                    <div class="col-md-8">
                                                        <input disabled name="address" type="text" required=""  class="form-control" id="address" placeholder="Address" value="${user.getAddress()}">
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="status" class="col-md-2 col-form-label">Status<span class="text-danger">*</span></label>
                                                    <div class="col-md-8">

                                                        <select id="status" class="form-select valid form-control" name="status" aria-invalid="false">
                                                            <c:choose>
                                                                <c:when test = "${user.getStatus() == 'block'}">
                                                                    <option value="block" selected disabled>Block</option>
                                                                    <option value="unlock" disabled>Unlock</option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="block" disabled>Block</option>
                                                                    <option value="unlock" selected disabled>Unlock</option>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="role" class="col-md-2 col-form-label">Role<span class="text-danger">*</span></label>
                                                    <div class="col-md-8">

                                                        <select id="role" class="form-select valid form-control" name="role" aria-invalid="false">
                                                            <c:choose>
                                                                <c:when test = "${user.getRole() == 'USER'}">
                                                                    <option value="USER" selected disabled>USER</option>
                                                                    <option value="ADMIN" disabled>ADMIN</option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="USER" disabled>USER</option>
                                                                    <option value="ADMIN" selected disabled>ADMIN</option>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </select>
                                                    </div>
                                                </div>



                                                <div class="form-group row justify-content-end">
                                                    <div class="col-md-10">
                                                        <c:choose>
                                                            <c:when test = "${user.getStatus() == 'block'}">
                                                                <button type="submit" class="btn btn-outline-success waves-effect waves-light mr-1">
                                                                    <i class="fas fa-unlock"></i> </i> Unlock
                                                                </button>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <button type="submit" class="btn btn-outline-danger waves-effect waves-light mr-1">
                                                                    <i class="fas fa-lock"></i> </i> Block
                                                                </button>
                                                            </c:otherwise>
                                                        </c:choose>

                                                        <a href="/users" class="btn btn-outline-secondary waves-effect">
                                                            Cancel
                                                        </a>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                                <!-- end row -->

                            </div>
                        </div><!-- end col-->

                    </div>
                    <!-- end row -->

                </div> <!-- end container-fluid -->

            </div> <!-- end content -->



            <!-- Footer Start -->
            <footer class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <c:choose>
                                <c:when test = "${requestScope['message'] == null}" >
                                </c:when>
                                <c:when test='${requestScope["message"] == "Khoá người dùng thành công!"}'>
                                    <%@ include file="/alert/success.jsp"%>
                                </c:when>
                                <c:when test='${requestScope["message"] == "Mở khoá người dùng thành công!"}'>
                                    <%@ include file="/alert/success.jsp"%>
                                </c:when>
                                <c:otherwise>
                                    <%@ include file="/alert/warning.jsp"%>
                                </c:otherwise>
                            </c:choose>

                            <c:if test='${requestScope["errors"] != null}'>
                                <%@ include file="/alert/danger.jsp"%>
                            </c:if>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            2016 - 2019 © Uplon theme by <a href="">Coderthemes</a>
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

    <!-- Datatable plugin js -->
    <script src="\assets\libs\datatables\jquery.dataTables.min.js"></script>
    <script src="\assets\libs\datatables\dataTables.bootstrap4.min.js"></script>

    <script src="\assets\libs\datatables\dataTables.responsive.min.js"></script>
    <script src="\assets\libs\datatables\responsive.bootstrap4.min.js"></script>

    <script src="\assets\libs\datatables\dataTables.buttons.min.js"></script>
    <script src="\assets\libs\datatables\buttons.bootstrap4.min.js"></script>

    <script src="\assets\libs\jszip\jszip.min.js"></script>
    <script src="\assets\libs\pdfmake\pdfmake.min.js"></script>
    <script src="\assets\libs\pdfmake\vfs_fonts.js"></script>

    <script src="\assets\libs\datatables\buttons.html5.min.js"></script>
    <script src="\assets\libs\datatables\buttons.print.min.js"></script>

    <script src="\assets\libs\datatables\dataTables.keyTable.min.js"></script>
    <script src="\assets\libs\datatables\dataTables.select.min.js"></script>

    <!-- Datatables init -->
    <script src="\assets\js\pages\datatables.init.js"></script>

    <!-- App js -->
    <script src="\assets\js\app.min.js"></script>

</body>
</html>

