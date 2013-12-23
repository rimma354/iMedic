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
@Table(name = "SEX")
@NamedQueries({
    @NamedQuery(name = "Sex.findAll", query = "SELECT s FROM Sex s"),
    @NamedQuery(name = "Sex.findByIdSex", query = "SELECT s FROM Sex s WHERE s.idSex = :idSex")})
public class Sex implements Serializable {
    @Id
    @GeneratedValue(strategy=SEQUENCE, generator="ID_SEX")
    @NotNull
    @Column(name = "ID_SEX")
    private Integer idSex;
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "SEX_TITLE")
    private String sexTitle;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idSex")
    private Collection <Patient> patients;
    
    public Sex() {
    }

    public Sex(Integer idSex, String sexTitle) {
        this.idSex = idSex;
        this.sexTitle = sexTitle;
    }

    public Integer getIdSex() {
        return idSex;
    }

    public void setIdSex(Integer idSex) {
        this.idSex = idSex;
    }

    public String getSexTitle() {
        return sexTitle;
    }

    public void setSexTitle(String sexTitle) {
        this.sexTitle = sexTitle;
    }
    
    public Collection<Patient> getPatients() {
        return patients;
    }

    public void addPatient(Patient patient) {
        if (this.patients==null){
            this.patients=new ArrayList<Patient>();
        }
        this.patients.add(patient);
    }
    
    @Override
    public int hashCode() {
        int hash = 0;
        if (idSex!=null){
            hash +=idSex.hashCode();
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Sex)) {
            return false;
        }
        Sex other = (Sex) object;
        return this.idSex.equals(other.idSex);
    }

    @Override
    public String toString() {
        return "Sex[ idSex=" + idSex + ", sexTitle=" + sexTitle + " ]";
    }
    
}
