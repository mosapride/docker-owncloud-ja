# docker-owncloud-ja

公式のDockerHub-owncloudを日本語化するよりCentOSを日本語化したほうが早かったので。

OS:centos 7  
Install:owncloud  
その他:日本語環境設定

## Example Usage
    docker build -t owncloudjp:tag
    docker run --it -p 80:80 -p 443:443 owncloudjp:tag

http://ip-address  にアクセス


## Document

https://download.owncloud.org/download/repositories/9.0/owncloud/

https://doc.owncloud.org/server/9.0/admin_manual/installation/linux_installation.html