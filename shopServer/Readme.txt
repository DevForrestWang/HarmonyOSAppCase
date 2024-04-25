1、shopServer 功能：Web Server服务器；提供shops接口，返回JSON格式的商品信息。

2、首次使用注意事项：
   1）安装Node.js和npm, 参考文章:
      https://www.liaoxuefeng.com/wiki/1022910821149312/1023025597810528
   2）在 shopServer 目录下，执行：npm install 命令，安装遗留的包
   3）服务监听的端口，9588，如果有冲突，在 app.js 文件中调整
   4）mac下，客户端访问需要使用IP地址，如：http://192.168.1.xxx

3、启动服务器： npm start
