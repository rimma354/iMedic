package com.medic.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.SEQUENCE;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import static javax.persistence.TemporalType.DATE;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "DOCTOR_RECEPTION")
@NamedQueries({
    @NamedQuery(name = "DoctorReception.findAll", query = "SELECT d FROM DoctorReception d"),
    @NamedQuery(name = "DoctorReception.findByIdDoctorReception", query = "SELECT d FROM DoctorReception d WHERE d.idDoctorReception = :idDoctorReception"),
    @NamedQuery(name = "DoctorReception.findByReceptionDate", query = "SELECT d FROM DoctorReception d WHERE d.receptionDate = :receptionDate")})
public class DoctorReception implements Serializable {
    @Id
    @GeneratedValue(strategy = SEQUENCE, generator = "ID_DOCTOR_RECEPTION")
    @SequenceGenerator(name = "ID_DOCTOR_RECEPTION", sequenceName = "ID_DOCTOR_RECEPTION", allocationSize = 1)
    @NotNull
    @Column(name = "ID_DOCTOR_RECEPTION")
    private Integer idDoctorReception;
    @NotNull
    @ManyToOne
    @JoinColumn(name = "ID_MEDICAL_HISTORY")
    private MedicalHistory idMedicalHistory;
    @NotNull
    @ManyToOne
    @JoinColumn(name = "ID_DOCTOR")
    private Doctor idDoctor;
    @NotNull
    @Column(name = "RECEPTION_DATE")
    @Temporal(DATE)
    private Date receptionDate;
    @OneToOne(mappedBy = "idDoctorReception")
    private Examination idExamination;

    public DoctorReception() {
    }

    public DoctorReception(MedicalHistory idMedicalHistory, Doctor idDoctor, Date receptionDate) {
        if ((idMedicalHistory != null) && (idDoctor != null) && (receptionDate != null)) {
            this.idMedicalHistory = idMedicalHistory;
            this.idDoctor = idDoctor;
            this.receptionDate = receptionDate;
        }
    }

    public Integer getIdDoctorReception() {
        return idDoctorReception;
    }

    public MedicalHistory getIdMedicalHistory() {
        return idMedicalHistory;
    }

    public void setIdMedicalHistory(MedicalHistory idMedicalHistory) {
        if (idMedicalHistory != null) {
            this.idMedicalHistory = idMedicalHistory;
        }
    }

    public Doctor getIdDoctor() {
        return idDoctor;
    }

    public void setIdDoctor(Doctor idDoctor) {
        if (idDoctor != null) {
            this.idDoctor = idDoctor;
        }
    }

    public Date getReceptionDate() {
        return receptionDate;
    }

    public void setReceptionDate(Date receptionDate) {
        if (receptionDate != null) {
            this.receptionDate = receptionDate;
        }
    }

    public Examination getIdExamination() {
        return idExamination;
    }

    public void setIdExamination(Examination idExamination) {
        if (idExamination != null) {
            this.idExamination = idExamination;
        }
    }

    @Override
    public int hashCode() {
        int hash = 0;
        if (idDoctorReception != null) {
            hash += idDoctorReception.hashCode();
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof DoctorReception)) {
            return false;
        }
        DoctorReception other = (DoctorReception) object;
        return this.idDoctorReception.equals(other.idDoctorReception);
    }

    @Override
    public String toString() {
        return "DoctorReception[ idDoctorReception=" + idDoctorReception + ",idMedicalHistory=" + idMedicalHistory + ",idDoctor=" + idDoctor + ",receptionDate=" + receptionDate + " ]";
    }

}
