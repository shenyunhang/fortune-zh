# fortune-zsh
中文的fortune

##需要先安装
gushiwen-crawler
fortune
strfile(通常会和fortune一起安装)

##可选安装
cowsay
ponysay

##安装:
`cd fortune-zh`
`make all`
`make install`

##用法:
`fortune -e song100 tang300 shijing chinese`

登陆显示，在~/(你的shell配置文件)的最后加入：
`fortune -e song100 tang300 shijing chinese`
`echo ''`

或者:
`fortune -e song100 tang300 shijing chinese |cowsay`
`echo ''`

或者:
`fortune -e song100 tang300 shijing chinese |ponysay`
`echo ''`

##问题
如果安装后不能用，则先输入：
`fortune -f  `
查看是否已经导入song100 tang300 shijing chinese的数据。
如果没有,则修改Makefile里的“FORTUNES”变量到对应的路径再安装。


