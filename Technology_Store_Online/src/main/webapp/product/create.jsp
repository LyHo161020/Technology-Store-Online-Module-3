<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 11/06/2022
  Time: 9:43 SA
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
                  <h2 class="page-title">Create Product</h2>
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
                            <h3 class="header-title"><i>Enter product information you want to add</i></h3>
                          </div>

                          <div class="col-lg-4">
                            <a href="/products" class="btn btn-outline-primary btn-add" style="margin-left: 15px">
                              <i class="fas fa-list"></i> Back to List Product
                            </a>
                          </div>
                        </div>

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
                              <input name="name" id="name" type="text" placeholder="Name" required="" class="form-control">
                            </div>
                          </div>

                          <div class="form-group row">
                            <label for="image" class="col-md-2 col-form-label">Image<span class="text-danger">*</span></label>
                            <div class="col-md-8">
                              <input name="image" id="image" type="text"  placeholder="Image" required="" class="form-control">
                            </div>
                          </div>

                          <div class="form-group row">
                            <label for="amount" class="col-md-2 col-form-label">Amount
                              <span class="text-danger">*</span></label>
                            <div class="col-md-8">
                              <input name="amount" type="number" required="" placeholder="Amount" class="form-control" id="amount">
                            </div>
                          </div>

                          <div class="form-group row">
                            <label for="price" class="col-md-2 form-control-label">Price<span class="text-danger">*</span></label>
                            <div class="col-md-8">
                              <input name="price" type="number" required=""  class="form-control" id="price" placeholder="Price">
                            </div>
                          </div>

                          <div class="form-group row justify-content-end">
                            <div class="col-md-10">
                              <button type="submit" class="btn btn-outline-success waves-effect waves-light mr-1">
                                <i class="fas fa-plus"> </i> Create
                              </button>

                              <a href="/products" class="btn btn-outline-secondary waves-effect">
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
                2016 - 2019 © Uplon theme by <a href="">Coderthemes</a>
              </div>
            </div>

            <c:choose>
              <c:when test = "${requestScope['message'] == null}" >
              </c:when>
              <c:when test='${requestScope["message"] == "Thêm sản phẩm thành công!"}'>
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

      <!-- ============================================================== -->
      <!-- End Page content -->
      <!-- ============================================================== -->

    </div>
    <!-- END wrapper -->


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

  <!-- Plugin js-->
  <script src="\assets\libs\parsleyjs\parsley.min.js"></script>

  <!-- Validation init js-->
  <script src="\assets\js\pages\form-validation.init.js"></script>


</body>
</html>
