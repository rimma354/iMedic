package com.imedic.entitys;

import java.io.Serializable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "LABORATORY_SCHEDULE")
@NamedQueries({
    @NamedQuery(name = "LaboratorySchedule.findAll", query = "SELECT l FROM LaboratorySchedule l"),
    @NamedQuery(name = "LaboratorySchedule.findByIdLaboratory", query = "SELECT l FROM LaboratorySchedule l WHERE l.laboratorySchedulePK.idLaboratory = :idLaboratory"),
    @NamedQuery(name = "LaboratorySchedule.findByIdWeekDayAndIdTime", query = "SELECT l FROM LaboratorySchedule l WHERE l.laboratorySchedulePK.idWeekDay = :idWeekDay and l.laboratorySchedulePK.idTime = :idTime")})
public class LaboratorySchedule implements Serializable {
    @EmbeddedId
    protected LaboratorySchedulePK laboratorySchedulePK;
    @ManyToOne
    @JoinColumn(name = "ID_TIME")
    private WorkTime workTime;
    @ManyToOne
    @JoinColumn(name = "ID_WEEK_DAY")
    private WeekDay weekDay;
    @ManyToOne
    @JoinColumn(name = "ID_LABORATORY")
    private Laboratory laboratory;

    public LaboratorySchedule() {
    }

    public LaboratorySchedule(LaboratorySchedulePK laboratorySchedulePK) {
        this.laboratorySchedulePK = laboratorySchedulePK;
    }

    public LaboratorySchedule(Integer idLaboratory, Integer idWeekDay, Integer idTime) {
        this.laboratorySchedulePK = new LaboratorySchedulePK(idLaboratory, idWeekDay, idTime);
    }

    public LaboratorySchedulePK getLaboratorySchedulePK() {
        return laboratorySchedulePK;
    }

    public void setLaboratorySchedulePK(LaboratorySchedulePK laboratorySchedulePK) {
        this.laboratorySchedulePK = laboratorySchedulePK;
    }

    public WorkTime getWorkTime() {
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

    public Laboratory getLaboratory() {
        return laboratory;
    }

    public void setLaboratory(Laboratory laboratory) {
        this.laboratory = laboratory;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        if (laboratorySchedulePK != null ){
         hash += laboratorySchedulePK.hashCode();   
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof LaboratorySchedule)) {
            return false;
        }
        LaboratorySchedule other = (LaboratorySchedule) object;
        if ((this.laboratorySchedulePK == null && other.laboratorySchedulePK != null) || (this.laboratorySchedulePK != null && !this.laboratorySchedulePK.equals(other.laboratorySchedulePK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "LaboratorySchedule[ laboratorySchedulePK=" + laboratorySchedulePK + " ]";
    }
    
}
