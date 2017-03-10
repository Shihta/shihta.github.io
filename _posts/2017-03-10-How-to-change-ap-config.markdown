---
layout     : post
title      : "How to change ap config"
subtitle   : ""
date       : 2017-03-10
author     : "Shihta"
tags       : Docker
comments   : true
---

# Introduction


基本的系統架構請參考[這篇][2]

相關檔案如下：

```
TACOCloud
├── Dockerfile.mdap
├── dockerfiles
│   ├── php
│   │   └── 5.6
│   │       └── apache
│   │           ├── apache2.conf
│   │           ├── apache2.conf.overwrite
│   │           ├── apache2-foreground
│   │           ├── apache2-foreground.overwrite
│   │           ├── Dockerfile
│   │           ├── Dockerfile.pad
│   │           ├── docker-php-ext-configure
│   │           ├── docker-php-ext-enable
│   │           ├── docker-php-ext-install
│   │           ├── testphp
│   │           │   ├── index.php
...
│   │           └── zend-loader-php5.6-linux-x86_64.tar.gz
...
```

- `Dockerfile.mdap`用來建置AP Service
- `dockerfiles/php/5.6/apache/Dockerfile`用來建置底層的php & apache環境，詳細內容可以參考[Docker Hub][1]
- `apache2.conf.overwrite`會覆蓋AP Service內的apache2.conf，因此要改就改這個
- 如果要改php.ini之類設定，可寫在`Dockerfile`裡面，透過`echo`的方式寫入檔案



<!-- Reference -->

[1]: https://hub.docker.com/_/php/ "OFFICIAL REPOSITORY: php"
[2]: /2017/03/08/Images-and-layers/ "Images and layers"