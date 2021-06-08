import platform
from core import win
import sys

currentPlatform = platform.system()

if currentPlatform == "Windows":
    win.initFontFolderUser()
    fontPath = sys.argv[1]
    fontName = sys.argv[2]
    win.installFontUser(fontName, fontPath)
    input("pause")
    win.deleteFontUser(fontName)
