<%-- 
    Document   : PageEmployee
    Created on : Dec 14, 2018, 11:19:22 AM
    Author     : Mukhlish
--%>

<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.List"%>
<%@page import="daos.GeneralDAO"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="daos.DAOInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="entities.Overtime"%>
<%@page import="entities.Presence"%>
<%@page import="controllers.OvertimeControllerInterface"%>
<%@page import="controllers.OvertimeController"%>
<%@page import="controllers.PresenceController"%>
<%@page import="controllers.PresenceControllerInterface"%>
<%@page import="entities.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String name = "", nik = "", email = "", phoneNumber = "", hireDate = "", jobId = "", managerId = "";
    int duration = 0;
    if (session.getAttribute("dataEmployee") != null) {
        Employee e = (Employee) session.getAttribute("dataEmployee");
        name = e.getName();
        nik = e.getNik();
        email = e.getEmail();
        phoneNumber = e.getPhoneNumber();
        hireDate = e.getHireDate().toString();
        jobId = e.getJobId().getJobId() + "  -  " + e.getJobId().getJobTitle();
        managerId = e.getManagerId().getNik() + "  -  " + e.getManagerId().getName();

        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        PresenceControllerInterface pci = new PresenceController(sessionFactory);
        DAOInterface daoi = new GeneralDAO(sessionFactory);
        String id = String.valueOf(daoi.getMaxPresence(new Presence(), nik));
        Object o = pci.getById(id);
        List<Presence> al = (List<Presence>) o;
        Presence p = null;
        for (int i = 0; i < al.size(); i++) {
            System.out.println(al.get(i));
            p = al.get(i);
        }
        String s = String.valueOf(p.getCheckIn());

        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        String dates = String.valueOf(timestamp);
        String times = dates.substring(11, 13);

        System.out.println(times);
        int f = Integer.parseInt(times);
        duration = f - 17;
        System.out.println(duration);
    } else {
        response.sendRedirect("Login.jsp");
    }
