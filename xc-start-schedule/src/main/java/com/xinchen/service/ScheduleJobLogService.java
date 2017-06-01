package com.xinchen.service;


import com.xinchen.entity.ScheduleJobLogEntity;

import java.util.List;
import java.util.Map;

/**
 * Description:定时任务日志
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/4/30 20:57.
 * @see 2017/4/30 20:57 Created
 ****************************************/
public interface ScheduleJobLogService {

	/**
	 * 根据ID，查询定时任务日志
	 */
	ScheduleJobLogEntity queryObject(Long jobId);
	
	/**
	 * 查询定时任务日志列表
	 */
	List<ScheduleJobLogEntity> queryList(Map<String, Object> map);
	
	/**
	 * 查询总数
	 */
	int queryTotal(Map<String, Object> map);
	
	/**
	 * 保存定时任务日志
	 */
	void save(ScheduleJobLogEntity log);
	
}
