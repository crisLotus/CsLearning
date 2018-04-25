# SpringCloud微服务
## 微服务常见模式
* 配置管理（configuration management）
* 服务发现（service discovery）
* 断路器（circuit breakers）
* 智能路由（ intelligent routing）
* 微代理（micro-proxy）
* 控制总线（control bus）
* 一次性令牌（ one-time tokens）
* 全局锁（global locks）
* 领导选举（leadership election）
* 分布式会话（distributed sessions）
* 集群状态（cluster state）

## 重要部分及工具
* 服务发现（service discovery）
    * Eureka、Consul、Zookeeper
* 服务消费者
    * 复杂均衡
        * Netflix的Ribbon
    * Feign声明式的web service客户端
* 熔断器
    * Hystrix
    * Hystrix Dashboard Hystrix监控
    * Turbine测试
* 配置中心
    * Spring Cloud Config
* API Gateway
    * Zuul动态路由、监控、回退、安全等功能

## 微服务选型
* Spring cloud
* Dubbo
* Dropwizard
* Armada

## 微服务设计原则
* 单一指责原则
* 服务自治原则
* 轻量级通信原则
* 微服务粒度

# 资源
* 《使用Spring Cloud与Docker实战微服务》
* https://github.com/prontera/spring-cloud-rest-tcc
* https://github.com/eacdy/spring-cloud-study
*  export PATH=$PAHT:<PATH 1>
