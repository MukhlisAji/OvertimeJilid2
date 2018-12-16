/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Mukhlish
 */
@Entity
@Table(name = "overtime")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Overtime.findAll", query = "SELECT o FROM Overtime o")
    , @NamedQuery(name = "Overtime.findByOvertimeId", query = "SELECT o FROM Overtime o WHERE o.overtimeId = :overtimeId")
    , @NamedQuery(name = "Overtime.findByOtDuration", query = "SELECT o FROM Overtime o WHERE o.otDuration = :otDuration")
    , @NamedQuery(name = "Overtime.findByFee", query = "SELECT o FROM Overtime o WHERE o.fee = :fee")
    , @NamedQuery(name = "Overtime.findByStatus", query = "SELECT o FROM Overtime o WHERE o.status = :status")
    , @NamedQuery(name = "Overtime.findByDescription", query = "SELECT o FROM Overtime o WHERE o.description = :description")})
public class Overtime implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "overtimeId")
    private Integer overtimeId;
    @Basic(optional = false)
    @Column(name = "otDuration")
    private int otDuration;
    @Basic(optional = false)
    @Column(name = "fee")
    private int fee;
    @Basic(optional = false)
    @Column(name = "status")
    private String status;
    @Lob
    @Column(name = "tsFile")
    private byte[] tsFile;
    @Basic(optional = false)
    @Column(name = "Description")
    private String description;
    @JoinColumn(name = "presenceId", referencedColumnName = "presenceId")
    @ManyToOne(fetch = FetchType.LAZY)
    private Presence presenceId;

    public Overtime() {
    }

    public Overtime(Integer overtimeId) {
        this.overtimeId = overtimeId;
    }

    public Overtime(Integer overtimeId, int otDuration, int fee, String status, String description) {
        this.overtimeId = overtimeId;
        this.otDuration = otDuration;
        this.fee = fee;
        this.status = status;
        this.description = description;
    }

    public Overtime(Integer overtimeId, int otDuration, int fee, String status, byte[] tsFile, String description, Presence presenceId) {
        this.overtimeId = overtimeId;
        this.otDuration = otDuration;
        this.fee = fee;
        this.status = status;
        this.tsFile = tsFile;
        this.description = description;
        this.presenceId = presenceId;
    }

    public Integer getOvertimeId() {
        return overtimeId;
    }

    public void setOvertimeId(Integer overtimeId) {
        this.overtimeId = overtimeId;
    }

    public int getOtDuration() {
        return otDuration;
    }

    public void setOtDuration(int otDuration) {
        this.otDuration = otDuration;
    }

    public int getFee() {
        return fee;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public byte[] getTsFile() {
        return tsFile;
    }

    public void setTsFile(byte[] tsFile) {
        this.tsFile = tsFile;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Presence getPresenceId() {
        return presenceId;
    }

    public void setPresenceId(Presence presenceId) {
        this.presenceId = presenceId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (overtimeId != null ? overtimeId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Overtime)) {
            return false;
        }
        Overtime other = (Overtime) object;
        if ((this.overtimeId == null && other.overtimeId != null) || (this.overtimeId != null && !this.overtimeId.equals(other.overtimeId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Overtime[ overtimeId=" + overtimeId + " ]";
    }
    
}
