import winreg
import ctypes

REG_PATH = "SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Fonts"


# https://stackoverflow.com/a/23624136
def set_reg(name: str, value: str, root: bool, REG_PATH: str = REG_PATH) -> bool:
    try:
        winreg.CreateKey(winreg.HKEY_CURRENT_USER, REG_PATH)
        registry_key = winreg.OpenKey(
                                      winreg.HKEY_CURRENT_USER if not root
                                      else winreg.HKEY_LOCAL_MACHINE,
                                      REG_PATH,
                                      0,
                                      winreg.KEY_WRITE
                       )
        winreg.SetValueEx(registry_key, name, 0, winreg.REG_SZ, value)
        winreg.CloseKey(registry_key)
        return True
    except WindowsError:
        return False


# https://stackoverflow.com/a/23624136
def get_reg(name: str, root: bool, REG_PATH: str = REG_PATH) -> bool:
    try:
        registry_key = winreg.OpenKey(
                                      winreg.HKEY_CURRENT_USER if not root
                                      else winreg.HKEY_LOCAL_MACHINE,
                                      REG_PATH,
                                      0,
                                      winreg.KEY_READ
                       )
        value, regtype = winreg.QueryValueEx(registry_key, name)
        winreg.CloseKey(registry_key)
        return value
    except WindowsError:
        return None


def del_reg(name: str, root: bool, REG_PATH: str = REG_PATH) -> bool:
    try:
        registry_key = winreg.OpenKey(
                                      winreg.HKEY_CURRENT_USER if not root
                                      else winreg.HKEY_LOCAL_MACHINE,
                                      REG_PATH,
                                      0,
                                      winreg.KEY_SET_VALUE
                       )
        winreg.DeleteValue(registry_key, name)
        winreg.CloseKey(registry_key)
        return True
    except WindowsError:
        return False


def is_admin() -> bool:
    return ctypes.windll.shell32.IsUserAnAdmin()
