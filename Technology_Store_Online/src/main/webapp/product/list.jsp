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
    <link href="/assets/css/style.css" rel="stylesheet">
    <link rel="shortcut icon" href="\assets\images\favicon.ico">

    <!-- Table datatable css -->
    <link href="\assets\libs\datatables\dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">

    <link href="\assets\libs\datatables\buttons.bootstrap4.min.css" rel="stylesheet" type="text/css">
    <link href="\assets\libs\datatables\responsive.bootstrap4.min.css" rel="stylesheet" type="text/css">
    <link href="\assets\libs\datatables\select.bootstrap4.min.css" rel="stylesheet" type="text/css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- App css -->
    <link href="\assets\css\bootstrap.min.css" rel="stylesheet" type="text/css" id="bootstrap-stylesheet">
    <link href="\assets\css\icons.min.css" rel="stylesheet" type="text/css">
    <link href="\assets\css\app.min.css" rel="stylesheet" type="text/css" id="app-stylesheet">
    <style>
        td {
            display: table-cell !important;
            vertical-align: middle !important; /* Important */
        }

        .price {
            color: #fe6f42;
            font-weight: bold;
        }
    </style>
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
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Tables</a></li>
                                        <li class="breadcrumb-item active">Data Tables</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">Data Tables</h4>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <div class="row">
                        <div class="col-12">
                            <div class="card-box">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <h4 class="header-title">LIST PRODUCT</h4>
                                    </div>
                                    <div class="col-sm-3"></div>
                                    <div class="col-sm-3">
                                        <a href="/products?action=create" class="btn btn-outline-primary btn-add" style="margin-left: 15px">
                                            <i class="fa fa-plus"></i> Add new Customer
                                        </a>
                                    </div>
                                </div>
                                <p></p>

                                <table id="datatable" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;text-align: center " >
                                    <thead>
                                    <tr>
                                        <th class="col-1">Id</th>
                                        <th class="col-1">Type</th>
                                        <th class="col-3">Name</th>
                                        <th class="col-2">Image</th>
                                        <th class="col-2">Amount</th>
                                        <th class="col-2">Price</th>
                                        <th class="col-1">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                       <c:forEach var="product" items="${products}">
                                                   <tr style="margin: 0 auto">
                                                       <td>${product.getId()}</td>
                                                       <td>${product.getType()}</td>
                                                       <td>${product.getName()}</td>
                                                       <td>
                                                           <img src="${product.getImage()}" width="120px" height="auto"/>
                                                       </td>
                                                       <td>${product.getAmount()}</td>
                                                       <td class="price">
                                                           <fmt:formatNumber type="currency" pattern="#,###₫" value="${product.getPrice()}" />
                                                       </td>
                                                       <td>
                                                           <a href="/products?action=edit&id=${product.id}" class="btn btn-outline-secondary">
                                                               <i class="fas fa-pen-square"></i>
                                                           </a>

                                                           <a href="/products?action=block&id=${product.id}" class="btn btn-outline-danger">
                                                               <i class="fa fa-ban"></i>
                                                           </a>
                                                       </td>
                                                   </tr>
                                       </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div> <!-- end row -->

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