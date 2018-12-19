<%-- 
    Document   : dataEdit
    Created on : Dec 16, 2018, 7:46:35 AM
    Author     : Mukhlish
--%>

<%@page import="java.util.Date"%>
<%@page import="daos.GeneralDAO"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="daos.DAOInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="entities.Employee"%>
<%@page import="controllers.EmployeeController"%>
<%@page import="controllers.EmployeeControllerInterface"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String NIK = "";
    String Name = "";
    String Email = "";
    String Password = "";
    String Phone = "";
    String HireDate = "";
    int Salary = 0;
    String JobId = "";
    String ManagerId = "";
    if (session.getAttribute("isiEmployee") != null) {
        Employee e = (Employee) session.getAttribute("isiEmployee");
        NIK = e.getNik();
        Name = e.getName();
        Email = e.getEmail();
        Password = e.getPassword();
        Phone = e.getPhoneNumber();
        HireDate = String.valueOf(e.getHireDate());
        Salary = e.getSalary();
        String[] newH = HireDate.split("-");
//        for (int i = 0; i < newH.length; i++) {
//                Date = newH[1] +"/"+ newH[2] +"/"+ newH[0];
//            }
        JobId = e.getJobId().getJobTitle();
        ManagerId = e.getManagerId().getNik();
    }
%>
<!--<link rel="stylesheet" href="css/editor/datetimepicker.css">-->
<link rel="stylesheet" href="css/datapicker/datepicker3.css">


<form method="POST" class="form-group" action="../AddEmployee">
    <div class="modal-body">
        <div class="form-group-inner">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <label class="login2 pull-right pull-right-pro">NIK</label>
                </div>
                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                    <input type="text" readonly class="form-control" name="nik" value="<%= NIK%>" />
                </div>
            </div>
        </div>

        <div class="form-group-inner">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <label class="login2 pull-right pull-right-pro">Name</label>
                </div>
                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                    <input type="text" class="form-control" name="name" value="<%= Name%>"/>
                </div>
            </div>
        </div>

        <div class="form-group-inner">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <label class="login2 pull-right pull-right-pro">Email</label>
                </div>
                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                    <input type="text" class="form-control" name="email" value="<%= Email%>"/>
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
                        <input type="text" class="form-control" data-mask="9999999999999" placeholder="" name="phoneNumber" value="<%= Phone%>">
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
                                <input type="text" class="form-control" name="hireDate" value="<%= HireDate %> ">
                            </div>
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
                    <div class="form-select-list">
                        <select class="form-control custom-select-value" name="jobTitle">
                            <option value="<%= JobId%>"><%= JobId%></option>
                            <option value="AD_PRES">President</option>
                            <option value="AD_VP">Administration Vice President</option>
                            <option value="AD_ASST">Administration Assistant</option>
                            <option value="FI_MGR">Finance Manager</option>
                            <option value="FI_ACCOUNT">Accountant</option>
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
                        <input type="text" class="form-control" placeholder="" name="salary" value="<%= Salary%>">
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
                            <option value="<%= ManagerId%>"><%= ManagerName%></option>
                            <% for (Object emp : eci.duplicatManagerId()) {
                                    Employee employee = (Employee) emp;
                            %>
                            <option value="<%= employee.getManagerId().getNik()%>"><%= employee.getManagerId().getName()%> </option>
                            <%}%>
                        </select>
                    </div>
                </div>
            </div>
        </div>

        <div>
            <input type="hidden" name="isDelete" value="0">
        </div>
        <div class="modal-footer">
            <button class="btn btn-custon-rounded-four btn-primary btn-lg" data-dismiss="modal" ">Cancel</button>
            <button type="submit" class="btn btn-custon-rounded-four btn-primary btn-lg" id="ASD" name="" onclick="swal('Oops!', 'Something went wrong on the page!', 'error')">Save</button>
        </div>
    </div>
</form>
<!-- datapicker JS
                   ============================================ -->
    <script src="js/datapicker/bootstrap-datepicker.js"></script>
    <script src="js/datapicker/datepicker-active.js"></script>