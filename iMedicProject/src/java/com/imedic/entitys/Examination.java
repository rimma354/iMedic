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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@Entity
@Table(name = "EXAMINATION")
@NamedQueries({
    @NamedQuery(name = "Examination.findAll", query = "SELECT e FROM Examination e"),
    @NamedQuery(name = "Examination.findByIdExamination", query = "SELECT e FROM Examination e WHERE e.idExamination = :idExamination")})
public class Examination implements Serializable {
    @Id
    @GeneratedValue(strategy=SEQUENCE, generator="ID_EXAMINATION")
    @NotNull
    @Column(name = "ID_EXAMINATION")
    private Integer idExamination;
    @NotNull
    @OneToOne
    @JoinColumn(name = "ID_DOCTOR_RECEPTION")
    private DoctorReception idDoctorReception;
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "COMPLAINTS")
    private String complaints;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idExamination")
    private Collection<Treatment> treatments;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idExamination")
    private Collection<LaboratoryReception> laboratoryReceptions;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idExamination")
    private Collection<Diagnosis> diagnoses;
    
    public Examination() {
    }

    public Examination(Integer idExamination,DoctorReception idDoctorReception, String complaints) {
        this.idExamination = idExamination;
        this.idDoctorReception = idDoctorReception;
        this.complaints = complaints;
    }

    public Integer getIdExamination() {
        return idExamination;
    }

    public void setIdExamination(Integer idExamination) {
        this.idExamination = idExamination;
    }

    public String getComplaints() {
        return complaints;
    }

    public void setComplaints(String complaints) {
        this.complaints = complaints;
    }

    public DoctorReception getIdDoctorReception() {
        return idDoctorReception;
    }

    public void setIdDoctorReception(DoctorReception idDoctorReception) {
        this.idDoctorReception = idDoctorReception;
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

    public Collection<LaboratoryReception> getLaboratoryReceptios() {
        return laboratoryReceptions;
    }

    public void addLaboratoryReception(LaboratoryReception laboratoryReception) {
        if (this.laboratoryReceptions==null){
            this.laboratoryReceptions=new ArrayList<LaboratoryReception>();
        }
        this.laboratoryReceptions.add(laboratoryReception);
    }
 
    public Collection<Diagnosis> getDiagnoses() {
        return this.diagnoses;
    }

    public void addDiagnosis(Diagnosis diagnosis) {
        if (this.diagnoses==null){
            this.diagnoses=new ArrayList<Diagnosis>();
        }
        this.diagnoses.add(diagnosis);
    }

    @Override
    public int hashCode() {
        int hash = 0;
        if (idExamination!=null){
            hash +=idExamination.hashCode();
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Examination)) {
            return false;
        }
        Examination other = (Examination) object;
        return this.idExamination.equals(other.idExamination);   
    }

    @Override
    public String toString() {
        return "Examination[ idExamination=" + idExamination + ",idDoctorReception=" + idDoctorReception + ",complaints=" + complaints + " ]";
    }
    
}
