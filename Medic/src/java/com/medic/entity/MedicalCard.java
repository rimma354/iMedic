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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;


@Entity
@Table(name = "MEDICAL_CARD")
@NamedQueries({
    @NamedQuery(name = "MedicalCard.findAll", query = "SELECT m FROM MedicalCard m"),
    @NamedQuery(name = "MedicalCard.findByIdMedicalCard", query = "SELECT m FROM MedicalCard m WHERE m.idMedicalCard = :idMedicalCard")})
public class MedicalCard implements Serializable {
    @Id
    @GeneratedValue(strategy=SEQUENCE, generator="ID_MEDICAL_CARD")
    @NotNull
    @Column(name = "ID_MEDICAL_CARD")
    private Integer idMedicalCard;
    @NotNull
    @OneToOne
    @JoinColumn(name = "ID_PATIENT")
    private Patient idPatient;
    @NotNull
    @ManyToOne
    @JoinColumn(name = "ID_STATE")
    private CardState idState;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idMedicalCard")
    private Collection <MedicalHistory> medicalHistories;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idMedicalCard")
    private Collection <AdditionalInfo> additionalInfos;
    
    public MedicalCard() {
    }
    
    public MedicalCard(Integer idMedicalCard, Patient idPatient, CardState idState) {
        this.idMedicalCard = idMedicalCard;
        this.idPatient = idPatient;
        this.idState = idState;
    }
    
    public Integer getIdMedicalCard() {
        return idMedicalCard;
    }

    public void setIdMedicalCard(Integer idMedicalCard) {
        this.idMedicalCard = idMedicalCard;
    }

    public Patient getIdPatient() {
        return idPatient;
    }

    public void setIdPatient(Patient idPatient) {
        this.idPatient = idPatient;
    }
    
    public CardState getIdState() {
        return idState;
    }

    public void setIdState(CardState idState) {
        this.idState = idState;
    }
    
    public Collection<MedicalHistory> getMedicaHistories() {
        return medicalHistories;
    }

    public void addMedicalHistory(MedicalHistory medicalHistory) {
        if (this.medicalHistories==null){
            this.medicalHistories=new ArrayList<MedicalHistory>();
        }
        this.medicalHistories.add(medicalHistory);
    }
  
     public Collection<AdditionalInfo> getAdditionalInfos() {
        return additionalInfos;
    }

    public void addMAdditionalInfo(AdditionalInfo additionalInfo) {
        if (this.additionalInfos==null){
            this.additionalInfos=new ArrayList<AdditionalInfo>();
        }
        this.additionalInfos.add(additionalInfo);
    }

    @Override
    public int hashCode() {
        int hash = 0;
        if (idMedicalCard!=null){
            hash +=idMedicalCard.hashCode();
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof MedicalCard)) {
            return false;
        }
        MedicalCard other = (MedicalCard) object;
        return this.idMedicalCard.equals(other.idMedicalCard);
    }

    @Override
    public String toString() {
        return "MedicalCard[ idMedicalCard=" + idMedicalCard + ",idPatient=" + idPatient + ",idState=" + idState + " ]";
    }
    
}
