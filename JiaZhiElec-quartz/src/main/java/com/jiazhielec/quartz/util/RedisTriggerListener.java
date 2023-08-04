package com.jiazhielec.quartz.util;

import com.jiazhielec.common.core.redis.RedisLock;
import com.jiazhielec.common.utils.ip.IpUtils;
import com.jiazhielec.common.utils.spring.SpringUtils;
import org.quartz.JobExecutionContext;
import org.quartz.Trigger;
import org.quartz.TriggerListener;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.TimeUnit;

/**
 * @author ze.chen
 * @description 实现Quartz调度的监听器接口TriggerListener
 * @date 2022/6/14
 **/
public class RedisTriggerListener implements TriggerListener {
    private static final Logger log = LoggerFactory.getLogger(RedisTriggerListener.class);

    public RedisLock redisLock = SpringUtils.getBean(RedisLock.class);

    public RedissonClient redisson = SpringUtils.getBean(RedissonClient.class);

    @Override
    public String getName() {
        return "RedisTriggerListener";
    }

    @Override
    public void triggerFired(Trigger trigger, JobExecutionContext jobExecutionContext) {

    }

    /**
     * 当一个scheduler被调起时，将会唤起vetoJobExecution方法
     * 返回true，则取消任务执行，否则继续执行
     * @author ze.chen
     */
    @Override
    public boolean vetoJobExecution(Trigger trigger, JobExecutionContext jobExecutionContext) {
        try {
            String lockKey = trigger.getJobKey().getGroup() + ":" + trigger.getJobKey().getName();
            // redisson工具实现
//            RLock lock = redisson.getLock(lockKey);
//            return !lock.tryLock(1L, 60, TimeUnit.SECONDS);
            // 自定义分布式锁工具-获取到锁,true代表获取到锁，返回false放行， false代表获取锁失败，返回true停止执行
            boolean lock = redisLock.getLock(lockKey, 60, IpUtils.getHostIp());
            if (lock){
                log.info("线程{}获取锁成功,ip地址{}", Thread.currentThread().getId(),IpUtils.getHostIp());
            }else{
                log.info("线程{}获取锁失败,ip地址{}", Thread.currentThread().getId(),IpUtils.getHostIp());
            }
            return !lock;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public void triggerMisfired(Trigger trigger) {

    }

    /**
     * 在任务调度执行完成时，调用此方法
     */
    @Override
    public void triggerComplete(Trigger trigger, JobExecutionContext context, Trigger.CompletedExecutionInstruction triggerInstructionCode) {
        String lockKey = trigger.getJobKey().getGroup() + ":" + trigger.getJobKey().getName();
        try {
            // redisson工具实现
//            RLock lock = redisson.getLock(lockKey);
//            if (lock.isLocked()){
//                lock.unlock();
//            }
            //自定义分布式锁实现
            String value = IpUtils.getHostIp();
            redisLock.unLock(lockKey, value);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
