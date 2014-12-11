
import sys
import os
import atexit

sys.path.append("/home/eric/bin")
from color import red, green, blue
print(red('Importing custom python profile'))

historyPath = os.path.expanduser("~/.pyhistory")

try:
	import readline
except ImportError:
	print("Module readline not available.")
else:
	import rlcompleter
	readline.parse_and_bind("tab: complete")

def dumphist():
	readline.write_history_file(historyPath)

if os.path.exists(historyPath):
	readline.read_history_file(historyPath)

atexit.register(dumphist)
del os, atexit, rlcompleter, dumphist

