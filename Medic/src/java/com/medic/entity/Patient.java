package com.medic.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
import javax.validation.constraints.Size;

@Entity
@Table(name = "PATIENT")
@NamedQueries({
    @NamedQuery(name = "Patient.findAll", query = "SELECT p FROM Patient p"),
    @NamedQuery(name = "Patient.findByIdPatient", query = "SELECT p FROM Patient p WHERE p.idPatient = :idPatient"),
    @NamedQuery(name = "Patient.findByLastName", query = "SELECT p FROM Patient p WHERE p.lastName = :lastName")})
public class Patient implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ID_PATIENT")
    @SequenceGenerator(name = "ID_PATIENT", sequenceName = "ID_PATIENT", allocationSize = 1)
    @NotNull
    @Column(name = "ID_PATIENT")
    private Integer idPatient;
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "FIRST_NAME")
    private  String firstName;
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "LAST_NAME")
    private  String lastName;
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "PATRONYMIC")
    private  String patronymic;
    @NotNull
    @ManyToOne
    @JoinColumn(name = "ID_SEX")
    private  Sex idSex;
    @NotNull
    @Column(name = "DATE_BIRTH")
    @Temporal(DATE)
    private  Date dateBirth;
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "TELEPHONE")
    private  String telephone;
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "PASSPORT")
    private  String passport;
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "INSURANCE_NUMBER")
    private  String insuranceNumber;
    @OneToOne(mappedBy = "idPatient")
    private MedicalCard idMedicalCard;

 
    public static class Builder {

        private  String lastName;
        private  String firstName;
        private  String patronymic;
        private  Sex idSex;
        private  Date dateBirth;
        private  String telephone;
        private  String passport;
        private  String insuranceNumber;

        private MedicalCard idMedicalCard = null;

        
        public  Builder(String lastName, String firstName, String patronymic, Sex idSex, Date dateBirth, String telephone, String passport, String insuranceNumber) {
            this.lastName = lastName;
            this.firstName = firstName;
            this.patronymic = patronymic;
            this.idSex = idSex;
            this.dateBirth = dateBirth;
            this.telephone = telephone;
            this.passport = passport;
            this.insuranceNumber = insuranceNumber;
        }

        public Builder medicalCard(MedicalCard val) {
            idMedicalCard = val;
            return this;
        }

        public Patient build() {
            return new Patient(this);
        }
    }

  

    private Patient(Builder builder) {
        lastName = builder.lastName;
        firstName = builder.firstName;
        patronymic = builder.patronymic;
        idSex = builder.idSex;
        dateBirth = builder.dateBirth;
        telephone = builder.telephone;
        passport = builder.passport;
        insuranceNumber = builder.insuranceNumber;
        idMedicalCard = builder.idMedicalCard;
    }
  
    
    public Integer getIdPatient() {
        return idPatient;
    }

    public void setIdPatient(Integer idPatient) {
        this.idPatient = idPatient;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPatronymic() {
        return patronymic;
    }

    public void setPatronymic(String patronymic) {
        this.patronymic = patronymic;
    }

    public Sex getIdSex(){
        return this.idSex;
    }
    
    public void setIdSex(Sex idSex){
        this.idSex=idSex;
    }
    
    public Date getDateBirth() {
        return dateBirth;
    }

    public void setDateBirth(Date dateBirth) {
        this.dateBirth = dateBirth;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getPassport() {
        return passport;
    }

    public void setPassport(String passport) {
        this.passport = passport;
    }

    public String getInsuranceNumber() {
        return insuranceNumber;
    }

    public void setInsuranceNumber(String insuranceNumber) {
        this.insuranceNumber = insuranceNumber;
    }

    public MedicalCard getIdMedicalCard() {
        return idMedicalCard;
    }

    public void setIdMedicalCard(MedicalCard idMedicalCard) {
        this.idMedicalCard = idMedicalCard;
    }

      public Patient() {
       
          this.firstName = "";
          this.lastName = "";
          this.patronymic = "";
          this.idSex = null;
          this.dateBirth = new Date();
          this.telephone = "";
          this.passport = "";
          this.insuranceNumber = "";
          
    }
    
    @Override
    public int hashCode() {
        int hash = 0;
        if (idPatient != null) {
            hash += idPatient.hashCode();
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Patient)) {
            return false;
        }
        Patient other = (Patient) object;
        return this.idPatient.equals(other.idPatient);
    }

    @Override
    public String toString() {
        return "Patient[ idPatient=" + idPatient + ",lastName=" + lastName + ",firstName=" + firstName + ",patronymic=" + patronymic + ",idSex=" + idSex + ",dateBirth=" + dateBirth + ",telephone=" + telephone + ",passport=" + passport + ",insuranceNumber=" + insuranceNumber + " ]";
    }
}
