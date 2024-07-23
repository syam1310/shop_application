package com.shop.shop_app.aspect;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import java.time.Duration;
import java.time.Instant;

@Aspect
@Slf4j
@Component
public class LoggerAspect {

    @Around("execution(* com.shop.shop_app..*.*(..))")
    public Object log(ProceedingJoinPoint joinPoint) throws Throwable{
        log.info(joinPoint.getSignature().toString()+" method execution start!");
        Instant start = Instant.now();
        Object returnObj = joinPoint.proceed();
        Instant end = Instant.now();
        long timeElapsed = Duration.between(start, end).toMillis();
        log.info("Time took to execute "+joinPoint.getSignature().toString()+" method is: "+timeElapsed+"ms");
        log.info(joinPoint.getSignature().toString()+" method execution end!");
        return returnObj;
    }

    @AfterThrowing(value = "execution(* com.shop.shop_app..*.*(..))", throwing = "ex")
    public void logException(JoinPoint joinPoint, Exception ex){
        log.error(joinPoint.getSignature()+" An exception due to : "+ex.getMessage());
    }
}
