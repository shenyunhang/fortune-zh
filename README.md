# fortune-zsh
中文的fortune  
采用debian的数据库  

##需要先安装
fortune strfile(通常会和fortune一起安装)  
##可选安装
cowsay ponysay
##安装：
`
    cd fortune-zh  

    make  

    make install  
`

##用法:
在/etc/bash.bashrc或者~/(你的shell配置文件)的最后加入：  
`
fortune -e song100 tang300 shijing chinese  

echo ''  
`

或者  
` 
fortune -e song100 tang300 shijing chinese |cowysay  

echo ''  
`

或者  
`
fortune -e song100 tang300 shijing chinese |ponysay  

echo ''  
`


如果安装后不能用，则先输入：  
`
fortune -f  
`
查看是否已经导入song100 tang300 shijing chinese的数据  
然后修改Makefile里对应的路径再安装。  

