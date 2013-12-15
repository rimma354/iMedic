package com.imedic.entitys;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;


@Embeddable
public class LaboratorySchedulePK implements Serializable {
    @NotNull
    @Column(name = "ID_LABORATORY")
    private Integer idLaboratory;
    @NotNull
    @Column(name = "ID_WEEK_DAY")
    private Integer idWeekDay;
    @NotNull
    @Column(name = "ID_TIME")
    private Integer idTime;

    public LaboratorySchedulePK() {
    }

    public LaboratorySchedulePK(Integer idLaboratory, Integer idWeekDay, Integer idTime) {
        this.idLaboratory = idLaboratory;
        this.idWeekDay = idWeekDay;
        this.idTime = idTime;
    }

    public Integer getIdLaboratory() {
        return idLaboratory;
    }

    public void setIdLaboratory(Integer idLaboratory) {
        this.idLaboratory = idLaboratory;
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
        hash += idLaboratory+idWeekDay+idTime;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof LaboratorySchedulePK)) {
            return false;
        }
        LaboratorySchedulePK other = (LaboratorySchedulePK) object;
        if (this.idLaboratory != other.idLaboratory) {
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
        return "LaboratorySchedulePK[ idLaboratory=" + idLaboratory + ", idWeekDay=" + idWeekDay + ", idTime=" + idTime + " ]";
    }
    
}
