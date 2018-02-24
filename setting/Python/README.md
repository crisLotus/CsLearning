# pipenv常用命令
* 强制更新pip python3 -m pip install --upgrade --force-reinstall pip
* pip install pipenv 安装
* pipenv --three 创建python3虚拟环境 
* sed -i s/pypi.tuna.tsinghua.edu.cn/g Pipfile 更换清华的pipy源 
* pipenv install --dev
	安装列表是通过读取pipfile, pipfile.lock文件实现的,如果没有这两个文件就根据requirements.txt生成pipfile和pipfile.lock并读取.
* 想单独安装某个模块还可以指定模块名安装:pipenv install sanic

# 语法
django = "==2.0.1"
pylint = "*"