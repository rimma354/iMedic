package com.medic.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.SEQUENCE;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "TREATMENT")
@NamedQueries({
    @NamedQuery(name = "Treatment.findAll", query = "SELECT t FROM Treatment t"),
    @NamedQuery(name = "Treatment.findByIdTreatment", query = "SELECT t FROM Treatment t WHERE t.idTreatment = :idTreatment")})
public class Treatment implements Serializable {

    @Id
    @GeneratedValue(strategy = SEQUENCE, generator = "ID_TREATMENT")
    @SequenceGenerator(name = "ID_TREATMENT", sequenceName = "ID_TREATMENT", allocationSize = 1)
    @NotNull
    @Column(name = "ID_TREATMENT")
    private Integer idTreatment;
    @NotNull
    @ManyToOne
    @JoinColumn(name = "ID_DRUG")
    private Drugs idDrug;
    @NotNull
    @ManyToOne
    @JoinColumn(name = "ID_MEASURE")
    private Measure idMeasure;
    @NotNull
    @Column(name = "DOSAGE")
    private Double dosage;
    @NotNull
    @Column(name = "QUANTITY")
    private Double quantity;
    @NotNull
    @Column(name = "DURATION")
    private Integer duration;
    @ManyToOne
    @JoinColumn(name = "ID_EXAMINATION")
    private Examination idExamination;

    public Treatment() {
    }

    public Treatment(Examination idExamination, Drugs idDrug, Measure idMeasure, Double dosage, Double quantity, Integer duration) {
        if ((idExamination != null) && (idDrug != null) && (idMeasure != null) && (dosage != null) && (quantity != null) && (duration != null)) {
            this.idExamination = idExamination;
            this.idDrug = idDrug;
            this.idMeasure = idMeasure;
            this.dosage = dosage;
            this.quantity = quantity;
            this.duration = duration;
        }
    }

    public Integer getIdTreatment() {
        return idTreatment;
    }

    public Examination getIdExamination() {
        return idExamination;
    }

    public void setIdExamination(Examination idExamination) {
        if (idExamination != null) {
            this.idExamination = idExamination;
        }
    }

    public void setIdDrug(Drugs idDrug) {
        if (idDrug != null) {
            this.idDrug = idDrug;
        }
    }

    public Drugs getIdDrug() {
        return idDrug;
    }

    public Measure getIdMeasure() {
        return idMeasure;
    }

    public void setIdMeasure(Measure idMeasure) {
        if (idMeasure != null) {
            this.idMeasure = idMeasure;
        }
    }

    public Double getDosage() {
        return dosage;
    }

    public void setDosage(Double dosage) {
        if (dosage != null) {
            this.dosage = dosage;
        }
    }

    public Double getQuantity() {
        return quantity;
    }

    public void setQuantity(Double quantity) {
        if (quantity != null) {
            this.quantity = quantity;
        }
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        if (duration != null) {
            this.duration = duration;
        }
    }

    @Override
    public int hashCode() {
        int hash = 0;
        if (idTreatment != null) {
            hash += idTreatment.hashCode();
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Treatment)) {
            return false;
        }
        Treatment other = (Treatment) object;
        return this.idTreatment.equals(other.idTreatment);
    }

    @Override
    public String toString() {
        return "Treatment[ idTreatment=" + idTreatment + ",idExamination=" + idExamination + ",idDrug=" + idDrug + ",idMeasure=" + idMeasure + ",dosage=" + dosage + ",quantity=" + quantity + ",duration=" + duration + " ]";
    }

}
