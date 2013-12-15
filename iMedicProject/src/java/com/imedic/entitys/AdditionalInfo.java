package com.imedic.entitys;

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
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@Entity
@Table(name = "ADDITIONAL_INFO")
@NamedQueries({
    @NamedQuery(name = "AdditionalInfo.findAll", query = "SELECT a FROM AdditionalInfo a"),
    @NamedQuery(name = "AdditionalInfo.findByIdInfo", query = "SELECT a FROM AdditionalInfo a WHERE a.idInfo = :idInfo")})
public class AdditionalInfo implements Serializable {
    @Id
    @GeneratedValue(strategy=SEQUENCE, generator="ID_INFO")
    @NotNull
    @Column(name = "ID_INFO")
    private Integer idInfo;
    @NotNull
    @ManyToOne
    @JoinColumn(name = "ID_MEDICAL_CARD")
    private MedicalCard idMedicalCard;
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "DESCRIPTION")
    private String description;
    @ManyToOne
    @JoinColumn(name = "ID_GROUP_INFO")
    private GroupInfo idGroupInfo;

    public AdditionalInfo() {
    }

    public AdditionalInfo(Integer idInfo,MedicalCard idMedicalCard, GroupInfo idGroupInfo, String description) {
        this.idInfo = idInfo;
        this.idMedicalCard=idMedicalCard;
        this.idGroupInfo=idGroupInfo;
        this.description = description;
    }

    public Integer getIdInfo() {
        return idInfo;
    }

    public void setIdInfo(Integer idInfo) {
        this.idInfo = idInfo;
    }

    public MedicalCard getIdMedicalCard() {
        return idMedicalCard;
    }

    public void setIdMEdicalCard(MedicalCard idMedicalCard) {
        this.idMedicalCard = idMedicalCard;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public GroupInfo getIdGroupInfo() {
        return idGroupInfo;
    }

    public void setIdGroupInfo(GroupInfo idGroupInfo) {
        this.idGroupInfo = idGroupInfo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        if (idInfo!=null){
            hash +=idInfo.hashCode();
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof AdditionalInfo)) {
            return false;
        }
        AdditionalInfo other = (AdditionalInfo) object;
        return (this.idInfo.equals(other.idInfo));
    }

    @Override
    public String toString() {
        return "AdditionalInfo[ idInfo=" + idInfo + ",idMedicalCard=" + idMedicalCard + ",idGroupInfo=" + idGroupInfo + ",description=" + description + " ]";
    }
    
}
