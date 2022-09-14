# Voicebox
A simple program which plays sound as you type. QtQuick program made using Qt 6.3.2. Application settings are saved in %appdata%/roaming in windows.

# Building/Deploying
To build a portable windows deployment, first build for Release on Qt Creator. Move the resulting .exe to a new folder and using Qt mingw terminal, run
`windeployqt --qmldir <dir of this repo> Voicebox.exe`