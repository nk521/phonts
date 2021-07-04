import platform
from core import win
import sys
import asyncio

currentPlatform = platform.system()

async def main():
    if currentPlatform == "Windows":
        await win.initFontFolderUser()
        fontPath = sys.argv[1]
        fontName = sys.argv[2]
        await win.installFontUser(fontName, fontPath)
        input("pause")
        await win.deleteFontUser(fontName)
        input("pause")
        await win.deleteFontFiles()

if __name__ == "__main__":
    loop = asyncio.get_event_loop()
    loop.run_until_complete(main())
