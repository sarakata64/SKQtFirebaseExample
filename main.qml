import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Universal 2.12
import QtQuick.Window 2.15
import SKQtAuth 1.0
import SKQtRealTimeDatabase 1.0
import "Controls"
import "Singleton"
import "Auth"
import "Pages"


ApplicationWindow{
    id : root
    width: 400
    height: 500
    visible: true

    StackView {
        id: vuePile
        anchors.fill: parent
        anchors.centerIn: parent
        initialItem: mLoginPage


        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 2000
            }
        }


        Loader{
            asynchronous: true
        }
    }

    Login{
        id : mLoginPage
        visible: false
    }
    Menu{
        id: mMenu
        visible: false
    }
    Suscription{
        id: mInscription
        visible: false
    }
    Password{
        id : mPasswordPage
        visible: false
    }


    // the connections
    Connections{
        target: mMenu
         ignoreUnknownSignals: true
    }

    Connections {
        target: mLoginPage
        ignoreUnknownSignals: true
     function   onMpasswordPageSignal()
        {   mLoginPage.visible=false
            vuePile.replace(mPasswordPage)
        }

      function  onMenuSignal(){
            mLoginPage.visible=false
            vuePile.replace(mInscription)
        }
    }
    Connections{
        target: mInscription
        ignoreUnknownSignals: true
      function onRetMainSignal(){
            mInscription.visible= false
            vuePile.replace(mLoginPage)
        }
    }
    Connections{
        target: mPasswordPage
        ignoreUnknownSignals: true
      function  onMpSignal(){
            mPasswordPage.visible= false
            vuePile.replace(mLoginPage)
        }
    }


    Connections{
        target: SKQtFirebase.mAuth
        ignoreUnknownSignals: true

       function onErrorAuth()
        {
            console.log("error auth...")

        }
     function   onSuccessAuth(){

            vuePile.replace(mMenu)
        }

    }


    Component.onCompleted: {
      console.log("Main Page Loaded")
    }



}
