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

        // test
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
            //    visible: status== Loader.Ready
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
    Inscription{
           id: mInscription
           visible: false
       }
       Password{
           id : mPasswordPage
           visible: false
       }


  /*
    Messenging{
        id:mMesseger
        visible: false
    }


    Store{
        id : mStore
        visible:  false
    }
*/
    // the connections
    Connections{
        target: mMenu
    }
    Connections{
        target: mStore
    }
    Connections {
        target: mLoginPage
        onMpasswordPageSignal:
        {   mLoginPage.visible=false
            vuePile.replace(mPasswordPage)
        }

        onMenuSignal: {
            mLoginPage.visible=false
            vuePile.replace(mInscription)
        }
    }
   Connections{
        target: mInscription
        onRetMainSignal:{
            mInscription.visible= false
            vuePile.replace(mLoginPage)
        }
    }
    Connections{
        target: mPasswordPage
        onMpSignal:{
            mPasswordPage.visible= false
            vuePile.replace(mLoginPage)
        }
    }


    Connections{
        target: SKQtFirebase.mAuth

          onErrorAuth :
          {
              console.log("error auth..."+ SKQtAuth.getResponseValue)
          }
          onSuccessAuth :{
              console.log("successful Auth...."+SKQtAuth.getResponseValue)
              vuePile.replace(mMenu)
          }


    }


}

