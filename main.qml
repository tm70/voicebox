import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls
import QtMultimedia

Window {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Voicebox")

    MenuBar {
        height: 30
        Menu {
            title: "Options"
            MenuItem {
                text:"Mute"
                onClicked: { typingSound.muted = !typingSound.muted }
            }
            MenuItem {
                text: "-"
                onClicked: { textBox.font.pointSize -= 2 }
            }
            MenuItem {
                text: "+"
                onClicked: { textBox.font.pointSize += 2 }
            }
        }
    }

    TextEdit {
        id: textBox
        y: 30
        width: mainWindow.width
        height: mainWindow.height - 30
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
        muted: false
    }
}
