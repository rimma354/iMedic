/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medic.facade;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;

/**
 *
 * @author Rimma
 */
public abstract class AbstractFacade<T> {

    private Class<T> entityClass;

    public AbstractFacade(Class<T> entityClass) {
        if (entityClass != null) {
            this.entityClass = entityClass;
        }
    }

    protected abstract EntityManager getEntityManager();

    public void create(T entity) {
        if (entity != null) {
            getEntityManager().persist(entity);
            getEntityManager().flush();
        }
    }

    public void edit(T entity) {
        if (entity != null) {
            getEntityManager().merge(entity);
        }
    }

    public void remove(T entity) {
        if (entity != null) {
            getEntityManager().remove(getEntityManager().merge(entity));
        }
    }

    public T find(Object id) {
        if (id != null) {
            return getEntityManager().find(entityClass, id);
        }
        else return null;
    }

    public List<T> findAll() {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        return getEntityManager().createQuery(cq).getResultList();
    }

}
