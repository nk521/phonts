import os
from core import helpers

FONTPATH_ALLUSER = os.getenv('windir') + "\\Fonts"
FONTPATH_CURRUSER = f"{os.getenv('USERPROFILE')}\\phonts"


def initFontFolderUser() -> None:
    if not os.path.isdir(FONTPATH_CURRUSER):
        print("Initializing phonts directory!")
        # for some reasons I cannot delete or edit files (placed in this dir) afterwards
        os.makedirs(FONTPATH_CURRUSER)


def installFontUser(fontName: str, fontPath: str) -> bool:
    if helpers.win.get_reg(name=fontName, root=False) is not None:
        print("Font is already installed!")
        return False

    oldFontPath = fontPath
    fontPath = os.path.join(FONTPATH_CURRUSER, fontPath.split("\\")[-1])
    # print(f"helpers.cross.xcopy(\"{oldFontPath}\", \"{fontPath}\")")
    helpers.cross.xcopy(oldFontPath, fontPath)
    # print(fontPath)
    r = helpers.win.set_reg(name=fontName, value=fontPath, root=False)

    if r:
        print(f"Successfully installed font {fontName}!")
        return True
    else:
        print("Failed!")
        return False


def deleteFontUser(fontName: str) -> bool:
    if (fontPath := helpers.win.get_reg(name=fontName, root=False)) is None:
        print("Font doesn't exist!")
        return False

    helpers.win.del_reg(name=fontName, root=False)
    os.remove(fontPath)
    print(f"Successfully deleted font {fontName}")
    return True
