package com.imedic.entitys;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@Entity
@Table(name = "WEEK_DAY")
@NamedQueries({
    @NamedQuery(name = "WeekDay.findAll", query = "SELECT w FROM WeekDay w"),
    @NamedQuery(name = "WeekDay.findByIdWeekDay", query = "SELECT w FROM WeekDay w WHERE w.idWeekDay = :idWeekDay")})
public class WeekDay implements Serializable {
    @Id
    @GeneratedValue(strategy=SEQUENCE, generator="ID_WEEK_DAY")
    @NotNull
    @Column(name = "ID_WEEK_DAY")
    private Integer idWeekDay;
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "WEEK_DAY")
    private String weekDay;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "weekDay")
    private Collection<DoctorSchedule> doctorSchedules;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "weekDay")
    private Collection<LaboratorySchedule> laboratorySchedules;

    public WeekDay() {
    }

    public WeekDay(Integer idWeekDay, String weekDay) {
        this.idWeekDay = idWeekDay;
        this.weekDay = weekDay;
    }

    public Integer getIdWeekDay() {
        return idWeekDay;
    }

    public void setIdWeekDay(Integer idWeekDay) {
        this.idWeekDay = idWeekDay;
    }

    public String getWeekDay() {
        return weekDay;
    }

    public void setWeekDay(String weekDay) {
        this.weekDay = weekDay;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        if (idWeekDay!=null){
            hash +=idWeekDay.hashCode();
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof WeekDay)) {
            return false;
        }
        WeekDay other = (WeekDay) object;
        return this.idWeekDay.equals(other.idWeekDay);      }

    @Override
    public String toString() {
        return "WeekDay[ idWeekDay=" + idWeekDay + ",weekDay=" + weekDay + " ]";
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
