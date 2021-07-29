import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "../Controls"
import "../Singleton"

Page{

    id: mPassordPage
    signal mpSignal

    background: Rectangle{
        color: "transparent"
    }

    ColumnLayout{
        id : idCL
        anchors.centerIn: parent
        spacing: 30

        Label{
            id: mLabel
            text: ""
            color: "red"
        }
        MyTextTitle{
            text: "Enter your Email Address"
            Layout.alignment: Qt.AlignCenter
        }

        MyTextField{
            id: mTextEmail
            placeholderText: "Enter your Email"
            Layout.alignment: Qt.AlignCenter
        }
        RowLayout{
            id : idRL
            spacing: 20
            Rectangle{
                width: 50
            }

            RoundButton{
                Layout.alignment: Qt.AlignCenter
                text: "Submit"
                radius: 6
                onClicked: {
                    SKQtFirebase.mAuth.resetPassword(mTextEmail.text)
                }
            }


            RoundButton{
                Layout.alignment: Qt.AlignCenter
                text: "Back"
                radius: 6
                onClicked: {
                    mpSignal()
                }
            }

        }
    }
}
