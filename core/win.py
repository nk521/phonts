import os
import shutil
import glob
from core import helpers

FONTPATH_ALLUSER = os.getenv('windir') + "\\Fonts"
FONTPATH_CURRUSER = f"{os.getenv('USERPROFILE')}\\phonts"


def initFontFolderUser() -> None:
    if not os.path.isdir(FONTPATH_CURRUSER):
        print("Initializing phonts directory!")
        os.makedirs(FONTPATH_CURRUSER)


def deleteFontFiles() -> None:
    allFonts: set[str] = set(glob.glob(FONTPATH_CURRUSER + "\\*"))
    fontsInstalled: list = [x[1] for x in helpers.win.enum_key(root=False)]
    fontsToDelete: set = allFonts - set(fontsInstalled)

    for font in fontsToDelete:
        try:
            os.remove(font)
        except Exception as x:
            print(x)


def installFontUser(fontName: str, fontPath: str) -> bool:
    if helpers.win.get_reg(name=fontName, root=False) is not None:
        print("Font is already installed!")
        return False

    oldFontPath = fontPath
    fontPath = os.path.join(FONTPATH_CURRUSER, fontPath.split("\\")[-1])
    shutil.copy2(oldFontPath, fontPath)
    r = helpers.win.set_reg(name=fontName, value=fontPath, root=False)

    if r:
        print(f"Successfully installed font {fontName}!")
        return True
    else:
        print("Failed!")
        return False


def deleteFontUser(fontName: str) -> bool:
    if (helpers.win.get_reg(name=fontName, root=False)) is None:
        print("Font doesn't exist!")
        return False

    helpers.win.del_reg(name=fontName, root=False)
    print(f"Successfully deleted font {fontName}")
    return True
