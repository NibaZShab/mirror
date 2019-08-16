---
title: 手机搭建hexo博客
date: 2019-08-16 11:59:15
---

# 写在前面
本文只讲述如何搭建最基础的 hexo 博客，更多深层次的内容暂且不提，基本的写文章等操作请自行百度，也可以发邮件问我，随缘回复哦

>  
本文章指令中的所有中文内容皆字如其意
例如：**你的用户名** 就是指在此处填写 **你注册Github时的用户名**

| 条件 | 详情 |
| :--- | ---: |
| Github账号 | 用于部署静态页面 |
| Termux | 终端操作环境 |

# Github
点击 [传送门](https://github.com) 进入官网，官网是英文界面，注册时建议使用电脑注册，如有看不懂的可以与下图对照，然后按下图所示进行注册（用户名须是英文）

![](/sdcard/$/1.jpg)

填写完成后，点击下方绿色按钮，进入新的页面，如果出现的不是下图的界面，请更换用户名或者邮箱，重新注册  
  
点击绿色按钮

![](/sdcard/2.jpg)

选择画红圈的部分，底下还有两个选项不要管它，继续点击绿色按钮

![](/sdcard/3.jpg)

这时候，会出现一大堆乱七八糟的东西，我们这回不点击绿色按钮，而是点击它旁边的蓝色小字

![](/sdcard/4.jpg)

点击画红圈的绿色按钮

![](/sdcard/5.jpg)

在红色箭头所指的方框内填入下方的内容
```
你的用户名.github.io
```
然后选择画红圈的选项，再点击绿色按钮

![](/sdcard/6.jpg)

然后会出现下图界面，这时候你的Github账号就准备完成了，不要管界面讲的啥，直接退出

![](/sdcard/7.jpg)

一个阶段的结束，恭喜你！你离成功又近了一步！

# Termux
## 获取app
请点击 [传送门](https://play.google.com/store/apps/details?id=com.termux) 下载，打不开的请使用先进的上网工具

安装完成，打开该app后，会自行下载运行终端所需要的文件，稍加等待片刻

## 准备工作
以下指令请一行一行的复制粘贴哦，如提示``y or n``，输入y然后回车即可
```sh
pkg install git -y
pkg install nodejs-lts -y
pkg install ssh -y
npm install hexo-cli -g
npm install hexo --save好
```
输入以上命令就完成了准备工作啦

## 创建本地博客
接下来即将在手机上部署一个本地动态博客，请继续复制指令  
  
创建一个博客文件夹
```sh
mkdir blog
```
进入博客文件夹
```sh
cd blog
```
拉取本地动态博客文件
```sh
hexo init
```

## 连接Github

设置git，连接你的Github账号
```sh
git config --global user.name "你的用户名"
git config --global user.email "你的邮箱"
git init
git remote add origin git@github.com:你的用户名/你的用户名.github.io.git
```
生成ssh密钥，如出现提示请按回车，应该需要按4次
```sh
ssh-keygen -t rsa -C "你的邮箱"
```
读取生成的ssh密钥
```sh
cat $HOME/.ssh/id_rsa.pub
```
如下图所示

![](/sdcard/8.jpg)

复制此ssh密钥，然后用电脑打开下方链接
```
https://github.com/你的用户名/你的用户名.github.io
```
然后点击画红圈部分

![](/sdcard/9.jpg)

然后点击红箭头指的部分，再点击画红圈的部分

![](/sdcard/10.jpg)

在画红圈部分粘贴上刚刚复制的ssh密钥，上方红色箭头指的部分填写此ssh密钥的昵称（随便填，是英文就行），在下方红色箭头指的地方打上勾，再点击绿色按钮  
  
接着继续操作termux，复制以下指令即可
```sh
pkg install vim -y
```
这一步是安装好用的一个文本编辑器，接着打开博客配置文件
```sh
vim _config.yml
```
然后把光标移到底部，可以看到如下图所示内容

![](/sdcard/12.jpg)

将其修改为以下样式
```sh
deploy:
 type: git
 repo: git@github.com:你的用户名/你的用户名.github.io.git
 branch: master
```
然后按一下底部快捷键的**ESC**键（如没有快捷键，请同时按住**音量+**和**q**就会出现），然后连按两下大写字母**Z**保存并退出  
  
恭喜，你现在离成功只差一步了！

## 部署到服务器
话不多说，依然是复制粘贴
```sh
npm install hexo-deployer-git --save
```
开始部署文件
```sh
hexo clean
hexo g
hexo d
```
第一次部署需要输入yes

>  
此步骤的第二行是生成博客的静态文件
第三行是部署进服务器的指令

# 打开博客

以上操作完成之后，在浏览器输入以下网址即可打开你的个人博客
```
https://你的用户名.github.io/
```
如确定一切操作没问题，却打不开的话，等几分钟就好了

---

>  
以下内容与本文无太大关系，属于拓展教程

### 写文章
进入博客文件夹内
```sh
cd blog
```
输入以下指令创建新文章
```sh
hexo new 文章的名称
```
随后在``~/blog/source/_posts/``目录下，会出现一个``.md``文件，须使用 ``markdown`` 语法编辑内容

### 本地动态博客
进入博客文件夹内
```sh
cd blog
```
输入以下指令
```sh
hexo s
```
然后，在浏览器打开以下网址即可
```
http://localhost:4000
```
此网址仅限本机可用，同局域网内其他用户输入你的ip地址即可

---
# 完

>  
注：文章部分内容转载于[零基础Hexo+Github搭建博客](https://sulisong.cn/myposts/su5/)
