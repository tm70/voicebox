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
        onTextEdited: {
            if (!typingSound1.playing) typingSound1.play()
            else if (!typingSound2.playing) typingSound2.play()
            else if (!typingSound3.playing) typingSound3.play()
            else if (!typingSound4.playing) typingSound4.play()
            else if (!typingSound5.playing) typingSound5.play()
        }
    }

    // multiple sound effects to avoid cutting out while still allowing sound on faster typing
    property real sfxVolume: 0.5
    SoundEffect {
        id: typingSound1
        source: "sfx.wav"
        muted: muteButton.checked
        volume: sfxVolume
    }
    SoundEffect {
        id: typingSound2
        source: "sfx.wav"
        muted: muteButton.checked
        volume: sfxVolume
    }
    SoundEffect {
        id: typingSound3
        source: "sfx.wav"
        muted: muteButton.checked
        volume: sfxVolume
    }
    SoundEffect {
        id: typingSound4
        source: "sfx.wav"
        muted: muteButton.checked
        volume: sfxVolume
    }
    SoundEffect {
        id: typingSound5
        source: "sfx.wav"
        muted: muteButton.checked
        volume: sfxVolume
    }

    // menus and buttons
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
        onClicked: textBox.text = ""
    }

    // keyboard shortcuts
    Shortcut {
        autoRepeat: false
        sequence: "Ctrl+Q"
        onActivated: clearButton.clicked()
    }
    Shortcut {
        sequence: StandardKey.ZoomIn
        onActivated: incFontButton.clicked()
    }
    Shortcut {
        sequence: StandardKey.ZoomOut
        onActivated: decFontButton.clicked()
    }
}
