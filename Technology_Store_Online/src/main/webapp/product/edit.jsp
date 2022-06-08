<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 07/06/2022
  Time: 9:07 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Form Validation | Uplon - Responsive Bootstrap 4 Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Responsive bootstrap 4 admin template" name="description">
    <meta content="Coderthemes" name="author">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- App favicon -->
    <link rel="shortcut icon" href="\assets\images\favicon.ico">

    <!-- App css -->
    <link href="\assets\css\bootstrap.min.css" rel="stylesheet" type="text/css" id="bootstrap-stylesheet">
    <link href="\assets\css\icons.min.css" rel="stylesheet" type="text/css">
    <link href="\assets\css\app.min.css" rel="stylesheet" type="text/css" id="app-stylesheet">

</head>
<body>
<!-- Begin page -->
    <div id="wrapper">
        <%@ include file="/template.jsp"%>
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
                                <h2 class="page-title">Edit Product</h2>
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
                                            <h3 class="header-title"><i>Enter the information you want to change</i></h3>
                                            <p class="sub-header"></p>


                                            <form role="form" class="parsley-examples" data-parsley-validate="" novalidate="" method="post">
                                                <div class="form-group row">
<%--                                                    <label for="inputEmail3" class="col-md-2 col-form-label">Email<span class="text-danger">*</span></label>--%>
                                                    <label for="type" class="col-md-2 col-form-label">Type<span class="text-danger">*</span></label>
                                                    <div class="col-md-8">
<%--                                                        <input type="email" required="" parsley-type="email" class="form-control" id="inputEmail3" placeholder="Email">--%>
                                                        <select id="type" class="form-select valid form-control" name="type" aria-invalid="false">
                                                                <option value="điện thoại">Điện thoại</option>
                                                                <option value="laptop">Laptop</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="name" class="col-md-2 col-form-label">Name<span class="text-danger">*</span></label>
                                                    <div class="col-md-8">
                                                        <input name="name" id="name" type="text" placeholder="Name" required="" class="form-control" value="${product.getName()}">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="amount" class="col-md-2 col-form-label">Amount
                                                        <span class="text-danger">*</span></label>
                                                    <div class="col-md-8">
                                                        <input name="amount" type="number" required="" placeholder="Amount" class="form-control" id="amount" value="${product.getAmount()}">
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="price" class="col-md-2 form-control-label">Price<span class="text-danger">*</span></label>
                                                    <div class="col-md-8">
                                                        <input name="price" type="number" required=""  class="form-control" id="price" placeholder="Price" value="${product.getPrice()}">
                                                    </div>
                                                </div>

                                                <div class="form-group row justify-content-end">
                                                    <div class="col-md-10">
                                                        <button type="submit" class="btn btn-outline-primary waves-effect waves-light mr-1">
                                                            Update
                                                        </button>
                                                        <button type="reset" class="btn btn-outline-secondary waves-effect">
                                                            Cancel
                                                        </button>
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
                            2016 - 2019 © Uplon theme by <a href="">Coderthemes</a>
                        </div>
                    </div>

                    <c:choose>
                        <c:when test = "${requestScope['message'] == null}" >
                        </c:when>
                        <c:when test='${requestScope["message"] == "Cập nhật sản phẩm thành công!"}'>
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
            </footer>
            <!-- end Footer -->

        </div>
    </div
            <!-- END wrapper -->

            <!-- Right Sidebar -->
    <div class="right-bar">
        <div class="rightbar-title">
            <a href="javascript:void(0);" class="right-bar-toggle float-right">
                <i class="mdi mdi-close"></i>
            </a>
            <h4 class="font-18 m-0 text-white">Theme Customizer</h4>
        </div>
        <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 353px;"><div class="slimscroll-menu" style="overflow: hidden; width: auto; height: 353px;">

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
        </div><div class="slimScrollBar" style="background: rgb(158, 165, 171); width: 5px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 169.767px;"></div><div class="slimScrollRail" style="width: 5px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div> <!-- end slimscroll-menu-->
    </div>

    <!-- /Right-bar -->

    <!-- Right bar overlay-->
    <div class="rightbar-overlay"></div>

    <a href="javascript:void(0);" class="right-bar-toggle demos-show-btn">
        <i class="mdi mdi-settings-outline mdi-spin"></i> &nbsp;Choose Demos
    </a>


    <!-- Vendor js -->
    <script src="\assets\js\vendor.min.js"></script>

    <!-- Plugin js-->
    <script src="\assets\libs\parsleyjs\parsley.min.js"></script>

    <!-- Validation init js-->
    <script src="\assets\js\pages\form-validation.init.js"></script>

    <!-- App js -->
    <script src="\assets\js\app.min.js"></script>

</body>
</html>
