package com.imedic.entitys;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;


@Embeddable
public class DoctorSchedulePK implements Serializable {
    @NotNull
    @Column(name = "ID_DOCTOR")
    private Integer idDoctor;
    @NotNull
    @Column(name = "ID_WEEK_DAY")
    private Integer idWeekDay;
    @NotNull
    @Column(name = "ID_TIME")
    private Integer idTime;

    public DoctorSchedulePK() {
    }

    public DoctorSchedulePK(Integer idDoctor, Integer idWeekDay, Integer idTime) {
        this.idDoctor = idDoctor;
        this.idWeekDay = idWeekDay;
        this.idTime = idTime;
    }

    public Integer getIdDoctor() {
        return idDoctor;
    }

    public void setIdDoctor(Integer idDoctor) {
        this.idDoctor = idDoctor;
    }

    public Integer getIdWeekDay() {
        return idWeekDay;
    }

    public void setIdWeekDay(Integer idWeekDay) {
        this.idWeekDay = idWeekDay;
    }

    public Integer getIdTime() {
        return idTime;
    }

    public void setIdTime(Integer idTime) {
        this.idTime = idTime;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += idDoctor+idWeekDay+idTime;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof DoctorSchedulePK)) {
            return false;
        }
        DoctorSchedulePK other = (DoctorSchedulePK) object;
        if (this.idDoctor != other.idDoctor) {
            return false;
        }
        if (this.idWeekDay != other.idWeekDay) {
            return false;
        }
        if (this.idTime != other.idTime) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "DoctorSchedulePK[ idDoctor=" + idDoctor + ", idWeekDay=" + idWeekDay + ", idTime=" + idTime + " ]";
    }
    
}
