package com.jiazhielec.common.core.redis;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.connection.RedisStringCommands;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.script.RedisScript;
import org.springframework.data.redis.core.types.Expiration;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

/**
 * @author ze.chen
 * @description redis锁SET实现
 * @date 2022/6/14
 **/
@Component
public class RedisLock{
    private static final Logger log = LoggerFactory.getLogger(RedisLock.class);

    @Resource
    private RedisTemplate redisTemplate;

    /**
     * 获取分布式锁
     * 也可以通过这种方式执行setNX操作： return redisTemplate.opsForValue().setIfAbsent(redisKey, redisValue);
     * @param key 键
     * @param expireTime 过期时间 单位：秒
     * @param value 值
     * @return 真假值
     */
    public boolean getLock(String key, int expireTime, String value) {
        RedisCallback<Boolean> redisCallback = connection -> {
            //设置NX
            RedisStringCommands.SetOption setOption = RedisStringCommands.SetOption.ifAbsent();
            //设置过期时间
            Expiration expiration = Expiration.seconds(expireTime);
            //序列化key
            byte[] redisKey = redisTemplate.getKeySerializer().serialize(key);
            //序列化value
            byte[] redisValue = redisTemplate.getValueSerializer().serialize(value);
            if (redisKey != null && redisValue != null){
                //执行set命令操作（获取锁的操作）
                return connection.set(redisKey, redisValue, expiration, setOption);
            }else {
                return false;
            }
        };
        return (Boolean) redisTemplate.execute(redisCallback);
    }

    /**
     * 释放分布式锁
     * @return 真假值
     */
    public boolean unLock(String key, String value) {
        boolean result = false;
        boolean hasKey = redisTemplate.hasKey(key);
        if (hasKey && Objects.equals(redisTemplate.opsForValue().get(key), value)){
            String script = "if redis.call(\"get\",KEYS[1]) == ARGV[1] then\n" +
                    "    return redis.call(\"del\",KEYS[1])\n" +
                    "else\n" +
                    "    return 0\n" +
                    "end";
            RedisScript<Boolean> redisScript = RedisScript.of(script, Boolean.class);
            List<String> keys = Collections.singletonList(key);
            //执行键删除操作
            result = (Boolean) redisTemplate.execute(redisScript, keys, value);
            if(result){
                log.info("线程{}释放锁成功,ip地址{}", Thread.currentThread().getId(),value);
            }else{
                log.info("线程{}不能释放其他线程已抢到的锁，等待下一次定时任务执行,ip地址{}", Thread.currentThread().getId(),value);
            }
        }
        return result;
    }
}
