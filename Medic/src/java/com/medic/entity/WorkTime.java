
package com.medic.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.SEQUENCE;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "WORK_TIME")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "WorkTime.findAll", query = "SELECT w FROM WorkTime w"),
    @NamedQuery(name = "WorkTime.findByIdTime", query = "SELECT w FROM WorkTime w WHERE w.idTime = :idTime"),
    @NamedQuery(name = "WorkTime.findByWorkTime", query = "SELECT w FROM WorkTime w WHERE w.workTime = :workTime")})
public class WorkTime implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy=SEQUENCE, generator="ID_TIME")
    @SequenceGenerator(name = "ID_TIME", sequenceName = "ID_TIME", allocationSize = 1)
    @NotNull
    @Column(name = "ID_TIME")
    private Long idTime;
    @NotNull
    @Column(name = "WORK_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    private Date workTime;

    public WorkTime() {
    }

    public WorkTime(Long idTime) {
        this.idTime = idTime;
    }

    public WorkTime(Long idTime, Date workTime) {
        this.idTime = idTime;
        this.workTime = workTime;
    }

    public Long getIdTime() {
        return idTime;
    }

    public void setIdTime(Long idTime) {
        this.idTime = idTime;
    }

    public Date getWorkTime() {
        return workTime;
    }

    public void setWorkTime(Date workTime) {
        this.workTime = workTime;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTime != null ? idTime.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof WorkTime)) {
            return false;
        }
        WorkTime other = (WorkTime) object;
        if ((this.idTime == null && other.idTime != null) || (this.idTime != null && !this.idTime.equals(other.idTime))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.medic.entity.WorkTime[ idTime=" + idTime + " ]";
    }
    
}
