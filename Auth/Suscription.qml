import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import SKQtAuth 1.0
import SKQtRealTimeDatabase 1.0
import "../Controls"
import "../Singleton"

Page {
    id: mMenuPage
    // anchors.centerIn: parent
    background: Rectangle{
        color: "transparent"
    }



    ColumnLayout{
        anchors.centerIn: parent

        spacing: 30

        MyTextTitle{
            text: "Suscription"
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignCenter

        }

        TextField{
            id: sEmailText
            placeholderText: "Email"

        }

        TextField{
            id : sPassword
            placeholderText: "Password"
            echoMode: TextInput.Password

        }

        TextField{
            id: sPasswordConfirm
            placeholderText: "confirm password"
            echoMode: TextInput.Password

        }
        Row{
            spacing: 20
           RoundButton{
                text: "Suscribe"
                Layout.alignment: Qt.AlignCenter
                radius: 20

                onClicked: {
                    //idAuth.signUpUser(sEmailText.text, sPassword.text)
                   SKQtFirebase.mAuth.signUpUser(sEmailText.text, sPassword.text)

                }

            }

           RoundButton{
                text: "Back"
                Layout.alignment: Qt.AlignCenter
                radius: 20

                onClicked: {
                    retMainSignal()

                }

            }
        }
    }

}
