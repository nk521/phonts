import os


# I'm doing it like this bc copyfile, copy, copy2 form shutil somehow mess
# up permissions on my windows machine. After hours of searching online I
# wasn't able to find anything. So this is a jugaad here.
def xcopy(src: str, dst: str, unix: bool = False) -> bool:
    xcopyCmd = ["cp" if unix else "copy", src, dst]

    if os.system(' '.join(xcopyCmd)) == 0:
        return True

    else:
        return False
