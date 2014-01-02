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
@Table(name = "HISTORY_TYPE")
@NamedQueries({
    @NamedQuery(name = "HistoryType.findAll", query = "SELECT h FROM HistoryType h"),
    @NamedQuery(name = "HistoryType.findByIdHistoryType", query = "SELECT h FROM HistoryType h WHERE h.idHistoryType = :idHistoryType")})
public class HistoryType implements Serializable {
    @Id
    @GeneratedValue(strategy=SEQUENCE, generator="ID_HISTORY_TYPE")
    @NotNull
    @Column(name = "ID_HISTORY_TYPE")
    private Integer idHistoryType;
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "TYPE_TITLE")
    private String typeTitle;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idHistoryType")
    private Collection<MedicalHistory> medicalHistories;

    public HistoryType() {
    }

    public HistoryType(Integer idHistoryType, String typeTitle) {
        this.idHistoryType = idHistoryType;
        this.typeTitle = typeTitle;
    }

    public Integer getIdHistoryType() {
        return idHistoryType;
    }

    public void setIdHistoryType(Integer idHistoryType) {
        this.idHistoryType = idHistoryType;
    }

    public String getTypeTitle() {
        return typeTitle;
    }

    public void setTypeTitle(String typeTitle) {
        this.typeTitle = typeTitle;
    }

    public Collection<MedicalHistory> getMedicalHistories() {
        return medicalHistories;
    }

    public void addMedicalHistory(Collection<MedicalHistory> medicalHistory) {
        if (this.medicalHistories==null){
            this.medicalHistories=new ArrayList<MedicalHistory>();
        }
        this.medicalHistories = medicalHistory;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        if (idHistoryType!=null){
            hash +=idHistoryType.hashCode();
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof HistoryType)) {
            return false;
        }
        HistoryType other = (HistoryType) object;
        return (this.idHistoryType.equals(other.idHistoryType));
    }

    @Override
    public String toString() {
        return "HistoryType[ idHistoryType=" + idHistoryType + ",typeTitle=" + typeTitle + " ]";
    }
    
}
