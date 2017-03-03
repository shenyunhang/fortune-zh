# fortune-zsh
中文的fortune

##需要先安装
fortune  
strfile(通常会和fortune一起安装)

##可选安装
cowsay  
ponysay  

##安装:
`git clone --recursive https://github.com/shenyunhang/fortune-zh.git`  
`cd fortune-zh`  
`./gushiwen-crawler/start_crawler.sh`  
`./install.sh`

##用法:
`fortune 先秦 两汉 魏晋 南北朝 隋代 唐代 五代 宋代 金朝 元代 明代 清代`

登陆显示，在~/(你的shell配置文件)的最后加入：  
`fortune 先秦 两汉 魏晋 南北朝 隋代 唐代 五代 宋代 金朝 元代 明代 清代`
`echo ''`

或者:  
`fortune 先秦 两汉 魏晋 南北朝 隋代 唐代 五代 宋代 金朝 元代 明代 清代 |cowsay`  
`echo ''`

或者:  
`fortune 先秦 两汉 魏晋 南北朝 隋代 唐代 五代 宋代 金朝 元代 明代 清代 |ponysay`  
`echo ''`

##问题
如果安装后不能用，则先输入：  
`fortune -f  `
查看是否已经导入先秦、两汉、魏晋、南北朝、隋代、唐代、五代、宋代、金朝、元代、明代和清代的数据。  
如果没有，则修改install.sh里的“FORTUNES”变量到对应的路径再安装。  


