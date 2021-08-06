import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import SKQtAuth 1.0
import SKQtRealTimeDatabase 1.0
import "../Singleton"
import "../Controls"

Page {
    id : idMenuPage
    property var myData

    Connections{

        target: SKQtFirebase.mDatabase
         ignoreUnknownSignals: true
      function onDataAvailable(){

           var obj =  SKQtFirebase.mDatabase.data();
          //retrieve values from JSON
           console.log(obj); // all JSON data
           console.log(JSON.parse(obj).data.message); // retreive a single data [message]
           myData = JSON.parse(obj).data.message;

       }


    }

    ColumnLayout{
        anchors.centerIn: parent
            RoundButton{
                radius: 6
                text: "send data"
                onClicked: {
                    var message = {
                        data: {
                            title: "New Text Message",
                            message: "Hello how are you?",
                            meta: {
                                type: "small",
                                info: "Search"
                            },
                            to:"sarakata"
                        }
                    }
                    SKQtFirebase.mDatabase.sendData("profile" ,message); // "profile" is the child name

                }


        }

            RoundButton{
                radius: 6
                text: "Read message"
                onClicked: {
                    SKQtFirebase.mDatabase.readData("profile"); // read all profile data

                }

            }

            Label{
                id : messageLabel
                text: idMenuPage.myData

                width: 100
                height: 100
            }


    }
}
