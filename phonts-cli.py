import platform
import os

currentPlatform = platform.system()

if currentPlatform == "Windows":
    import winreg
    import helper_win

    FONTPATH_ALLUSER = os.getenv('windir') + "\\Fonts"
    FONTPATH_CURRUSER = f"{os.getenv('USERPROFILE')}\\phonts"

    # in HKEY_CURRENT_USER & HKEY_LOCAL_MACHINE
    REGPATH_CURRUSER = "SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Fonts"

    print(f"{FONTPATH_ALLUSER} === {FONTPATH_CURRUSER} === {helper_win.is_admin()}")
    
