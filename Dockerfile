# 基于java 8 镜像
FROM anapsix/alpine-java:8_server-jre
# 将本地文件夹挂载到当前容器（tomcat使用）

VOLUME /tmp
# 拷贝文件到容器
ADD target/zipkin-server-2.8.3-exec.jar /app.jar
# 打开服务端口
EXPOSE 83
#变更时区
#ENV TZ=Asia/Shanghai
#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 配置容器启动后执行的命令
# 随机数生成采用非阻塞的熵池
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]

##构建步骤
##索引到项目目录(具有pom.xml)
##执行命令 mvn package docker:build -Ddocker.image.prefix=onsoul
