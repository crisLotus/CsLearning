import unittest
import src.app


class TestStringMethods(unittest.TestCase):
	def test_return_str(self):
		self.assertEqual('App test passed', src.app.func())

def suite():
    s = unittest.TestSuite()
    load_from = unittest.defaultTestLoader.loadTestsFromTestCase
    s.addTests(load_from(TestStringMethods))
    return s
