package com.medic.entity;

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
@Table(name = "MEASURE")
@NamedQueries({
    @NamedQuery(name = "Measure.findAll", query = "SELECT m FROM Measure m"),
    @NamedQuery(name = "Measure.findByIdMeasure", query = "SELECT m FROM Measure m WHERE m.idMeasure = :idMeasure")})
public class Measure implements Serializable {
    @Id
    @GeneratedValue(strategy=SEQUENCE, generator="ID_MEASURE")
    @NotNull
    @Column(name = "ID_MEASURE")
    private Integer idMeasure;
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "MEASURE_TITLE")
    private String measureTitle;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idMeasure")
    private Collection <Treatment> treatments;
    
    public Measure() {
    }

    public Measure(Integer idMeasure, String measureTitle) {
        this.idMeasure = idMeasure;
        this.measureTitle = measureTitle;
    }

    public Integer getIdMeasure() {
        return idMeasure;
    }

    public void setIdMeasure(Integer idMeasure) {
        this.idMeasure = idMeasure;
    }

    public String getMeasureTitle() {
        return measureTitle;
    }

    public void setMeasureTitle(String measureTitle) {
        this.measureTitle = measureTitle;
    }

    public Collection<Treatment> getTreatments() {
        return treatments;
    }

    public void addTreatment(Treatment treatment) {
        if (this.treatments==null){
            this.treatments=new ArrayList<Treatment>();
        }
        this.treatments.add(treatment);
    }

    @Override
    public int hashCode() {
        int hash = 0;
        if (idMeasure!=null){
            hash +=idMeasure.hashCode();
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Measure)) {
            return false;
        }
        Measure other = (Measure) object;
        return this.idMeasure.equals(other.idMeasure);   

    }

    @Override
    public String toString() {
        return "Measure[ idMeasure=" + idMeasure + ",measureTitle=" + measureTitle + " ]";
    }
    
}
