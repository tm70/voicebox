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
        id: menuBar
        width: mainWindow.width
        height: 30
        Menu {
            title: "Options"
            Action {
                text: "Play sound"
                checkable: true
                checked: true
                onToggled: { typingSound.muted = !typingSound.muted } // maybe check here in case it breaks
            }
        }
    }
    ToolButton {
        id: incFontButton
        parent: menuBar
        width: 30
        anchors.right: parent.right
        text: "+"
        onClicked: textBox.font.pointSize += 2
    }
    ToolButton {
        id: decFontButton
        parent: menuBar
        anchors.right: incFontButton.left
        width: 30

        text: "-"
        onClicked: textBox.font.pointSize -= 2
    }
    ToolButton {
        parent: menuBar
        anchors.right: decFontButton.left
        text: "Clear"
        onClicked: textBox.text = ""
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
