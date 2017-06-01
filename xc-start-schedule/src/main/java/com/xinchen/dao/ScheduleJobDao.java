package com.xinchen.dao;

import com.xinchen.entity.ScheduleJobEntity;

import java.util.Map;

/**
 * Description:定时任务
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/4/30 20:57.
 * @see 2017/4/30 20:57 Created
 ****************************************/

public interface ScheduleJobDao extends BaseDao<ScheduleJobEntity>{
    /**
     * 批量更新状态
     */
    int updateBatch(Map<String, Object> map);
}
