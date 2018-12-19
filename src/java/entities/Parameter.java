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
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Nitro 5
 */
@Entity
@Table(name = "parameter")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Parameter.findAll", query = "SELECT p FROM Parameter p")
    , @NamedQuery(name = "Parameter.findByParameterId", query = "SELECT p FROM Parameter p WHERE p.parameterId = :parameterId")
    , @NamedQuery(name = "Parameter.findByParameterName", query = "SELECT p FROM Parameter p WHERE p.parameterName = :parameterName")
    , @NamedQuery(name = "Parameter.findByValue", query = "SELECT p FROM Parameter p WHERE p.value = :value")})
public class Parameter implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "parameterId")
    private Integer parameterId;
    @Basic(optional = false)
    @Column(name = "ParameterName")
    private String parameterName;
    @Basic(optional = false)
    @Column(name = "Value")
    private int value;

    public Parameter() {
    }

    public Parameter(Integer parameterId) {
        this.parameterId = parameterId;
    }

    public Parameter(Integer parameterId, String parameterName, int value) {
        this.parameterId = parameterId;
        this.parameterName = parameterName;
        this.value = value;
    }

    public Integer getParameterId() {
        return parameterId;
    }

    public void setParameterId(Integer parameterId) {
        this.parameterId = parameterId;
    }

    public String getParameterName() {
        return parameterName;
    }

    public void setParameterName(String parameterName) {
        this.parameterName = parameterName;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (parameterId != null ? parameterId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Parameter)) {
            return false;
        }
        Parameter other = (Parameter) object;
        if ((this.parameterId == null && other.parameterId != null) || (this.parameterId != null && !this.parameterId.equals(other.parameterId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Parameter[ parameterId=" + parameterId + " ]";
    }
    
}
