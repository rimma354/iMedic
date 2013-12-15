package com.imedic.entitys;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.SEQUENCE;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import static javax.persistence.TemporalType.DATE;
import javax.validation.constraints.NotNull;


@Entity
@Table(name = "WORK_TIME")
@NamedQueries({
    @NamedQuery(name = "WorkTime.findAll", query = "SELECT w FROM WorkTime w"),
    @NamedQuery(name = "WorkTime.findByIdTime", query = "SELECT w FROM WorkTime w WHERE w.idTime = :idTime")})
public class WorkTime implements Serializable {
    @Id
    @GeneratedValue(strategy=SEQUENCE, generator="ID_TIME")
    @NotNull
    @Column(name = "ID_TIME")
    private Integer idTime;
    @NotNull
    @Column(name = "WORK_TIME")
    @Temporal(DATE)
    private Date workTime;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "workTime")
    private Collection<DoctorSchedule> doctorSchedules;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "workTime")
    private Collection<LaboratorySchedule> laboratorySchedules;

    public WorkTime() {
    }

    public WorkTime(Integer idTime, Date workTime) {
        this.idTime = idTime;
        this.workTime = workTime;
    }

    public Integer getIdTime() {
        return idTime;
    }

    public void setIdTime(Integer idTime) {
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
        if (idTime!=null){
            hash +=idTime.hashCode();
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof WorkTime)) {
            return false;
        }
        WorkTime other = (WorkTime) object;
        return this.idTime.equals(other.idTime);      }

    @Override
    public String toString() {
        return "WorkTime[ idTime=" + idTime + ",workTime=" + workTime + " ]";
    }

    public Collection<DoctorSchedule> getDoctorSchedules() {
        return doctorSchedules;
    }

    public void addDoctorSchedules(DoctorSchedule doctorSchedule) {
        if (this.doctorSchedules==null){
            this.doctorSchedules=new ArrayList<DoctorSchedule>();
        }
        this.doctorSchedules.add(doctorSchedule);
    }

    public Collection<LaboratorySchedule> getLaboratorySchedules() {
        return laboratorySchedules;
    }

    public void setLaboratorySchedule(LaboratorySchedule laboratorySchedule) {
        if (this.laboratorySchedules==null){
            this.laboratorySchedules=new ArrayList<LaboratorySchedule>();
        }
        this.laboratorySchedules.add(laboratorySchedule);
    }
    
}
