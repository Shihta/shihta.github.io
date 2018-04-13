---
layout     : post
title      : "Images and layers"
subtitle   : ""
date       : 2017-03-08
author     : "Shihta"
tags       : Docker
comments   : true
---

# Layers of Docker

Layers的概念可參考下圖，官方文件可參考[這裡][1]

![ubuntu 15.04 image](/static/2017-03-08/sharing-layers.jpg)

其中每一個Layer就代表Dockerfile中的一行指令

```Dockerfile
FROM shihta/php-5.6-apache
RUN apt-get install -y sudo cron mysql-client --no-install-recommends
ADD frontend/zguard.server/ /var/www/server/
RUN chown -R www-data:www-data /var/www/server
COPY dockerfiles/php/5.6/apache/apache2-foreground.overwrite /usr/local/bin/apache2-foreground
```

上面這一段為`Dockerfile.mdap`的內容，代表會基於`shihta/php-5.6-apache
`建立4個Layers，每一個Layer的內容就是該指令執行完後的結果

# Architecture Concept

我們有以下需求:

 - redis
 - mariadb
 - php
 - python

分析這些Images的Layers，結果如下：

![Layers of Docker Image](/static/2017-03-08/Layers-of-Docker-Image.png)

因此可以基於`buildpack-deps:jessie`建構一個屬於我們的base image，之後再基於該base image建構每個service

# Implementation

```
TACOCloud
├── dockerfiles      # Modified Dockerfile
├── docker-library   # Source
├── ...
```

如上，在專案目錄下會有`docker-library`放置Dockerfile的source，以**git submodule**的方式儲存、紀錄版本

```
dockerfiles/
├── base
│   └── debian
│       ├── Dockerfile
│       ├── Dockerfile.pad
│       ├── ...
...
```

如上，以`shihta/base-debian-jessie`為例

- `Dockerfile`是完整的內容
- `Dockerfile.pad`是額外增加進去的內容，也是客製化的部分

可公開、獨立的image都放在[Docker hub][2]

<!-- Reference -->

[1]: https://docs.docker.com/engine/userguide/storagedriver/imagesandcontainers/ "Understand images, containers, and storage drivers"
[2]: https://hub.docker.com/u/shihta/ "Shihta's Docker Hub"