%>
<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Employee</title>
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
        <link rel="stylesheet" href="css/form/all-type-forms.css">

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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <script type="text/javascript">
            $(window).on('load', function () {
                $('#InformationproModalftblack').modal('show');
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('[id="overtimes"]').click(function () {
                    $.get("../overtime", function (HASIL, status) {
                        $("#overtimeData").html(HASIL);
                        $("#overtimeData").modal('show');
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
                                <a class="has-arrow" href="mailbox.html" aria-expanded="false"><i class="fa big-icon fa-envelope icon-wrap"></i> <span class="mini-click-non">Workspace</span></a>
                                <ul class="submenu-angle" aria-expanded="false">
                                    <li><a title="My Profil" href="PageEmployeeProfile.jsp"><i class="fa fa-inbox sub-icon-mg" aria-hidden="true"></i> <span class="mini-sub-pro">Profile</span></a></li>
                                    <li><a title="My Presence" href=""><i class="fa fa-television sub-icon-mg" aria-hidden="true"></i> <span class="mini-sub-pro">Presence</span></a></li>
                                    <li><a id="overtimes" title="overtime data" href="PageEmployeeOvertime.jsp"><i class="fa fa-paper-plane sub-icon-mg" aria-hidden="true"></i> <span class="mini-sub-pro" >Overtime</span></a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </nav>
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
                                                            <span class="admin-name"> <%= name%> </span>
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
                                                            <li><a class="Primary mg-b-10" href="#" data-toggle="modal" data-target="#logoutModal"><span class="fa fa-lock author-log-ic " href="#" data-toggle="modal" data-target="#logoutModal" name="logout"></span>Log Out</a>

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
                                            <li><a data-toggle="collapse" data-target="#Charts" href="#">Home <span class="admin-project-icon adminpro-icon adminpro-down-arrow"></span></a>
                                                <ul class="collapse dropdown-header-top">
                                                    <li><a href="index.html">Dashboard v.1</a></li>
                                                    <li><a href="index-1.html">Dashboard v.2</a></li>
                                                    <li><a href="index-3.html">Dashboard v.3</a></li>
                                                    <li><a href="product-list.html">Product List</a></li>
                                                    <li><a href="product-edit.html">Product Edit</a></li>

                                                </ul>
                                            </li>
                                            <li><a data-toggle="collapse" data-target="#demo" href="#">Mailbox <span class="admin-project-icon adminpro-icon adminpro-down-arrow"></span></a>
                                                <ul id="demo" class="collapse dropdown-header-top">
                                                    <li><a href="mailbox.html">Inbox</a>
                                                    </li>
                                                    <li><a href="mailbox-view.html">View Mail</a>
                                                    </li>
                                                    <li><a href="mailbox-compose.html">Compose Mail</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li><a data-toggle="collapse" data-target="#others" href="#">Miscellaneous <span class="admin-project-icon adminpro-icon adminpro-down-arrow"></span></a>
                                                <ul id="others" class="collapse dropdown-header-top">
                                                    <li><a href="file-manager.html">File Manager</a></li>
                                                    <li><a href="contacts.html">Contacts Client</a></li>
                                                    <li><a href="projects.html">Project</a></li>
                                                    <li><a href="project-details.html">Project Details</a></li>
                                                    <li><a href="blog.html">Blog</a></li>
                                                    <li><a href="blog-details.html">Blog Details</a></li>
                                                    <li><a href="404.html">404 Page</a></li>
                                                    <li><a href="500.html">500 Page</a></li>
                                                </ul>
                                            </li>

                                            <li><a data-toggle="collapse" data-target="#Pagemob" href="#">Pages <span class="admin-project-icon adminpro-icon adminpro-down-arrow"></span></a>
                                                <ul id="Pagemob" class="collapse dropdown-header-top">
                                                    <li><a href="login.html">Login</a>
                                                    </li>
                                                    <li><a href="register.html">Register</a>
                                                    </li>
                                                    <li><a href="lock.html">Lock</a>
                                                    </li>
                                                    <li><a href="password-recovery.html">Password Recovery</a>
                                                    </li>
                                                </ul>
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
            <div class="data-table-area mg-tb-15">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="col-lg-12">
                                <div class="">
                                    <div class="modal-area-button">
                                        <!--<a class="Primary mg-b-10" href="#" data-toggle="modal" data-target="#PrimaryModalhdbgcl">Add New</a>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="sparkline13-list"> 
                        <div style="height: 700px">
                            <h1>Employee Profile</h1><br><br>
                            <div class="basic-login-form-ad">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="all-form-element-inner">
                                            <form action="#">
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                                            <label class="login2 pull-right pull-right-pro">NIK :</label>
                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                                            <input type="text" class="form-control" value="<%= nik%>" readonly="true"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                                            <label class="login2 pull-right pull-right-pro">Name :</label>
                                                        </div>
                                                        <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                                                            <input type="text" class="form-control" value="<%= name%>" readonly="true"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                                            <label class="login2 pull-right pull-right-pro">Email :</label>
                                                        </div>
                                                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
                                                            <input type="text" class="form-control" value="<%= email%>" readonly="true"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                                            <label class="login2 pull-right pull-right-pro">Phone Number :</label>
                                                        </div>
                                                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
                                                            <input type="text" class="form-control" value="<%= phoneNumber%>" readonly="true"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                                            <label class="login2 pull-right pull-right-pro">Hire Date :</label>
                                                        </div>
                                                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
                                                            <input type="text" class="form-control" value="<%= hireDate%>" readonly="true"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                                            <label class="login2 pull-right pull-right-pro">Job Title :</label>
                                                        </div>
                                                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
                                                            <input type="text" class="form-control" value="<%= jobId%>" readonly="true"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                                            <label class="login2 pull-right pull-right-pro">Manager :</label>
                                                        </div>
                                                        <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                                                            <input type="text" class="form-control" value="<%= managerId%>" readonly="true"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>
                                                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                            <button class="btn btn-info" class="Primary mg-b-10" href="#" data-toggle="modal" data-target="#editModal"><span href="#" data-toggle="modal" data-target="#editModal" name="logout"></span>Edit</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                                        
                            <!--Edit Modal-->                            
                            <div id="editModal" class="modal modal-adminpro-general default-popup-PrimaryModal fade" role="dialog">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header header-color-modal bg-color-1">
                                            <h4 class="modal-title">Edit Profile</h4>
                                            <div class="modal-close-area modal-close-df">
                                                <a class="close" data-dismiss="modal" href="#"><i class="fa fa-close"></i></a>
                                            </div>
                                        </div>
                                        <form method="POST" action="../editEmp?nik=<%= nik%>">
                                            <div class="modal-body">
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-3 col-xs-12">
                                                            <label class="login2">NIK</label>
                                                        </div>
                                                        <div class="col-lg-9 col-md-8 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" value="<%= nik%>" readonly="true"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-3 col-xs-12">
                                                            <label class="login2">Name</label>
                                                        </div>
                                                        <div class="col-lg-9 col-md-8 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" value="<%= name%>"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-3 col-xs-12">
                                                            <label class="login2">Email</label>
                                                        </div>
                                                        <div class="col-lg-9 col-md-8 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" value="<%= email%>"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-3 col-xs-12">
                                                            <label class="login2">Phone Number</label>
                                                        </div>
                                                        <div class="col-lg-9 col-md-8 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" value="<%= phoneNumber%>"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-3 col-xs-12">
                                                            <label class="login2">Hire Date</label>
                                                        </div>
                                                        <div class="col-lg-9 col-md-8 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" value="<%= hireDate%>" readonly="true"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-3 col-xs-12">
                                                            <label class="login2">Job Title</label>
                                                        </div>
                                                        <div class="col-lg-9 col-md-8 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" value="<%= jobId%>" readonly="true"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-3 col-xs-12">
                                                            <label class="login2">Manager</label>
                                                        </div>
                                                        <div class="col-lg-9 col-md-8 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" value="<%= managerId%>" readonly="true"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button class="btn btn-custon-rounded-four btn-primary btn-lg" data-dismiss="modal" ">Cancel</button>
                                                    <button type="submit" class="btn btn-custon-rounded-four btn-primary btn-lg" id="ASD" name="" onclick="swal('Oops!', 'Something went wrong on the page!', 'error')">Save</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!--end edit modal-->
                            
                            <!--logout modal -->
                            <div id="logoutModal" class="modal modal-adminpro-general default-popup-PrimaryModal fade" role="dialog">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header header-color-modal bg-color-1">
                                            <h4 class="modal-title">Overtime Form</h4>
                                            <div class="modal-close-area modal-close-df">
                                                <a class="close" data-dismiss="modal" href="#"><i class="fa fa-close"></i></a>
                                            </div>
                                        </div>
                                        <form method="POST" action="../logOut?nik=<%= nik%>">
                                            <div class="modal-body">

                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-3 col-xs-12">
                                                            <label class="login2">Description</label>
                                                        </div>
                                                        <div class="col-lg-9 col-md-8 col-sm-9 col-xs-12">
                                                            <textarea type="text" class="form-control" placeholder="Description" name="Description"></textarea>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                                                            <label class="login2">duration</label>
                                                        </div>
                                                        <div class="col-lg-2 col-md-8 col-sm-8 col-xs-12 form-group-inner">
                                                            <input type="text" class="text-info form-control" placeholder="" name="durasi" value="<%= duration%>" readonly/> 
                                                        </div>
                                                        <div class="col-lg-1 col-md-4 col-sm-4 col-xs-12">
                                                            <label class="login2">jam</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button class="btn btn-custon-rounded-four btn-primary btn-lg" data-dismiss="modal" ">Cancel</button>
                                                    <button type="submit" class="btn btn-custon-rounded-four btn-primary btn-lg" id="ASD" name="" onclick="swal('Oops!', 'Something went wrong on the page!', 'error')">Save</button>
                                                    <button type="submit" class="btn btn-custon-rounded-four btn-primary btn-lg" id="ASD" name="" onclick="swal('Oops!', 'Something went wrong on the page!', 'error')">Later</button>
                                                </div>
                                                <!--                                <button type="submit" class="btn btn-default" id="ASD" name="" onclick="swal('Oops!', 'Something went wrong on the page!', 'error')">Save</button>
                                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!--end logout modal-->

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Static Table Start -->
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

</body>

</html>

