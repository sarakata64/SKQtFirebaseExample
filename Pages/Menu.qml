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

       onDataAvailable:{
           console.log("on data signal")
          //myData= SKQtFirebase.mDatabase.getData
       //   console.log( JSON.stringify( SKQtFirebase.mDatabase.getData))
         // console.log(SKQtFirebase.mDatabase.getData)

         //  var tt = {"aa":"aa","bb":"bb","cc":"cc"}

           var obj =  SKQtFirebase.mDatabase.getData;
          //retrieve values from JSON again
           var aString = obj.aa;
           //console.log(JSON.parse( obj));
           console.log(obj.food);
           console.log(JSON.stringify( obj));



          //  console.log(JSON.parse( JSON.stringify(jobj)));


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
                    SKQtFirebase.mDatabase.sendData("profile",message); // "profile" is the child name
                                                                  // it can be "profile/contact" for example
                }


        }

            RoundButton{
                radius: 6
                text: "Read message"
                onClicked: {
                    SKQtFirebase.mDatabase.readData("pets/food");

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
