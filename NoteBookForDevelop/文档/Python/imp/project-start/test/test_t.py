try:
    # cli
    import _context_test
except ImportError:
    # pycharm
    import test._context_test
import unittest
import src.tmp


class TestStringMethods(unittest.TestCase):
    def test_return_str(self):
        self.assertEqual('App test passed', src.tmp.func())


if __name__ == '__main__':
    unittest.main()
