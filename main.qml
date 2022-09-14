import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls
import QtMultimedia

Window {
    id: mainWindow
    width: 800
    height: 230
    visible: true
    title: qsTr("Voicebox")

    MenuBar {
        id: menuBar
        width: mainWindow.width
        height: 30
        Menu {
            title: "Options"
            Action {
                id: muteButton
                text: "Mute"
                checkable: true
                checked: false
                onToggled: { typingSound.muted = checked;  }
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
        id: clearButton
        parent: menuBar
        anchors.right: decFontButton.left
        text: "Clear"
        onClicked: {
            typingSound.muted = true;
            textBox.text = "";
            typingSound.muted = muteButton.checked
        }
    }

    TextInput {
        id: textBox
        y: 30
        width: mainWindow.width
        height: mainWindow.height - 30
        font.family: "Helvetica"
        font.pointSize: 20
        color: "black"
        focus: true
        wrapMode: TextEdit.Wrap
        onTextEdited: typingSound.play()
    }

    SoundEffect {
        id: typingSound
        source: "sfx.wav"
        muted: false
    }

    // keyboard shortcuts
    Shortcut {
        sequence: StandardKey.ZoomIn
        onActivated: incFontButton.clicked()
    }
    Shortcut {
        sequence: StandardKey.ZoomOut
        onActivated: decFontButton.clicked()
    }
}
