
package com.medic.facade;

import com.medic.facade.local.GroupInfoFacadeLocal;
import com.medic.entity.GroupInfo;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Stateless (name="GroupInfoBean")
public class GroupInfoFacade extends AbstractFacade<GroupInfo> implements GroupInfoFacadeLocal {

  @PersistenceContext(unitName = "MedicPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public GroupInfoFacade() {
        super(GroupInfo.class);
    }

}
