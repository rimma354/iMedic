package com.medic.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.SEQUENCE;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;


@Entity
@Table(name = "WEEK_DAY")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "WeekDay.findAll", query = "SELECT w FROM WeekDay w"),
    @NamedQuery(name = "WeekDay.findByIdWeekDay", query = "SELECT w FROM WeekDay w WHERE w.idWeekDay = :idWeekDay"),
    @NamedQuery(name = "WeekDay.findByWeekDay", query = "SELECT w FROM WeekDay w WHERE w.weekDay = :weekDay")})
public class WeekDay implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy=SEQUENCE, generator="ID_WEEK_DAY")
    @SequenceGenerator(name = "ID_WEEK_DAY", sequenceName = "ID_WEEK_DAY", allocationSize = 1)
    @NotNull
    @Column(name = "ID_WEEK_DAY")
    private Long idWeekDay;
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "WEEK_DAY")
    private String weekDay;

    public WeekDay() {
    }

    public WeekDay(Long idWeekDay, String weekDay) {
        this.idWeekDay = idWeekDay;
        this.weekDay = weekDay;
    }

    public Long getIdWeekDay() {
        return idWeekDay;
    }

    public void setIdWeekDay(Long idWeekDay) {
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
        hash += (idWeekDay != null ? idWeekDay.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof WeekDay)) {
            return false;
        }
        WeekDay other = (WeekDay) object;
        if ((this.idWeekDay == null && other.idWeekDay != null) || (this.idWeekDay != null && !this.idWeekDay.equals(other.idWeekDay))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "WeekDay[ idWeekDay=" + idWeekDay + ",weekDay=" + weekDay + " ]";
    }
    
}
