/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Nitro 5
 */
@Entity
@Table(name = "timesheet")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Timesheet.findAll", query = "SELECT t FROM Timesheet t")
    , @NamedQuery(name = "Timesheet.findByTimesheetId", query = "SELECT t FROM Timesheet t WHERE t.timesheetId = :timesheetId")
    , @NamedQuery(name = "Timesheet.findByPeriode", query = "SELECT t FROM Timesheet t WHERE t.periode = :periode")})
public class Timesheet implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "timesheetId")
    private String timesheetId;
    @Basic(optional = false)
    @Column(name = "periode")
    private String periode;
    @Lob
    @Column(name = "file")
    private byte[] file;
    @JoinColumn(name = "nik", referencedColumnName = "nik")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Employee nik;
    @OneToMany(mappedBy = "timesheetId", fetch = FetchType.LAZY)
    private List<Overtime> overtimeList;

    public Timesheet() {
    }

    public Timesheet(String timesheetId, String periode, byte[] file, Employee nik) {
        this.timesheetId = timesheetId;
        this.periode = periode;
        this.file = file;
        this.nik = nik;
    }
    
    public Timesheet(String timesheetId) {
        this.timesheetId = timesheetId;
    }

    public Timesheet(String timesheetId, String periode) {
        this.timesheetId = timesheetId;
        this.periode = periode;
    }

    public String getTimesheetId() {
        return timesheetId;
    }

    public void setTimesheetId(String timesheetId) {
        this.timesheetId = timesheetId;
    }

    public String getPeriode() {
        return periode;
    }

    public void setPeriode(String periode) {
        this.periode = periode;
    }

    public byte[] getFile() {
        return file;
    }

    public void setFile(byte[] file) {
        this.file = file;
    }

    public Employee getNik() {
        return nik;
    }

    public void setNik(Employee nik) {
        this.nik = nik;
    }

    @XmlTransient
    public List<Overtime> getOvertimeList() {
        return overtimeList;
    }

    public void setOvertimeList(List<Overtime> overtimeList) {
        this.overtimeList = overtimeList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (timesheetId != null ? timesheetId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Timesheet)) {
            return false;
        }
        Timesheet other = (Timesheet) object;
        if ((this.timesheetId == null && other.timesheetId != null) || (this.timesheetId != null && !this.timesheetId.equals(other.timesheetId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Timesheet[ timesheetId=" + timesheetId + " ]";
    }
    
}
