<%-- 
    Document   : PageAdmin
    Created on : Dec 15, 2018, 7:39:59 AM
    Author     : tikamhrdk
--%>

<%@page import="daos.GeneralDAO"%>
<%@page import="daos.DAOInterface"%>
<%@page import="entities.Employee"%>
<%@page import="controllers.EmployeeController"%>
<%@page import="controllers.EmployeeControllerInterface"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String Nama = "", Nik = "";
    if (session.getAttribute("dataEmployee") != null) {
        Employee e = (Employee) session.getAttribute("dataEmployee");
        Nama = e.getName();
        Nik = e.getNik();
    } else {
        response.sendRedirect("Login.jsp");
    }
%>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Admin | Admin</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- favicon
                    ============================================ -->
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
        <!-- Google Fonts
                    ============================================ -->
        <link href="https://fonts.googleapis.com/css?family=Play:400,700" rel="stylesheet">
        <!-- Bootstrap CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Bootstrap CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- owl.carousel CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/owl.theme.css">
        <link rel="stylesheet" href="css/owl.transitions.css">
        <!-- animate CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- normalize CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/normalize.css">
        <!-- meanmenu icon CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/meanmenu.min.css">
        <!-- main CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/main.css">
        <!-- morrisjs CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/morrisjs/morris.css">
        <!-- mCustomScrollbar CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/scrollbar/jquery.mCustomScrollbar.min.css">
        <!-- metisMenu CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/metisMenu/metisMenu.min.css">
        <link rel="stylesheet" href="css/metisMenu/metisMenu-vertical.css">
        <!-- calendar CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/calendar/fullcalendar.min.css">
        <link rel="stylesheet" href="css/calendar/fullcalendar.print.min.css">
        <!-- x-editor CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/editor/select2.css">
        <link rel="stylesheet" href="css/editor/datetimepicker.css">
        <link rel="stylesheet" href="css/editor/bootstrap-editable.css">
        <link rel="stylesheet" href="css/editor/x-editor-style.css">
        <!-- normalize CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/data-table/bootstrap-table.css">
        <link rel="stylesheet" href="css/data-table/bootstrap-editable.css">
        <!-- style CSS
                    ============================================ -->
        <link rel="stylesheet" href="style.css">
        <!-- responsive CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- modernizr JS
                    ============================================ -->
        <script src="js/vendor/modernizr-2.8.3.min.js"></script>
        <!-- modals CSS
                ============================================ -->
        <link rel="stylesheet" href="css/modals.css">
        <!-- style CSS
                    ============================================ -->
        <!-- datapicker CSS
                ============================================ -->
        <link rel="stylesheet" href="css/datapicker/datepicker3.css">
        <!-- forms CSS
                ============================================ -->
        <link rel="stylesheet" href="css/form/themesaller-forms.css">
        <!-- select2 CSS
                ============================================ -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- buat modal
                ============================================ -->
        <link rel="stylesheet" href="css/select2/select2.min.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
        <script src="bower_components/sweetalert2/dist/sweetalert2.all.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
        <script src="bower_components/sweetalert2/dist/sweetalert2.min.js"></script>
        <link rel="stylesheet" href="bower_components/sweetalert2/dist/sweetalert2.min.css">

        <script type="text/javascript">
            $(document).ready(function () {
                $('[id="Details"]').click(function () {
                    var nik = $(this).attr('value');
                    $.get("../editEmp?nik=" + nik, function (HASIL, status) {
                        $("#detailhasil").html(HASIL);
                        $('#EditData').modal('show');
                    });
                });
            });
        </script>
    </head>

    <body>
        <!--[if lt IE 8]>
                <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
            <![endif]-->

        <div class="left-sidebar-pro">
            <nav id="sidebar" class="">
                <div class="sidebar-header"><br><br>
                    <a href="index.html"><img style="width: 120px;" class="main-logo" src="https://www.metrodata.co.id/web/images/business/2014-08-20-112626.png" alt="" /></a>
                    <strong><img src="img/logo/logosn.png" alt="" /></strong><br><br>
                </div>
                <div class="left-custom-menu-adp-wrap comment-scrollbar">
                    <nav class="sidebar-nav left-sidebar-menu-pro">
                        <ul class="metismenu" id="menu1">
                            <li>
                                <a class="has-arrow" href="mailbox.html" aria-expanded="false"><i class="fa big-icon fa-envelope icon-wrap"></i> <span class="mini-click-non">Employee</span></a>
                                <ul class="submenu-angle" aria-expanded="false">
                                    <li><a title="Profil Emloyee" href="PageAdmin.jsp"><i class="fa fa-inbox sub-icon-mg" aria-hidden="true"></i> <span class="mini-sub-pro">Profile Employee</span></a></li>
                                    <li><a title="Data Presence" href="PageAdminPresence.jsp"><i class="fa fa-television sub-icon-mg" aria-hidden="true"></i> <span class="mini-sub-pro">Presence</span></a></li>
                                    <li><a id="overtimes" href="PageAdminOvertime.jsp" title="Data overtime"><i class="fa fa-paper-plane sub-icon-mg" aria-hidden="true"></i> <span class="mini-sub-pro" >Overtime</span></a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </nav>
        </div>
        <!-- Mobile Menu end -->
        <div class="breadcome-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Start Welcome area -->
    <div class="all-content-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="logo-pro">
                        <a href="index.html"><img class="main-logo" src="img/logo/logo.png" alt="" /></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-advance-area">
            <div class="header-top-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="header-top-wraper">
                                <div class="row">
                                    <div class="col-lg-1 col-md-0 col-sm-1 col-xs-12">
                                        <div class="menu-switcher-pro">
                                            <button type="button" id="sidebarCollapse" class="btn bar-button-pro header-drl-controller-btn btn-info navbar-btn">
                                                <i class="fa fa-bars"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-7 col-sm-6 col-xs-12">
                                        <div class="header-top-menu tabl-d-n">

                                        </div>
                                    </div>
                                    <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                        <div class="header-right-info">
                                            <ul class="nav navbar-nav mai-top-nav header-right-menu">


                                                <li class="nav-item">
                                                    <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle">
                                                        <i class="fa fa-user adminpro-user-rounded header-riht-inf" aria-hidden="true"></i>
                                                        <span class="admin-name"> <%= Nama%> </span>
                                                        <i class="fa fa-angle-down adminpro-icon adminpro-down-arrow"></i>
                                                    </a>
                                                    <ul role="menu" class="dropdown-header-top author-log dropdown-menu animated zoomIn">
                                                        <li><a href="register.html"><span class="fa fa-home author-log-ic"></span>Register</a>
                                                        </li>
                                                        <li><a href="#"><span class="fa fa-user author-log-ic"></span>My Profile</a>
                                                        </li>
                                                        <li><a href="lock.html"><span class="fa fa-diamond author-log-ic"></span> Lock</a>
                                                        </li>
                                                        <li><a href="#"><span class="fa fa-cog author-log-ic"></span>Settings</a>
                                                        </li>
                                                        <li><a href="../Logout1?nik=<%= Nik%>"><span class="fa fa-lock author-log-ic"></span>Log Out</a>
                                                        </li>
                                                    </ul>
                                                </li>

                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Mobile Menu start -->
            <div class="mobile-menu-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="mobile-menu">
                                <nav id="dropdown">
                                    <ul class="mobile-menu-nav">
                                        <li><a data-toggle="collapse" data-target="#Charts" href="#">Employee <span class="admin-project-icon adminpro-icon adminpro-down-arrow"></span></a>
                                            <ul class="collapse dropdown-header-top">
                                                <li><a href="index.html">Dashboard v.1</a></li>
                                                <li><a href="index-1.html">Dashboard v.2</a></li>
                                                <li><a href="index-3.html">Dashboard v.3</a></li>
                                                <li><a href="product-list.html">Product List</a></li>
                                            </ul>
                                        </li>

                                        <li><a href="lock.html">Lock</a>

                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Mobile Menu end -->
        </div>

        <div id="overtimeData"></div>

        <!-- Static Table Start -->
        <!-- Static Table Start -->
        <div class="data-table-area mg-tb-15">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="col-lg-12">
                            <div class="">
                                <div class="modal-area-button">
                                    <a class="Primary mg-b-10" href="#" data-toggle="modal" data-target="#PrimaryModalhdbgcl">Add New</a>
                                </div>
                            </div>
                        </div>
                        <div id="PrimaryModalhdbgcl" class="modal modal-adminpro-general default-popup-PrimaryModal fade" role="dialog">
                            <div class="modal-dialog">

                                <div class="modal-content">
                                    <div class="modal-header header-color-modal bg-color-1">
                                        <h4 class="modal-title">Add New Employee</h4>
                                        <div class="modal-close-area modal-close-df">
                                            <a class="close" data-dismiss="modal" href="#"><i class="fa fa-close"></i></a>
                                        </div>
                                    </div>
                                    <form method="POST" class="form-group" action="../AddEmployee">
                                        <div class="modal-body">
                                            <div class="form-group-inner">
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                        <label class="login2 pull-right pull-right-pro">NIK</label>
                                                    </div>
                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                        <%  SessionFactory factory = HibernateUtil.getSessionFactory();
                                                            DAOInterface daoi = new GeneralDAO(factory);
                                                            String max = String.valueOf(daoi.getMax(new Employee(), "nik"));
                                                            int nik = Integer.parseInt(max);
                                                            int newNik = nik + 1;
                                                            String nikInc = String.valueOf(newNik);
                                                            //                                                    System.out.println(nikInc); %>
                                                        <input type="text" readonly class="form-control" name="nik" value="<%= nikInc%>" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group-inner">
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                        <label class="login2 pull-right pull-right-pro">Name</label>
                                                    </div>
                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                        <input type="text" class="form-control" name="name"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group-inner">
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                        <label class="login2 pull-right pull-right-pro">Email</label>
                                                    </div>
                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                        <input type="text" class="form-control" name="email"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group-inner">
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                        <label class="login2 pull-right pull-right-pro">Phone</label>
                                                    </div>
                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                        <div class="input-mark-inner mg-b-22">
                                                            <input type="text" class="form-control" data-mask="9999999999999" placeholder="" name="phoneNumber">
                                                            <!--<span class="help-block">(999) 999-9999</span>-->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group-inner">
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                        <label class="login2 pull-right pull-right-pro">Hire Date</label>
                                                    </div>
                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                        <div class="input-mark-inner mg-b-22">
                                                            <div class="form-group data-custon-pick" id="data_2">

                                                                <div class="input-group date">
                                                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                                    <input type="text" class="form-control" name="hireDate">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group-inner">
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                        <label class="login2 pull-right pull-right-pro">Manager</label>
                                                    </div>
                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                        <div class="form-select-list">
                                                            <select class="form-control custom-select-value" name="jobTitle">
                                                                <option value="AD_PRES">President</option>
                                                                <option value="AD_VP">Administration Vice President</option>
                                                                <option value="AD_ASST">Administration Assistant</option>
                                                                <option value="FI_MGR">Finance Manager</option>
                                                                <option value="FI_ACCOUNT">Accountant</option>
                                                                <option value="AC_MGR">Accounting Manager</option>
                                                                <option value="AC_ACCOUNT">Public Accountant</option>
                                                                <option value="SA_MAN">Sales Manager</option>
                                                                <option value="SA_REP">Sales Representative</option>
                                                                <option value="PU_MAN">Purchasing Manager</option>
                                                                <option value="PU_CLERK">Purchasing Clerk</option>
                                                                <option value="ST_MAN">Stock Manager</option>
                                                                <option value="ST_CLERK">Stock Clerk</option>
                                                                <option value="SH_CLERK">Shipping Clerk</option>
                                                                <option value="IT_PROG">Programmer</option>
                                                                <option value="MK_MAN">Marketing Manager</option>
                                                                <option value="MK_REP">Marketing Representative</option>
                                                                <option value="HR_REP">Human Resources Representative</option>
                                                                <option value="PR_REP">Public Relations Representative</option>

                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="form-group-inner">
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                        <label class="login2 pull-right pull-right-pro">Salary</label>
                                                    </div>
                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                        <div class="mg-b-22">
                                                            <input type="text" class="form-control" placeholder="" name="salary">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="form-group-inner">
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                        <label class="login2 pull-right pull-right-pro">Position</label>
                                                    </div>
                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                        <div class="form-select-list">
                                                            <select class="form-control custom-select-value" name="roleId">
                                                                <option value="Admin"> </option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group-inner">
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                        <label class="login2 pull-right pull-right-pro">Manager</label>
                                                    </div>
                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                        <div class="form-select-list">
                                                            <select class="form-control custom-select-value" name="managerId">
                                                               
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div>
                                                <input type="hidden" name="isDelete" value="0">
                                            </div>



                                        </div>

                                        <div class="modal-footer">
                                            <button class="btn btn-custon-rounded-four btn-primary btn-lg" data-dismiss="modal" ">Cancel</button>
                                            <button type="submit" class="btn btn-custon-rounded-four btn-primary btn-lg" id="ASD" name="" onclick="swal('Oops!', 'Something went wrong on the page!', 'error')">Save</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div id="EditData" class="modal fade" role="dialog">
                            <div class="modal-dialog">
                                <!-- konten modal-->
                                <div class="modal-content">
                                    <!-- heading modal -->
                                    <div class="modal-header">

                                        <h4 class="modal-title">Edit Data</h4>
                                    </div>
                                    <!-- body modal -->
                                    <div class="modal-body">

                                        <div id="detailhasil">  

                                        </div>
                                    </div>
                                    <!-- footer modal -->

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div id="PrimaryModalblbgpro" class="modal modal-adminpro-general default-popup-PrimaryModal PrimaryModal-bgcolor fade" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-close-area modal-close-df">
                                <a class="close" data-dismiss="modal" href="#"><i class="fa fa-close"></i></a>
                            </div>
                            <div class="modal-body">
                                <i class="fa fa-check modal-check-pro"></i>
                                <h2>Awesome!</h2>
                                <p>The Modal plugin is a dialog box/popup window that is displayed on top of the current page</p>
                            </div>
                            <div class="modal-footer">
                                <a data-dismiss="modal" href="#">Cancel</a>
                                <a href="#">Process</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sparkline13-list">
                    <div class="sparkline13-hd">
                        <div class="main-sparkline13-hd">
                            <h1>Employees <span class="table-project-n">Data</span> Table</h1>
                        </div>
                    </div>
                    <div class="sparkline13-graph">
                        <div class="datatable-dashv1-list custom-datatable-overright">
                            <div style="height: 700px">
                                <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
                                       data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
                                    <thead>
                                        <tr>
                                            <th data-field="state" data-checkbox="true"></th>
                                            <th data-field="no">No</th>
                                            <th data-field="id">NIK</th>
                                            <th data-field="name" data-editable="true">Name</th>
                                            <th data-field="email" data-editable="true">Email</th>
                                            <th data-field="phoneNumber" data-editable="true">Phone Number</th>
                                            <th data-field="hireDate" data-editable="true">Hire Date</th>
                                            <th data-field="salary" data-editable="true">Salary</th>
                                            <th data-field="isAdmin" data-editable="true">Is Admin</th>
                                            <th data-field="isDelete" data-editable="true">Is Delete</th>
                                            <th data-field="isActive" data-editable="true">Is Active</th>
                                            <th data-field="jobId" data-editable="true">Job Id</th>
                                            <th data-field="managerId" data-editable="true">Manager Id</th>
                                            <th data-field="action"  >Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%  int no = 0;
                                                                    EmployeeControllerInterface eci = new EmployeeController(factory);
                                                                    
                                            for (Object emp : eci.search("")) {
                                                Employee employee = (Employee) emp;
                                                no++;
                                                //                                                    Date hire = employees.getHireDate();%>

                                        <tr>
                                            <td></td>
                                            <td><%= no%></td>
                                            <td><%= employee.getNik()%></td>
                                            <td><%= employee.getName()%></td>
                                            <td><%= employee.getEmail()%></td>
                                            <td><%= employee.getPhoneNumber()%></td>
                                            <td><%= employee.getHireDate()%></td>
                                            <td><%= employee.getSalary()%></td>
                                            <td><%= employee.getIsAdmin()%> </td>
                                            <td><%= employee.getIsDelete()%></td>
                                            <td><%= employee.getIsActive()%></td>
                                            <td><%= employee.getJobId().getJobTitle()%></td>
                                            <td><%= employee.getManagerId()%></td>
                                            
                                            <td><a class="btn btn-info" id="Details" data-toggle="modal" value="<%= employee.getNik()%>" >Edit</a>
                                                <a id="Deletes" href="../DeleteEmployee?nik=<%= employee.getNik()%>" class="btn btn-warning">Delete</a>
                                            </td>

                                        </tr>
                                        <% }%>
                                    </tbody>
                                </table>
                            </div>
                            <!-- Modal -->
                            <div id="EditData" class="modal modal-adminpro-general default-popup-PrimaryModal PrimaryModal-bgcolor fade" role="dialog">
                                <div class="modal-dialog">
                                    <!-- konten modal-->
                                    <div class="modal-content">
                                        <!-- heading modal -->
                                        <div class="modal-header">

                                            <h4 class="modal-title">Edit Data</h4>
                                        </div>
                                        <!-- body modal -->
                                        <div class="modal-body">

                                            <div id="detailhasil">  

                                            </div>
                                        </div>
                                        <!-- footer modal -->

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Static Table End -->

        <div class="footer-copyright-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer-copy-right">
                            <p>Copyright © 2018 <a href="">Bootcamp21</a> made with LOVE.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <!-- jquery
                ============================================ -->
    <script src="js/vendor/jquery-1.11.3.min.js"></script>
    <!-- bootstrap JS
                ============================================ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- wow JS
                ============================================ -->
    <script src="js/wow.min.js"></script>
    <!-- price-slider JS
                ============================================ -->
    <script src="js/jquery-price-slider.js"></script>
    <!-- meanmenu JS
                ============================================ -->
    <script src="js/jquery.meanmenu.js"></script>
    <!-- owl.carousel JS
                ============================================ -->
    <script src="js/owl.carousel.min.js"></script>
    <!-- sticky JS
                ============================================ -->
    <script src="js/jquery.sticky.js"></script>
    <!-- scrollUp JS
                ============================================ -->
    <script src="js/jquery.scrollUp.min.js"></script>
    <!-- mCustomScrollbar JS
                ============================================ -->
    <script src="js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/scrollbar/mCustomScrollbar-active.js"></script>
    <!-- metisMenu JS
                ============================================ -->
    <script src="js/metisMenu/metisMenu.min.js"></script>
    <script src="js/metisMenu/metisMenu-active.js"></script>
    <!-- data table JS
                ============================================ -->
    <script src="js/data-table/bootstrap-table.js"></script>
    <script src="js/data-table/tableExport.js"></script>
    <script src="js/data-table/data-table-active.js"></script>
    <script src="js/data-table/bootstrap-table-editable.js"></script>
    <script src="js/data-table/bootstrap-editable.js"></script>
    <script src="js/data-table/bootstrap-table-resizable.js"></script>
    <script src="js/data-table/colResizable-1.5.source.js"></script>
    <script src="js/data-table/bootstrap-table-export.js"></script>
    <!--  editable JS
                ============================================ -->
    <script src="js/editable/jquery.mockjax.js"></script>
    <script src="js/editable/mock-active.js"></script>
    <script src="js/editable/select2.js"></script>
    <script src="js/editable/moment.min.js"></script>
    <script src="js/editable/bootstrap-datetimepicker.js"></script>
    <script src="js/editable/bootstrap-editable.js"></script>
    <script src="js/editable/xediable-active.js"></script>
    <!-- Chart JS
                ============================================ -->
    <script src="js/chart/jquery.peity.min.js"></script>
    <script src="js/peity/peity-active.js"></script>
    <!-- tab JS
                ============================================ -->
    <script src="js/tab.js"></script>
    <!-- plugins JS
                ============================================ -->
    <script src="js/plugins.js"></script>
    <!-- main JS
                ============================================ -->
    <script src="js/main.js"></script>
    <!-- morrisjs JS
           ============================================ -->
    <script src="js/sparkline/jquery.sparkline.min.js"></script>
    <script src="js/sparkline/jquery.charts-sparkline.js"></script>
    <!-- calendar JS
                ============================================ -->
    <script src="js/calendar/moment.min.js"></script>
    <script src="js/calendar/fullcalendar.min.js"></script>
    <script src="js/calendar/fullcalendar-active.js"></script>
    <!-- datapicker JS
                   ============================================ -->
    <script src="js/datapicker/bootstrap-datepicker.js"></script>
    <script src="js/datapicker/datepicker-active.js"></script>
    <!-- input-mask JS
                    ============================================ -->
    <script src="js/input-mask/jasny-bootstrap.min.js"></script>
    <!-- select2 JS
                    ============================================ -->
    <script src="js/select2/select2.full.min.js"></script>
    <script src="js/select2/select2-active.js"></script>
</body>
<script>
                                                jQuery(document).ready(function ($) {
                                                    $('[id="Deletes"]').click(function () {
                                                        var getLink = $(this).attr('href');
                                                        swal({
                                                            title: 'Are you sure?',
                                                            text: "You won't be able to revert this!",
                                                            type: 'warning',
                                                            showCancelButton: true,
                                                            confirmButtonColor: '#3085d6',
                                                            cancelButtonColor: '#d33',
                                                            confirmButtonText: 'Yes, delete it!'
                                                        }, function () {

                                                            window.location.href = getLink;
                                                        });
                                                        return false;
                                                    });
                                                });
</script>

</html>

