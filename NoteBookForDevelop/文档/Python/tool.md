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
