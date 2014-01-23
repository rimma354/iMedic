
package com.medic.facade.local;

import com.medic.entity.GroupInfo;
import java.util.List;
import javax.ejb.Local;


@Local
public interface GroupInfoFacadeLocal {
    
    void create(GroupInfo groupInfo);

    void edit(GroupInfo groupInfo);

    void remove(GroupInfo groupInfo);

    GroupInfo find(Object id);

    List<GroupInfo> findAll();
    
}
