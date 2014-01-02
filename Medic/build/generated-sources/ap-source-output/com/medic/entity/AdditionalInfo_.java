package com.medic.entity;

import com.medic.entity.GroupInfo;
import com.medic.entity.MedicalCard;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2014-01-02T01:13:38")
@StaticMetamodel(AdditionalInfo.class)
public class AdditionalInfo_ { 

    public static volatile SingularAttribute<AdditionalInfo, String> description;
    public static volatile SingularAttribute<AdditionalInfo, Integer> idInfo;
    public static volatile SingularAttribute<AdditionalInfo, MedicalCard> idMedicalCard;
    public static volatile SingularAttribute<AdditionalInfo, GroupInfo> idGroupInfo;

}