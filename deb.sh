cd ~
read -p "请输入你要创造的软件包名（请输入连续的英文）：" DEBNAME
mkdir $DEBNAME
cd $DEBNAME
mkdir DEBIAN
touch DEBIAN/control

echo -e "如果你是 Linux ，请输入 1\n如果你是 Termux ，输入啥都行\n"

read -p "请输入值：" NUM
if [ $NUM = 1 ]
then
  mkdir bin
  cd bin
else
	mkdir data/data/com.termux/files/usr/bin
  cd ddata/data/com.termux/files/usr/bin
fi

read -p "请把你要做成deb包的可执行文件放进 $HOME 目录下，并在这里输入它的名称：" BIN
mv $HOME/$BIN ./

cd -
echo "假设 test 为该应用包名"
echo "DEBIAN/control 文件请自行编写，它至少得包含以下三条"
echo "
Package: test    包名
Version: 1.0    版本号
Architecture: all    运行架构
"
ehco "打包指令为 dpkg-deb -b $HOME/tset $HOME/test.deb"
echo "如提示权限不足，则先输入 chmod -Rf 0755 $HOME/tset 再打包即可"
