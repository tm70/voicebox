# Voicebox
A simple program which plays sound as you type

# Building/Deploying
For "portable" windows deployment, first build for Release on Qt Creator. Move the resulting .exe to a new folder and using Qt mingw terminal, run
`windeployqt --qmldir <dir of this repo> Voicebox.exe`