import os
import sys
import logging
from datetime import datetime

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
os.chdir("..")

logging.basicConfig(
    level=logging.INFO,
    datefmt="%d-%b-%y %H:%M:%S",
    filename=f"./logs/{datetime.now().strftime('%d-%m-%Y_%H-%M-%S')}.log",
    filemode="w",
    format="%(asctime)s [%(levelname)s] %(message)s",
)
