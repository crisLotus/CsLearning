#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import unittest
import src


class TestStringMethods(unittest.TestCase):
    def test_return_str(self):
        self.assertEqual('App test passed', src.func())


if __name__ == '__main__':
    unittest.main()
