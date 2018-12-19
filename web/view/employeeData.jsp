<%-- 
    Document   : employeeData
    Created on : Dec 13, 2018, 4:49:36 PM
    Author     : AD
--%>

<%@page import="entities.Employee"%>
<%@page import="daos.GeneralDAO"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="daos.DAOInterface" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <link rel="stylesheet" href="css/select2/select2.min.css">
    </head>
    <body>
        <%
            String nik = "";
            String name = "";
            String phoneNumber = "";
            String hireDate = "";
            String jobTitle = "";
            String salary = "";
            String roleId = "";
            String managerId = "";
            if (session.getAttribute("isiEmployee") != null) {
                Employee e = (Employee) session.getAttribute("isiEmployee");
                nik = e.getNik();
                name = e.getName();
                phoneNumber = e.getPhoneNumber();
                hireDate = e.getHireDate().toString();
                jobTitle = e.getJobTitle();
                roleId = e.getRoleId().getRoleName();
                managerId = e.getManagerId().getName();

            }

        %>
        <form method="POST" action="../addLocation">
            <div id="PrimaryModalhdbgcl" class="modal modal-adminpro-general default-popup-PrimaryModal fade" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header header-color-modal bg-color-1">
                            <h4 class="modal-title">Add New Employee</h4>
                            <div class="modal-close-area modal-close-df">
                                <a class="close" data-dismiss="modal" href="#"><i class="fa fa-close"></i></a>
                            </div>
                        </div>
                        <div class="modal-body">
                            <div class="form-group-inner">
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <label class="login2 pull-right pull-right-pro">NIK</label>
                                    </div>
                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                        <input type="text" disabled class="form-control" value = "<%= nik%>"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group-inner">
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <label class="login2 pull-right pull-right-pro">Name</label>
                                    </div>
                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                        <input type="text" class="form-control" />
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
                                            <input type="text" class="form-control" data-mask="9999999999999" placeholder="">
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
                                            <div class="input-group date">
                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                <input type="text" class="form-control" value="08/09/2017">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group-inner">
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <label class="login2 pull-right pull-right-pro">Job Title</label>
                                    </div>
                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                        <div class="input-mark-inner mg-b-22">
                                            <div class="chosen-select-single mg-b-20">
                                                <select data-placeholder="Choose a Country..." class="chosen-select" tabindex="-1">
                                                    <option value="">Select</option>
                                                    <option value="United States">United States</option>
                                                    <option value="United Kingdom">United Kingdom</option>
                                                    <option value="Afghanistan">Afghanistan</option>
                                                    <option value="Aland Islands">Aland Islands</option>
                                                    <option value="Albania">Albania</option>
                                                </select>
                                            </div>
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
                                        <div class="input-mark-inner mg-b-22">
                                            <input type="text" class="form-control" data-mask="9999999999999" placeholder="">
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
                                        <div class="input-mark-inner mg-b-22">
                                            <div class="chosen-select-single mg-b-20">
                                                <select data-placeholder="Choose a Country..." class="chosen-select" tabindex="-1">
                                                    <option value="">Select</option>
                                                    <option value="United States">United States</option>
                                                    <option value="United Kingdom">United Kingdom</option>
                                                    <option value="Afghanistan">Afghanistan</option>
                                                    <option value="Aland Islands">Aland Islands</option>
                                                    <option value="Albania">Albania</option>
                                                </select>
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
                                        <div class="input-mark-inner mg-b-22">
                                            <div class="chosen-select-single mg-b-20">


                                                <select data-placeholder="Choose a Country..." class="chosen-select" tabindex="-1">
                                                    <option value="">Select</option>
                                                    <option value="United States">United States</option>
                                                    <option value="United Kingdom">United Kingdom</option>
                                                    <option value="Afghanistan">Afghanistan</option>
                                                    <option value="Aland Islands">Aland Islands</option>
                                                    <option value="Albania">Albania</option>
                                                </select>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>

                        <div class="modal-footer">
                            <a data-dismiss="modal" href="#">Cancel</a>
                            <a href="#">Process</a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <% session.removeAttribute("isiEmployee");%>
    </body>
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
</html>
