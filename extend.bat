ECHO RESCAN > C:\DiskPart.txt
ECHO SELECT Volume 0 >> C:\DiskPart.txt
ECHO EXTEND >> C:\DiskPart.txt
ECHO EXIT >> C:\DiskPart.txt
DiskPart.exe /s C:\DiskPart.txt
DEL C:\DiskPart.txt /Q