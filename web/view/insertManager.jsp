<%-- 
    Document   : insertManager
    Created on : Dec 15, 2018, 4:09:19 PM
    Author     : Mukhlish
--%>

<%@page import="entities.Employee"%>
<%@page import="daos.GeneralDAO"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="daos.DAOInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Manager</title>
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
        <link rel="stylesheet" href="css/modals.css">
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

    </head>

    <body>

        <!--        <div class="sparkline11-graph">
                    <div class="input-knob-dial-wrap">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="chosen-select-single mg-b-20">
                                    <label>Basic Select</label>
                                    <select class="select2_demo_3 form-control">
                                        <option>Select</option>
        <%SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
            DAOInterface daoi = new GeneralDAO(sessionFactory);
            for (Object object : daoi.doDDL(new Employee(), "")) {
                Employee l = (Employee) object;
                //                System.out.println(e.getLastName());
        %>
                <option value="<%= l.getNik()%>"><%= l.getNik() + " " + l.getName()%></option>
        
        <%
            }
        %>

    </select>
</div>

</div>
</div>
</div>
</div>-->

        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="modal-bootstrap">
                    <h2>Header BG Color Modal</h2>
                    <p>Bootstrap provides an easy way to create predefined alert messages. They support a number of use cases from user notification to completely custom content and feature a handful of helpful subcomponents, sizes, and more.</p>
                    <div class="modal-area-button">
                        <a class="Primary mg-b-10" href="#" data-toggle="modal" data-target="#PrimaryModalhdbgcl">Primary</a>
                        <a class="Information Information-color mg-b-10" href="#" data-toggle="modal" data-target="#InformationproModalhdbgcl">Information</a>
                        <a class="Warning Warning-color mg-b-10" href="#" data-toggle="modal" data-target="#WarningModalhdbgcl">Warning</a>
                        <a class="Danger danger-color" href="#" data-toggle="modal" data-target="#DangerModalhdbgcl">Danger</a>
                        <a class="Alert Alert-color" href="#" data-toggle="modal" data-target="#AlertModalhdbgcl">Alert</a>
                    </div>
                </div>
                <div id="PrimaryModalhdbgcl" class="modal modal-adminpro-general default-popup-PrimaryModal fade" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header header-color-modal bg-color-1">
                                <h4 class="modal-title">BG Color Header Modal</h4>
                                <div class="modal-close-area modal-close-df">
                                    <a class="close" data-dismiss="modal" href="#"><i class="fa fa-close"></i></a>
                                </div>
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

