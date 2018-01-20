# [anconda](http://www.jianshu.com/p/d2e15200ee9b)

```
conda update conda 	# 升级当前版本的conda
conda create 		# conda create -n bunnies python=3 Astroid Babel
activate		 	# 激活环境
deactivate			# 推出环境
conda info -e		# 列出所有的环境
conda remove		# 删除某个环境
conda list			# 查看该环境中包和其版本的列表
conda search		# 搜索可用的包
conda install		# 安装可用的包

例子:
conda update conda
conda create --name snowflake biopython
conda create -n bunnies python=3 Astroid Babel
conda create -n flowers --clone snowflakes
conda remove -n flowers --all
conda info --envs
conda info -e
activate snowflake
deactivate
conda list
conda search beautifulsoup4
conda install iopro
conda install --channel https：//conda .anaconda.ort/pandas bottleneck
```

# 包管理
* [pipenv使用指南](https://pengshp.github.io/post/pipenv-guide/)
* pip、easy_install和virtualenv，virtualenvwrapper、virtualenv-burrito和autoenv，pyvenv、venv（Python 3标准库）、pyenv
* 强制更新pip python3 -m pip install --upgrade --force-reinstall pip
* 安装 pip install pipenv
* 创建虚拟环境 pipenv --three
* 新建Python3 的虚拟环境 pipenv --three
* 更换清华的pipy源 sed -i s/pypi.tuna.tsinghua.edu.cn/g Pipfile
* pipenv install安装列表是通过读取pipfile, pipfile.lock文件实现的,如果没有这两个文件就根据requirements.txt生成pipfile和pipfile.lock并读取.
* 想单独安装某个模块还可以指定模块名安装:pipenv install sanic

# pylint
* pip install pylint
* [一个文档](https://www.ibm.com/developerworks/cn/linux/l-cn-pylint/index.html)

## MESSAGE_TYPE 
(C) 惯例。违反了编码风格标准
(R) 重构。写得非常糟糕的代码。
(W) 警告。某些 Python 特定的问题。
(E) 错误。很可能是代码中的错误。
(F) 致命错误。阻止 Pylint 进一步运行的错误。

## Pylint 的常用命令行参数
* -h,--help
显示所有帮助信息。
* --generate-rcfile
可以使用 pylint --generate-rcfile 来生成一个配置文件示例。可以使用重定向把这个配置文件保存下来用做以后使用。也可以在前面加上其它选项，使这些选项的值被包含在这个产生的配置文件里。如：pylint --persistent=n --generate-rcfile > pylint.conf，查看 pylint.conf，可以看到 persistent=no，而不再是其默认值 yes。
* --rcfile=<file>
指定一个配置文件。把使用的配置放在配置文件中，这样不仅规范了自己代码，也可以方便地和别人共享这些规范。
* -r <y_or_n>, --reports=<y_or_n>
默认是 y, 表示 Pylint 的输出中除了包含源代码分析部分，也包含报告部分。
* --files-output=<y_or_n>
将每个 module /package 的 message 输出到一个以 pylint_module/package. [txt|html] 命名的文件中，如果有 report 的话，输出到名为 pylint_global.[txt|html] 的文件中。默认是输出到屏幕上不输出到文件里。
* -f <format>, --output-format=<format>
设置输出格式。可以选择的格式有 text, parseable, colorized, msvs (visual studio) 和 html, 默认的输出格式是 text。

* --disable-msg=<msg ids>
禁止指定 id 的 message. 比如说输出中包含了 W0402 这个 warning 的 message, 如果不希望它在输出中出现，可以使用 --disable-msg= W0402
