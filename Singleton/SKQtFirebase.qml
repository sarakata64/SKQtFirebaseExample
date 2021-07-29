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
        // set your Firebase project API KEY
        idAuth.setApiKey("AIzaSyBfIiKhSNiJ4XSvD05VhCNxT-xhN2_Tnyw")
    }
}
