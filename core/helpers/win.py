import winreg
import ctypes
from typing import Union

REG_PATH = "SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Fonts"


# https://stackoverflow.com/a/23624136
async def setReg(name: str, value: str, root: bool, REG_PATH: str = REG_PATH) -> bool:
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
async def getReg(name: str, root: bool, REG_PATH: str = REG_PATH) -> bool:
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


async def delReg(name: str, root: bool, REG_PATH: str = REG_PATH) -> bool:
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


async def isAdmin() -> bool:
    return ctypes.windll.shell32.IsUserAnAdmin()


async def enumKeyReg(root: bool, REG_PATH: str = REG_PATH) -> Union[list[list[str]], bool]:
    values_list = []
    try:
        registry_key = winreg.OpenKey(
                                      winreg.HKEY_CURRENT_USER if not root
                                      else winreg.HKEY_LOCAL_MACHINE,
                                      REG_PATH,
                                      0,
                                      winreg.KEY_READ
                       )
        values = winreg.QueryInfoKey(registry_key)[1]

        for value in range(values):
            temp = winreg.EnumValue(registry_key, value)
            values_list.append([temp[0], temp[1]])

        winreg.CloseKey(registry_key)
        return values_list

    except WindowsError:
        return False
