package com.xinchen.dao;

import java.util.List;
import java.util.Map;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/4/30 20:51.
 * @see 2017/4/30 20:51 Created
 ****************************************/

public interface BaseDao<T> {
    void save(T t);

    void save(Map<String, Object> map);

    void saveBatch(List<T> list);

    int update(T t);

    int update(Map<String, Object> map);

    int delete(Object id);

    int delete(Map<String, Object> map);

    int deleteBatch(Object[] id);

    T queryObject(Object id);

    List<T> queryList(Map<String, Object> map);

    List<T> queryList(Object id);

    int queryTotal(Map<String, Object> map);

    int queryTotal();
}
