package com.medic.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
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
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import static javax.persistence.TemporalType.DATE;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "MEDICAL_HISTORY")
@NamedQueries({
    @NamedQuery(name = "MedicalHistory.findAll", query = "SELECT m FROM MedicalHistory m"),
    @NamedQuery(name = "MedicalHistory.findByIdMedicalHistory", query = "SELECT m FROM MedicalHistory m WHERE m.idMedicalHistory = :idMedicalHistory")})
public class MedicalHistory implements Serializable {
    @Id
    @GeneratedValue(strategy = SEQUENCE, generator = "ID_MEDICAL_HISTORY")
    @SequenceGenerator(name = "ID_MEDICAL_HISTORY", sequenceName = "ID_MEDICAL_HISTORY", allocationSize = 1)
    @NotNull
    @Column(name = "ID_MEDICAL_HISTORY")
    private Integer idMedicalHistory;
    @NotNull
    @ManyToOne
    @JoinColumn(name = "ID_MEDICAL_CARD")
    private MedicalCard idMedicalCard;
    @ManyToOne
    @JoinColumn(name = "ID_HISTORY_TYPE")
    private HistoryType idHistoryType;
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "DESCRIPTION")
    private String description;
    @NotNull
    @Column(name = "OPENNING_DATE")
    @Temporal(DATE)
    private  Date openningDate;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idMedicalHistory")
    private Collection<DoctorReception> doctorReceptions;

    public MedicalHistory() {
    }

    public MedicalHistory(MedicalCard idMedicalCard, HistoryType idHistoryType, String description, Date openningDate) {
        if ((idMedicalCard != null) && (idHistoryType != null) && (description != null)) {
            this.idMedicalCard = idMedicalCard;
            this.idHistoryType = idHistoryType;
            this.description = description;
            this.openningDate=openningDate;
        }
    }

    public Integer getIdMedicalHistory() {
        return idMedicalHistory;
    }

    public MedicalCard getIdMedicalCard() {
        return idMedicalCard;
    }

    public void setIdMedicalCard(MedicalCard idMedicalCard) {
        if (idMedicalCard != null) {
            this.idMedicalCard = idMedicalCard;
        }
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        if (description != null) {
            this.description = description;
        }
    }

    public HistoryType getIdHistoryType() {
        return idHistoryType;
    }

    public void setIdHistoryType(HistoryType idHistoryType) {
        if (idHistoryType != null) {
            this.idHistoryType = idHistoryType;
        }
    }
   public Date getOpenningDate() {
        return openningDate;
    }

    public void setOpenningDate(Date openningDate) {
        this.openningDate = openningDate;
    }
    public Collection<DoctorReception> getDoctorReceptions() {
        return doctorReceptions;
    }

    public void addDoctorReception(DoctorReception doctorReception) {
        if (this.doctorReceptions == null) {
            this.doctorReceptions = new ArrayList<DoctorReception>();
        }
        this.doctorReceptions.add(doctorReception);
    }

    @Override
    public int hashCode() {
        int hash = 0;
        if (idMedicalHistory != null) {
            hash += idMedicalHistory.hashCode();
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof MedicalHistory)) {
            return false;
        }
        MedicalHistory other = (MedicalHistory) object;
        return (this.idMedicalHistory.equals(other.idMedicalHistory));
    }

    @Override
    public String toString() {
        return "MedicalHistory[ idMedicalHistory=" + idMedicalHistory + ",idMedicalCard=" + idMedicalCard + ",idHistoryType=" + idHistoryType + ",description=" + description + ",openning date=" + openningDate + " ]";
    }

}
