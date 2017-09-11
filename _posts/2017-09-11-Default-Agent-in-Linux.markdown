---
layout     : post
title      : "Create a VM image in Azure"
subtitle   : ""
date       : 2017-09-11
author     : "Shihta"
tags       : Azure Image
comments   : true
---

# Create Image

1. Execute following instruction in your VM

    ```
    $ sudo waagent -deprovision
    ```

2. Create image by CLI

    ```
    az vm generalize --resource-group qa-playform-rg --name qa-playform-mns-g-ap-0
    az image create --resource-group qa-playform-rg --name qa-playform-mns-g-ap-0-image-0 --source qa-playform-mns-g-ap-0
    ```

Please refer to [capture-image][1] for the details.

# waagent

By default, Azure put [WALinuxAgent][2] in your Linux system. You can use `waagent` to execute *deprovision*.

In Ubuntu, it's package name is *walinuxagent*.

<!-- Reference -->

[1]: https://docs.microsoft.com/en-us/azure/virtual-machines/linux/capture-image
[2]: https://github.com/Azure/WALinuxAgent
