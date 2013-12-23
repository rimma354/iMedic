package com.medic.entity;

import com.medic.entity.AdditionalInfo;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2013-12-23T16:50:57")
@StaticMetamodel(GroupInfo.class)
public class GroupInfo_ { 

    public static volatile CollectionAttribute<GroupInfo, AdditionalInfo> additionalInfos;
    public static volatile SingularAttribute<GroupInfo, Integer> idGroupInfo;
    public static volatile SingularAttribute<GroupInfo, String> groupTitle;

}