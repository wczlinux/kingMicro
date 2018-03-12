package com.king.common.utils;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;

/**
 * redis实体映射
 * @author King chen
 * @emai 396885563@qq.com
 * @data2018年2月26日
 */
@Component
public class EnttyMapperRedis {
	
	@Autowired
    private RedisUtils redisUtils;


    public void set(String entity,String field,Object value) {
        if(entity == null){
            return ;
        }
        String key = RedisKeys.getEnttyKey(entity);
        redisUtils.hset(key.trim(), field.trim(),value,-1);
    }

    public <T> T get(Class<T> clazz){
        String key = RedisKeys.getEnttyKey(clazz.getSimpleName());
        return  redisUtils.get(key, clazz);
    }
}
