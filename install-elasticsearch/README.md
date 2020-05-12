## ansible安装nacos集群
自动化可扩展ansible 安装nacos
只需要修改hosts文件，以及下载所需的安装文件到/root/目录下 nacos
### 准备
1. 下载nacos安装包到部署机`/root/`下
2.  修改ansible的hosts文件，增加nacos的分组
3. 修改 nacos/vars/nacos.yml 的变量

### 安装
`ansible-playbook nacos.yml -vv`

### 停止
`ansible nacos -m shell -a "sh /data/nacos/nacos/bin/shutdown.sh"`


