package com.imedic.entitys;

import java.io.Serializable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "DOCTOR_SCHEDULE")
@NamedQueries({
    @NamedQuery(name = "DoctorSchedule.findAll", query = "SELECT d FROM DoctorSchedule d"),
    @NamedQuery(name = "DoctorSchedule.findByIdDoctor", query = "SELECT d FROM DoctorSchedule d WHERE d.doctorSchedulePK.idDoctor = :idDoctor"),
    @NamedQuery(name = "DoctorSchedule.findByIdWeekDayAndIdTime", query = "SELECT d FROM DoctorSchedule d WHERE d.doctorSchedulePK.idWeekDay = :idWeekDay and d.doctorSchedulePK.idTime = :idTime")})
public class DoctorSchedule implements Serializable {
    @EmbeddedId
    protected DoctorSchedulePK doctorSchedulePK;
    @ManyToOne
    @JoinColumn(name = "ID_DOCTOR")
    private Doctor doctor; 
    @ManyToOne
    @JoinColumn(name = "ID_WEEK_DAY")
    private WeekDay weekDay;
    @ManyToOne
    @JoinColumn(name = "ID_TIME")
    private WorkTime workTime;



    public DoctorSchedule() {
    }

    public DoctorSchedule(DoctorSchedulePK doctorSchedulePK) {
        this.doctorSchedulePK = doctorSchedulePK;
    }

    public DoctorSchedule(Integer idDoctor, Integer idWeekDay, Integer idTime) {
        this.doctorSchedulePK = new DoctorSchedulePK(idDoctor, idWeekDay, idTime);
    }

    public DoctorSchedulePK getDoctorSchedulePK() {
        return doctorSchedulePK;
    }

    public void setDoctorSchedulePK(DoctorSchedulePK doctorSchedulePK) {
        this.doctorSchedulePK = doctorSchedulePK;
    }    public WorkTime getWorkTime() {
        return workTime;
    }

    public void setWorkTime(WorkTime workTime) {
        this.workTime = workTime;
    }

    public WeekDay getWeekDay() {
        return weekDay;
    }

    public void setWeekDay(WeekDay weekDay) {
        this.weekDay = weekDay;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        if (doctorSchedulePK!=null){
          hash += doctorSchedulePK.hashCode();  
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof DoctorSchedule)) {
            return false;
        }
        DoctorSchedule other = (DoctorSchedule) object;
        if ((this.doctorSchedulePK == null && other.doctorSchedulePK != null) || (this.doctorSchedulePK != null && !this.doctorSchedulePK.equals(other.doctorSchedulePK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "DoctorSchedule[ doctorSchedulePK=" + doctorSchedulePK + " ]";
    }
    
}
