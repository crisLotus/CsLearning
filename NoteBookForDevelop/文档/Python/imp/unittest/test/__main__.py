import unittest
from .test import suite

t = unittest.TextTestRunner()
t.run(suite())
