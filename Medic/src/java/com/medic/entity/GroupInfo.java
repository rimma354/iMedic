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
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "GROUP_INFO")
@NamedQueries({
    @NamedQuery(name = "GroupInfo.findAll", query = "SELECT g FROM GroupInfo g"),
    @NamedQuery(name = "GroupInfo.findByIdGroupInfo", query = "SELECT g FROM GroupInfo g WHERE g.idGroupInfo = :idGroupInfo")})
public class GroupInfo implements Serializable {

    @Id
    @GeneratedValue(strategy = SEQUENCE, generator = "ID_GROUP_INFO")
    @SequenceGenerator(name = "ID_GROUP_INFO", sequenceName = "ID_GROUP_INFO", allocationSize = 1)
    @NotNull
    @Column(name = "ID_GROUP_INFO")
    private Integer idGroupInfo;
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "GROUP_TITLE")
    private String groupTitle;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idGroupInfo")
    private Collection<AdditionalInfo> additionalInfos;

    public GroupInfo() {
    }

    public GroupInfo(String groupTitle) {
        if (groupTitle != null) {
            this.groupTitle = groupTitle;
        }
    }

    public Integer getIdGroupInfo() {
        return idGroupInfo;
    }

    public String getGroupTitle() {
        return groupTitle;
    }

    public void setGroupTitle(String groupTitle) {
        if (groupTitle != null) {
            this.groupTitle = groupTitle;
        }
    }

    public Collection<AdditionalInfo> getAdditionalInfos() {
        return additionalInfos;
    }

    public void addAdditionalInfo(AdditionalInfo additionalInfo) {
        if (this.additionalInfos == null) {
            this.additionalInfos = new ArrayList<AdditionalInfo>();
        }
        this.additionalInfos.add(additionalInfo);
    }

    @Override
    public int hashCode() {
        int hash = 0;
        if (idGroupInfo != null) {
            hash += idGroupInfo.hashCode();
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof GroupInfo)) {
            return false;
        }
        GroupInfo other = (GroupInfo) object;
        return (this.idGroupInfo.equals(other.idGroupInfo));
    }

    @Override
    public String toString() {
        return "GroupInfo[ idGroupInfo=" + idGroupInfo + ",groupTitle=" + groupTitle + " ]";
    }

}
