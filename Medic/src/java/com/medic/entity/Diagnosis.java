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
import javax.validation.constraints.Size;


@Entity
@Table(name = "DIAGNOSIS")
@NamedQueries({
    @NamedQuery(name = "Diagnosis.findAll", query = "SELECT d FROM Diagnosis d"),
    @NamedQuery(name = "Diagnosis.findByIdDiagnosis", query = "SELECT d FROM Diagnosis d WHERE d.idDiagnosis = :idDiagnosis")})
public class Diagnosis implements Serializable {
    @Id
    @GeneratedValue(strategy=SEQUENCE, generator="ID_DIAGNOSIS")
    @SequenceGenerator(name = "ID_DIAGNOSIS", sequenceName = "ID_DIAGNOSIS", allocationSize = 1)
    @NotNull
    @Column(name = "ID_DIAGNOSIS")
    private Integer idDiagnosis;
    @NotNull
    @ManyToOne
    @JoinColumn (name="ID_EXAMINATION")
    private Examination idExamination;
    @NotNull
    @ManyToOne
    @JoinColumn (name="ID_ILLNESS")
    private Illnesses idIllness;

    public Diagnosis() {
    }

    public Diagnosis(Examination idExamination, Illnesses idIllness) {
        this.idExamination=idExamination;
        this.idIllness=idIllness;
    }

    public Integer getIdDiagnosis() {
        return idDiagnosis;
    }

    public void setIdDiagnosis(Integer idDiagnosis) {
        this.idDiagnosis = idDiagnosis;
    }

    public void setIdExamination(Examination idExamination) {
        this.idExamination = idExamination;
    }

    public Examination getIdExamination() {
        return idExamination;
    }

    public void setIdIllnesses(Illnesses idIllness) {
        this.idIllness = idIllness;
    }

    public Illnesses getIdIllnesses() {
        return idIllness;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        if (idDiagnosis!=null){
            hash +=idDiagnosis.hashCode();
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Diagnosis)) {
            return false;
        }
        Diagnosis other = (Diagnosis) object;
        return this.idDiagnosis.equals(other.idDiagnosis);   
    }

    @Override
    public String toString() {
        return "Diagnosis[ idDiagnosis=" + idDiagnosis + ",idExamination=" + idExamination + ",idIllness=" + idIllness + " ]";
    }
    
}
