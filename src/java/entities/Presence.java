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
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
@Table(name = "presence")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Presence.findAll", query = "SELECT p FROM Presence p")
    , @NamedQuery(name = "Presence.findByPresenceId", query = "SELECT p FROM Presence p WHERE p.presenceId = :presenceId")
    , @NamedQuery(name = "Presence.findByCheckIn", query = "SELECT p FROM Presence p WHERE p.checkIn = :checkIn")
    , @NamedQuery(name = "Presence.findByCheckOut", query = "SELECT p FROM Presence p WHERE p.checkOut = :checkOut")
    , @NamedQuery(name = "Presence.findByPresenceDate", query = "SELECT p FROM Presence p WHERE p.presenceDate = :presenceDate")})
public class Presence implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "presenceId")
    private Integer presenceId;
    @Column(name = "checkIn")
    private String checkIn;
    @Column(name = "checkOut")
    private String checkOut;
    @Basic(optional = false)
    @Column(name = "presenceDate")
    @Temporal(TemporalType.DATE)
    private Date presenceDate;
    @OneToMany(mappedBy = "presenceId", fetch = FetchType.LAZY)
    private List<Overtime> overtimeList;
    @JoinColumn(name = "nik", referencedColumnName = "nik")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Employee nik;

    public Presence() {
    }

    public Presence(Integer presenceId, String checkIn, String checkOut, Date presenceDate, Employee nik) {
        this.presenceId = presenceId;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.presenceDate = presenceDate;
        this.nik = nik;
    }
    
    public Presence(Integer presenceId) {
        this.presenceId = presenceId;
    }

    public Presence(Integer presenceId, Date presenceDate) {
        this.presenceId = presenceId;
        this.presenceDate = presenceDate;
    }

    public Integer getPresenceId() {
        return presenceId;
    }

    public void setPresenceId(Integer presenceId) {
        this.presenceId = presenceId;
    }

    public String getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(String checkIn) {
        this.checkIn = checkIn;
    }

    public String getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(String checkOut) {
        this.checkOut = checkOut;
    }

    public Date getPresenceDate() {
        return presenceDate;
    }

    public void setPresenceDate(Date presenceDate) {
        this.presenceDate = presenceDate;
    }

    @XmlTransient
    public List<Overtime> getOvertimeList() {
        return overtimeList;
    }

    public void setOvertimeList(List<Overtime> overtimeList) {
        this.overtimeList = overtimeList;
    }

    public Employee getNik() {
        return nik;
    }

    public void setNik(Employee nik) {
        this.nik = nik;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (presenceId != null ? presenceId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Presence)) {
            return false;
        }
        Presence other = (Presence) object;
        if ((this.presenceId == null && other.presenceId != null) || (this.presenceId != null && !this.presenceId.equals(other.presenceId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Presence[ presenceId=" + presenceId + " ]";
    }
    
}
