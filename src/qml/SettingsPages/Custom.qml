import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import LongUI 1.0 as LongUI
ItemPage {
    headerTitle: qsTr("Custom")
    ScrollView {
        anchors.fill: parent
        anchors.margins: LongUI.Units.largeSpacing
    ColumnLayout {
        id: _mainLayout
        anchors.fill: parent
        anchors.bottomMargin: LongUI.Units.largeSpacing
        RoundedItem {
            Label {
                text: qsTr("Terminal")
                color: LongUI.Theme.disabledTextColor
            }
            GridLayout{
                columns: 2
                columnSpacing: LongUI.Units.smallSpacing
                rowSpacing: LongUI.Units.smallSpacing
                Label {
                    text: qsTr("Word Characters")
                }

                TextField{
                    Layout.fillWidth: true
                    text: settings.wordCharacters
                    onTextChanged: {
                        settings.wordCharacters = text
                    }
                }
                }
            }

        RoundedItem {
            Label {
                text: qsTr("Search Engines")
                color: LongUI.Theme.disabledTextColor
            }
            ColumnLayout{
                spacing: LongUI.Units.smallSpacing
                Repeater {
                    model: settings.searchUrl
                    delegate: RowLayout{
                        Label {
                            text: settings.searchUrl[index][0]
                        }

                        Item{
                            Layout.fillWidth: true
                        }
                        TextField{
                            Layout.fillWidth: true
                            text: settings.searchUrl[index][1]
                            onTextChanged: {
                                settings.searchUrl[index][1] = text
                            }
                        }
                        Item{
                            Layout.fillWidth: true
                        }
                        Button{
                            flat: true
                            width: height
                            implicitWidth: height
                            icon.source: LongUI.Theme.darkMode ? "qrc:/images/light/close.svg" : "qrc:/images/dark/close.svg"
                            onClicked: {
                                var mbm = settings.searchUrl;
                                mbm.splice(index, 1)
                                settings.searchUrl = mbm
                            }
                        }
                    }
                }
                RowLayout{
                    TextField{
                        id:_urlname
                        Layout.fillWidth: true
                        placeholderText: qsTr("Search engine name")
                    }
                    Item{
                        Layout.fillWidth: true
                    }
                    TextField{
                        id:_url
                        Layout.fillWidth: true
                        placeholderText: qsTr("Search engine url,Replace the keyword with {keyword}")
                    }
                    Item{
                        Layout.fillWidth: true
                    }
                    Button{
                        flat: true
                        width: height
                        implicitWidth: height
                        icon.source: LongUI.Theme.darkMode ? "qrc:/images/light/add.svg" : "qrc:/images/dark/add.svg"
                        onClicked: {
                            var mbm = settings.searchUrl;
                            mbm.push([_urlname.text,_url.text])
                            settings.searchUrl = mbm
                        }
                    }

                }
            }
        }


        }

    }
}

