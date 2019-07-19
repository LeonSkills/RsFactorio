import os
import sys

sys.path.append(os.path.join(os.path.dirname(__file__), '..'))
from build_scripts.build_items import main as items
from build_scripts.build_mods import main as mods

items()
mods()
