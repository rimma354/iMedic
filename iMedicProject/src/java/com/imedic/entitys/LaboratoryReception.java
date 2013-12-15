package com.imedic.entitys;

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
import javax.persistence.Table;
import javax.persistence.Temporal;
import static javax.persistence.TemporalType.DATE;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@Entity
@Table(name = "LABORATORY_RECEPTION")
@NamedQueries({
    @NamedQuery(name = "LaboratoryReception.findAll", query = "SELECT l FROM LaboratoryReception l"),
    @NamedQuery(name = "LaboratoryReception.findByIdLaboratoryReception", query = "SELECT l FROM LaboratoryReception l WHERE l.idLaboratoryReception = :idLaboratoryReception"),
    @NamedQuery(name = "LaboratoryReception.findByAnalysisDate", query = "SELECT l FROM LaboratoryReception l WHERE l.analysisDate = :analysisDate")})
public class LaboratoryReception implements Serializable {
    @Id
    @GeneratedValue(strategy=SEQUENCE, generator="ID_LABORATORY_RECEPTION")
    @NotNull
    @Column(name = "ID_LABORATORY_RECEPTION")
    private Integer idLaboratoryReception;
    @ManyToOne
    @JoinColumn(name = "ID_EXAMINATION")
    private Examination idExamination;
    @ManyToOne
    @JoinColumn(name = "ID_LABORATORY")
    private Laboratory idLaboratory;
    @NotNull
    @Column(name = "ANALYSIS_DATE")
    @Temporal(DATE)
    private Date analysisDate;
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "ANALYSIS_RESULT")
    private String analysisResult;
    @ManyToOne
    @JoinColumn(name = "ID_ANALYSIS")
    private Analysis idAnalysis;

    public LaboratoryReception() {
    }

    public LaboratoryReception(Integer idLaboratoryReception,Examination idExamination,Laboratory idLaboratory, Date analysisDate, String analysisResult,Analysis idAnalysis) {
        this.idLaboratoryReception = idLaboratoryReception;
        this.idExamination=idExamination;
        this.idLaboratory=idLaboratory;
        this.analysisDate = analysisDate;
        this.analysisResult = analysisResult;
        this.idAnalysis=idAnalysis;
    }

    public Integer getIdLaboratoryReception() {
        return idLaboratoryReception;
    }

    public void setIdLaboratoryReception(Integer idLaboratoryReception) {
        this.idLaboratoryReception = idLaboratoryReception;
    }

    public Date getAnalysisDate() {
        return analysisDate;
    }

    public void setAnalysisDate(Date analysisDate) {
        this.analysisDate = analysisDate;
    }

    public String getAnalysisResult() {
        return analysisResult;
    }

    public void setAnalysisResult(String analysisResult) {
        this.analysisResult = analysisResult;
    }

    public Examination getIdExamination() {
        return idExamination;
    }

    public void setIdExamination(Examination idExamination) {
        this.idExamination = idExamination;
    }

    public Laboratory getIdLaboratory() {
        return idLaboratory;
    }

    public void setIdLaboratory(Laboratory idLaboratory) {
        this.idLaboratory = idLaboratory;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        if (idLaboratoryReception!=null){
            hash +=idLaboratoryReception.hashCode();
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof LaboratoryReception)) {
            return false;
        }
        LaboratoryReception other = (LaboratoryReception) object;
        return this.idLaboratoryReception.equals(other.idLaboratoryReception);   
    }

    @Override
    public String toString() {
        return "LaboratoryReception[ idLaboratoryReception=" + idLaboratoryReception + ",idExamination=" + idExamination + ",idLaboratory=" + idLaboratory + ",analysisDate=" + analysisDate + ",analysisResult=" + analysisResult + ",idAnalysis=" + idAnalysis + " ]";
    }
    
}
