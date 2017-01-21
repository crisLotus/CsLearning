# 多行文档字符串应该包括：

* 概括的说明
* 用例
* 参数 返回值 抛出异常

"""Train a model to classify Foos and Bars.

description:

Usage::

    >>> import klassify
    >>> data = [("green", "foo"), ("orange", "bar")]
    >>> classifier = klassify.train(data)

:param train_data: A list of tuples of the form ``(color, label)``.
:param param1: an instance of :class:"ClassA"
:rtype: A :class:`Classifier <Classifier>`
"""

# 工具

## rst

* [reStructuredText入门](http://htblog.readthedocs.io/zh/latest/rest.html)

## sphinx

```
"""
requests.models
~~~~~~~~~~~~~~~
This module contains the primary objects that power Requests.
"""

def proxy_manager_for(self, proxy, **proxy_kwargs):
    """Return urllib3 ProxyManager for the given proxy.

    This method should not be called from user code, and is only
    exposed for use when subclassing the
    :class:`HTTPAdapter <requests.adapters.HTTPAdapter>`.

	::
		>>> proxy_manager_for(*argv, **kws)

    :param proxy: The proxy to return a urllib3 ProxyManager for.
    :param proxy_kwargs: Extra keyword arguments used to configure the Proxy Manager.
    :returns: ProxyManager
    :rtype: requests.packages.urllib3.ProxyManager
    """
    ...
    return manager
```
