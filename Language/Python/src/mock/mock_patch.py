# -*- coding:utf-8 -*-
import requests
import unittest
import testscenarios
try:
    from unittest import mock
except ImportError:
    import mock


class WhereIsPythonError(Exception):
    pass


def is_python():
    try:
        r = requests.get(r'http://python.org')
    except IOError:
        pass
    else:
        if r.status_code == 200:
            return 'Python is a programming language' in r.content
    raise WhereIsPythonError('Something bad happened')


def get_fake(status_code, content):
    """
    :param status_code:
    :param content:
    :return:
    """
    m = mock.Mock()
    m.status_code = status_code
    m.content = content
    def fake_get(url):
        return m
    return fake_get


def raise_get(url):
    raise IOError("Unable to fetch url %s" % url)


class TestPython(unittest.TestCase):
    @mock.patch('requests.get', get_fake(200, 'Python is a programming language'))
    def test_python_is(self):
        self.assertTrue(is_python())

    @mock.patch('requests.get', get_fake(200, 'Python not language'))
    def test_python_is_not(self):
        self.assertFalse(is_python())

    @mock.patch('requests.get', get_fake(404, 'Whatever'))
    def test_bad_status_code(self):
        self.assertRaises(WhereIsPythonError,is_python)

    @mock.patch('requests.get', raise_get)
    def test_ioerror(self):
        self.assertRaises(WhereIsPythonError, is_python)


"""
#场景测试
class TestDiffPython(testscenarios.TestWithScenarios):
    scenarios = [
        ('Not found', dict(status=404)),
        ('Client error', dict(status=400)),
        ('Server error', dict(status=500)),
    ]
    def test_python_status_code_handling(self):
        with mock.patch('requests.get', get_fake(self.status, 'Python is a programming language')):
            self.assertRaises(WhereIsPythonError, is_python)
"""

