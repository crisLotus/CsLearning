# 流程
* 信息搜集
	- google Hack site intext intitle info inurl filetype
		* 搜集子域名
		* 管理后台 intitle:管理登陆
	- 指纹识别 系统 容器 应用
	- 漏洞扫描 sqlinjection xss bufferoverflow 
* 漏洞原理
	* sql注入 sqlmap
	* 上传漏洞
	* xss xsser.me
	* 命令执行漏洞
	* 文件包含漏洞 url 包含日志 包含文件
	* CSRF

* 综合
	* 暴力破解  Nmap medusa Hydra burpsuite X-scan CrackDB 
	* 旁注攻击（+提权）
		* ip逆向查询 
			* www.yougetsignal.com/tools/web-sites-on-web-server/
			* tool.chinaz.com/same
		* sql跨库查询
		* 目录越权
		* 构造注入点
		* CDN toolbar.netcraft.com/site_report ip变化获得真实ip地址
	* 提权
		* 溢出提权 nc
		* 第三方组件提权
			* 信息搜集 脚本语言 端口 搜索路径信息(快捷方式 注册表HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\services\)
			* 数据库提权
# 工具
* burpsuite
* fiddler
* WinSock Expert
* Nmap
* [ZAP](https://github.com/zaproxy/zaproxy) 隐私目录扫描
* AWVS
* Appscan

# 工具下载
http://www.uedbox.com/penetration_testing/