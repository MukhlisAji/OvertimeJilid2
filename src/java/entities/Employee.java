/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Nitro 5
 */
@Entity
@Table(name = "employee")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Employee.findAll", query = "SELECT e FROM Employee e")
    , @NamedQuery(name = "Employee.findByNik", query = "SELECT e FROM Employee e WHERE e.nik = :nik")
    , @NamedQuery(name = "Employee.findByName", query = "SELECT e FROM Employee e WHERE e.name = :name")
    , @NamedQuery(name = "Employee.findByEmail", query = "SELECT e FROM Employee e WHERE e.email = :email")
    , @NamedQuery(name = "Employee.findByPassword", query = "SELECT e FROM Employee e WHERE e.password = :password")
    , @NamedQuery(name = "Employee.findByPhoneNumber", query = "SELECT e FROM Employee e WHERE e.phoneNumber = :phoneNumber")
    , @NamedQuery(name = "Employee.findByHireDate", query = "SELECT e FROM Employee e WHERE e.hireDate = :hireDate")
    , @NamedQuery(name = "Employee.findBySalary", query = "SELECT e FROM Employee e WHERE e.salary = :salary")
    , @NamedQuery(name = "Employee.findByIsAdmin", query = "SELECT e FROM Employee e WHERE e.isAdmin = :isAdmin")
    , @NamedQuery(name = "Employee.findByIsDelete", query = "SELECT e FROM Employee e WHERE e.isDelete = :isDelete")
    , @NamedQuery(name = "Employee.findByIsActive", query = "SELECT e FROM Employee e WHERE e.isActive = :isActive")})
public class Employee implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "nik")
    private String nik;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @Column(name = "password")
    private String password;
    @Basic(optional = false)
    @Column(name = "phoneNumber")
    private String phoneNumber;
    @Basic(optional = false)
    @Column(name = "hireDate")
    @Temporal(TemporalType.DATE)
    private Date hireDate;
    @Basic(optional = false)
    @Column(name = "salary")
    private int salary;
    @Basic(optional = false)
    @Column(name = "isAdmin")
    private boolean isAdmin;
    @Basic(optional = false)
    @Column(name = "isDelete")
    private boolean isDelete;
    @Column(name = "isActive")
    private Boolean isActive;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "nik", fetch = FetchType.LAZY)
    private List<Timesheet> timesheetList;
    @JoinColumn(name = "jobId", referencedColumnName = "jobId")
    @ManyToOne(fetch = FetchType.LAZY)
    private Job jobId;
    @OneToMany(mappedBy = "managerId", fetch = FetchType.LAZY)
    private List<Employee> employeeList;
    @JoinColumn(name = "managerId", referencedColumnName = "nik")
    @ManyToOne(fetch = FetchType.LAZY)
    private Employee managerId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "nik", fetch = FetchType.LAZY)
    private List<Presence> presenceList;

    public Employee() {
    }

    public Employee(String nik) {
        this.nik = nik;
    }

    public Employee(String nik, String name, String email, String password, String phoneNumber, Date hireDate, int salary, boolean isAdmin, boolean isDelete, Boolean isActive, Job jobId, Employee managerId) {
        this.nik = nik;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.hireDate = hireDate;
        this.salary = salary;
        this.isAdmin = isAdmin;
        this.isDelete = isDelete;
        this.isActive = isActive;
        this.jobId = jobId;
        this.managerId = managerId;
    }
    
    public Employee(String nik, String name, String email, String password, String phoneNumber, Date hireDate, int salary, boolean isAdmin, boolean isDelete) {
        this.nik = nik;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.hireDate = hireDate;
        this.salary = salary;
        this.isAdmin = isAdmin;
        this.isDelete = isDelete;
    }

    public String getNik() {
        return nik;
    }

    public void setNik(String nik) {
        this.nik = nik;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getHireDate() {
        return hireDate;
    }

    public void setHireDate(Date hireDate) {
        this.hireDate = hireDate;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public boolean getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public boolean getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(boolean isDelete) {
        this.isDelete = isDelete;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    @XmlTransient
    public List<Timesheet> getTimesheetList() {
        return timesheetList;
    }

    public void setTimesheetList(List<Timesheet> timesheetList) {
        this.timesheetList = timesheetList;
    }

    public Job getJobId() {
        return jobId;
    }

    public void setJobId(Job jobId) {
        this.jobId = jobId;
    }

    @XmlTransient
    public List<Employee> getEmployeeList() {
        return employeeList;
    }

    public void setEmployeeList(List<Employee> employeeList) {
        this.employeeList = employeeList;
    }

    public Employee getManagerId() {
        return managerId;
    }

    public void setManagerId(Employee managerId) {
        this.managerId = managerId;
    }

    @XmlTransient
    public List<Presence> getPresenceList() {
        return presenceList;
    }

    public void setPresenceList(List<Presence> presenceList) {
        this.presenceList = presenceList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (nik != null ? nik.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Employee)) {
            return false;
        }
        Employee other = (Employee) object;
        if ((this.nik == null && other.nik != null) || (this.nik != null && !this.nik.equals(other.nik))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Employee[ nik=" + nik + " ]";
    }
    
}
