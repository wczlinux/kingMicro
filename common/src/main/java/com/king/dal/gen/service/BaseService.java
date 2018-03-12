package com.king.dal.gen.service;

import java.util.List;
import java.util.Map;

/**
 * service基础接口
 * @author King chen
 * @emai 396885563@qq.com
 * @data2018年3月5日
 * @param <T>
 */
public interface BaseService<T> {

	/**
	 * 删除
	 */
	
	public void delete(Object id);
	
	/**
	 * 更新
	 */
	public void update(T obj);
	
	/**
	 * 批量删除
	 */
	public void deleteBatch(Object[] ids);
	
	/**
	 * 保存
	 */
	public void save(T obj);
	
	/**
	 * 条件查询总数
	 */
	public int queryTotal(Map<String, Object> map);
	
	/**
	 * 查询总数
	 */
	public int queryTotal();
	
	/**
	 * 根据ID，查询
	 */
	public T queryObject(Long id);
	
	/**
	 * 参数条件查询列表
	 */
	public  List<T> queryList(Map<String, Object> map);

}
