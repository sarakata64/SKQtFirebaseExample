pragma Singleton
import QtQuick 2.0
import SKQtAuth 1.0
import SKQtRealTimeDatabase 1.0

Item {

    property  alias mAuth: idAuth
    property alias mDatabase: idDatabase

    SKQtAuth{
        id : idAuth

    }


    SKQtRealTimeDatabase{
        id : idDatabase
    }

    Component.onCompleted: {
        /******YOU MUST CHANGE THE BELOW SETTINGS ******/

        // set your Firebase project API KEY
        idAuth.setApiKey("AIzaSyBfIiKhSNiJ4XSvD05VhCNxT-xhN2_Tnyw")

        // Set Data root url for your project [RealTime Database]
        idDatabase.setDataRootUrl("https://fir-demo-d3d5f-default-rtdb.europe-west1.firebasedatabase.app");
    }
}
