import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import SKQtAuth 1.0
import SKQtRealTimeDatabase 1.0
import "../Singleton"
import "../Controls"

Page {
    id : idLogiPage
    signal menuSignal
    signal mpasswordPageSignal
    property alias mLabelMsg : mLabel.text
    background: Rectangle{
        color: "transparent"
    }

    ColumnLayout{
        anchors.centerIn: parent
        spacing: 20
        Label{
            id: mLabel
            height: 30
            width: 300
            Layout.alignment: Qt.AlignCenter
            text:""
            color: "red"
        }

        MyTextTitle{
            text: "LOGIN"
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignCenter
        }

        MyTextField {
            id: _EmailTxt
            placeholderText:"Email"
            Layout.alignment: Qt.AlignCenter

        }
        MyTextField {
            id: _PaswordTxt
            placeholderText:"Password"
            echoMode: TextInput.Password
            Layout.alignment: Qt.AlignCenter

        }

        RoundButton{

            text: "       Sign        "
            Layout.alignment: Qt.AlignCenter

            onClicked: {
                if(_EmailTxt.text=="" || _PaswordTxt.text=="" ){
                    mLabelMsg= "fill all field"
                }else{
                    // Login here with your email address and password
                    SKQtFirebase.mAuth.setSignInUser(_EmailTxt.text,_PaswordTxt.text)

                }

            }

            radius: 6
        }


        Button{


            text: "Forgot password?"
            Layout.alignment: Qt.AlignCenter
            font.italic: true
            font.underline: true
            background: Rectangle{
                color: "transparent"
            }

            onClicked: mpasswordPageSignal()

        }

        Rectangle{
            height: 20
        }

        RoundButton{
            text: "Suscription"
            radius: 6
            Layout.alignment: Qt.AlignCenter

            onClicked: {

                menuSignal()

            }
        }

    }

}

