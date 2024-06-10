import sys
from cx_Freeze import setup, Executable

setup(
    name="Response AI",
    version="0.1",
    description="A demo of using cx_Freeze",
    executables=[Executable("response.py", base=None)])
