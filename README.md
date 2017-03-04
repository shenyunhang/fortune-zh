# fortune-zsh
中文的fortune

#依赖
fortune

strfile(通常会和fortune一起安装)

#安装:

1. 克隆仓库
  ```Shell
  # Make sure to clone with --recursive
  git clone --recursive https://github.com/shenyunhang/fortune-zh.git
  ```

2. 爬取古诗文
  ```shell
  cd fortune-zh
  ./gushiwen-crawler/start_crawler.sh
  ```

3. 安装古诗文
  ```shell
  ./install.sh
  ```

#快速安装

使用我已经爬取下来的古诗文数据。

1. 克隆仓库
  ```Shell
  git clone --recursive https://github.com/shenyunhang/fortune-zh-data.git
  ```
  
2. 安装古诗文
  ```Shell
  cd fortune-zh-data
  sudo cp * /usr/share/games/fortunes/
  ```
  
#用法:

1. 随机输出古诗文
  ```shell
  fortune -e 先秦 两汉 魏晋 南北朝 隋代 唐代 五代 宋代 金朝 元代 明代 清代
  ```

2. 设置终端登陆显示。在shell配置文件的最后加入：  
  ```shell
  fortune -e 先秦 两汉 魏晋 南北朝 隋代 唐代 五代 宋代 金朝 元代 明代 清代
  echo ''
  ```

  登录效果图：  
  ![image](https://github.com/shenyunhang/fortune-zh/blob/master/screenshots/Capture.PNG)
  ![image](https://github.com/shenyunhang/fortune-zh/blob/master/screenshots/Capture2.PNG)
  ![image](https://github.com/shenyunhang/fortune-zh/blob/master/screenshots/Capture3.PNG)


3. 或者
  ```shell
  fortune -e 先秦 两汉 魏晋 南北朝 隋代 唐代 五代 宋代 金朝 元代 明代 清代 |cowsay
  echo ''
  ```

4. 或者:  
  ```shell
  fortune -e 先秦 两汉 魏晋 南北朝 隋代 唐代 五代 宋代 金朝 元代 明代 清代 |ponysay
  echo ''
  ```

#问题
如果安装后不能用，则先输入：
```shell
fortune -f
```
查看是否已经导入先秦、两汉、魏晋、南北朝、隋代、唐代、五代、宋代、金朝、元代、明代和清代的数据。

如果没有，则修改install.sh里的“FORTUNES”变量到对应的路径再安装。  


