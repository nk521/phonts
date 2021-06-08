import os
import shutil
from core.helpers import helper_win

FONTPATH_ALLUSER = os.getenv('windir') + "\\Fonts"
FONTPATH_CURRUSER = f"{os.getenv('USERPROFILE')}\\phonts"


def initFontFolderUser() -> None:
    if not os.path.isdir(FONTPATH_CURRUSER):
        print("Initializing phonts directory!")
        # for some reasons I cannot delete or edit files (placed in this dir) afterwards
        os.makedirs(FONTPATH_CURRUSER)


def installFontUser(fontName: str, fontPath: str) -> bool:
    if helper_win.get_reg(name=fontName, root=False) is not None:
        print("Font is already installed!")
        return False

    oldFontPath = fontPath
    fontPath = os.path.join(FONTPATH_CURRUSER, fontPath.split("\\")[-1])
    shutil.copyfile(oldFontPath, fontPath)
    print(fontPath)
    r = helper_win.set_reg(name=fontName, value=fontPath, root=False)

    if r:
        print(f"Successfully installed font {fontName}!")
        return True
    else:
        print("Failed!")
        return False


def deleteFontUser(fontName: str) -> bool:
    if (fontPath := helper_win.get_reg(name=fontName, root=False)) is None:
        print("Font doesn't exist!")
        return False

    os.remove(fontPath)
    helper_win.del_reg(name=fontName, root=False)
    print(f"Successfully deleted font {fontName}")
    return True
