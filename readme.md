# pwsh-DataZipper

简介：一个依据文件修改日期归档压缩文件的 powershell 文件压缩器，可以通过 .ini 配置文件指定源文件目录和归档目录。

作者：李俊才

邮箱：291148484@163.com

开源协议：MIT

2023 年 4 月

## 用法

### 项目的本地化

```
git clone http://thispage.tech:9680/jclee1995/pwsh-datazipper.git
```

或者

```
git clone https://gitee.com/jacklee1995/pwsh-datazipper.git
```

### 依赖模块安装

使用前需要进入项目根目录下，

```
cd pwsh-DataZipper
```

然后，使用git直接将依赖模块安装过来：

```
git clone http://thispage.tech:9680/jclee1995/pwsh-utils.git
```

或者：

```
git clone https://gitee.com/jacklee1995/pwsh-utils.git
```


运行 index.ps1 即可。


## 关于配置文件

配置文件看起来是这样子的：

```ini
[Author]
Name=JackLee
Email=291148484@163.com
LICENCE=MIT

[params]
SOURCES_DIR=D:\\desktop\\笔记本
ARCHIVES_DIR=D:\desktop\archives
ARCHIVES_FOLDER_NAME=FOLDER
ARCHIVES_FILE_NAME=FILE
```

其中：

- SOURCES_DIR 表示存放需要压缩的文件或文件夹的路径。该目录下的所有同日期的文件和文件夹最终会生成到同一个压缩包中；
- ARCHIVES_DIR 表示存放压缩包的路径，该路径必须是一个文件夹，所有生成的压缩包将会放到这个文件夹下。
