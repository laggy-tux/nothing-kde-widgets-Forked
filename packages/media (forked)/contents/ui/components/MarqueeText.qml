import QtQuick
Item {
    id: marqueeRoot
    // Public properties
    property string text: ""
    property int fontSize: 18
    property bool bold: true
    property string textColor: "white"
    clip: true
    // Crucial: Gives ColumnLayout a hint of how wide we want to be,
    // but allows us to safely look at our actual width.
    implicitWidth: 200
    implicitHeight: scrollingText.implicitHeight

    // Truncate to the first two words, appending "..." if there were
    // more words to begin with. Anything two words or shorter is left as-is.
    function truncatedText(input) {
        if (!input)
            return ""
        var words = input.trim().split(/\s+/)
        if (words.length > 2)
            return words.slice(0, 2).join(" ") + "..."
        return input
    }

    Text {
        id: scrollingText
        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        text: marqueeRoot.truncatedText(marqueeRoot.text)
        font.pixelSize: marqueeRoot.fontSize
        font.bold: marqueeRoot.bold
        color: marqueeRoot.textColor
        elide: Text.ElideRight
        maximumLineCount: 1
    }
}
