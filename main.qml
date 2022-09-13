import QtQuick 2.15
import QtQuick.Window 2.15
import QtMultimedia

Window {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Voicebox")

    TextEdit {
        width: mainWindow.width
        font.family: "Helvetica"
        font.pointSize: 20
        color: "black"
        focus: true
        wrapMode: TextEdit.Wrap
        onTextChanged: typingSound.play()
    }

    SoundEffect {
        id: typingSound
        source: "sfx.wav"
    }
}
