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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@Entity
@Table(name = "DRUGS")
@NamedQueries({
    @NamedQuery(name = "Drugs.findAll", query = "SELECT d FROM Drugs d"),
    @NamedQuery(name = "Drugs.findByIdDrug", query = "SELECT d FROM Drugs d WHERE d.idDrug = :idDrug")})
public class Drugs implements Serializable {
    @Id
    @GeneratedValue(strategy=SEQUENCE, generator="ID_DRUG")
    @NotNull
    @Column(name = "ID_DRUG")
    private Integer idDrug;
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "DRUG_TITLE")
    private String drugTitle;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idDrug")
    private Collection <Treatment> treatments;
    
    public Drugs() {
    }

    public Drugs(Integer idDrug, String drugTitle) {
        this.idDrug = idDrug;
        this.drugTitle = drugTitle;
    }

    public Integer getIdDrug() {
        return idDrug;
    }

    public void setIdDrug(Integer idDrug) {
        this.idDrug = idDrug;
    }

    public String getDrugTitle() {
        return drugTitle;
    }

    public void setDrugTitle(String drugTitle) {
        this.drugTitle = drugTitle;
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
        if (idDrug!=null){
            hash +=idDrug.hashCode();
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Drugs)) {
            return false;
        }
        Drugs other = (Drugs) object;
        return this.idDrug.equals(other.idDrug);   

    }

    @Override
    public String toString() {
        return "Drugs[ idDrug=" + idDrug + ",drugTitle=" + drugTitle + " ]";
    }
    
}
