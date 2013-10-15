import QtQuick 1.1


//FocusScope {
Rectangle {
    //width: 1600   //these are the only explicit sizes set
    //height: 1200   //all others are relative

    id: keydetails

    signal clicked

    signal exportPrivateKeyClicked
    signal exportPublicKeyClicked

    anchors.fill: parent

    property alias tf1Text: tf1.text
    property alias tf2Text: tf2.text
    property string keyid: keymap.id

//    property keyid : ""
//    property email : ""
//    property name : ""

    //color: "red"
    Rectangle {
        id: rectangle2
        x: 0
        y: 0
        width: 1600
        height: 47
        color: "#99bff1"
    }

    Rectangle {
        id: rectangle1
        x: 0
        y: 0
        width: 107
        height: 1200
        color: "#978c79"
    }

     KeyInfoRow {
         x: 144
         y: 281
         // qsTr() for internationalisation, like tr()
         key: qsTr("keyid:")
         value: keymap.id
     }

     KeyInfoRow {
         x: 144
         y: 103
         key: qsTr("email:")
         value: keymap.email
     }

     KeyInfoRow {
         x: 144
         y: 79
         key: qsTr("name:")
         value: keymap.name
     }

     KeyInfoRow {
         x: 144
         y: 189
         key: qsTr("keysize")
         value: keymap.size + "/" + keymap.encryptionSize
    }



     Image {
         id: image1
         x: 0
         y: 0
         width: 107
         height: 229
         source: "qrc:/wizard_keys.png"
     }

     Text {
         id: text5
         x: 118
         y: 7
         width: 20
         height: 15
         text: qsTr("Keydetails")
         font.pixelSize:22
     }

     TextField {
         x: 237
         y: 651
         id: tf1
         text: "some text"
     }

     TextField {
         x: 237
         y: 684
         id: tf2
         text: "some other text"
     }

     Button {
         x: 364
         y: 684
         text: "ok"
         onClicked: {
            console.log("ok clicked, text: " +  tf1.text)
            console.log("tf2: " + tf2.text)
            keydetails.clicked();
         }
     }

     Text {
         id: text1
         x: 137
         y: 54
         text: qsTr("Owner")
         font.bold: true
         font.pixelSize: 12
     }

     KeyInfoRow {
         id: comment
         x: 144
         y: 126
         key: qsTr("Comment")
         value: keymap.comment
     }

     Text {
         id: text2
         x: 137
         y: 163
         text: qsTr("Keydetails")
         font.pixelSize: 12
         font.bold: true
     }

     KeyInfoRow {
         id: creation
         x: 144
         y: 258
         key: qsTr("Created on")
         value: keymap.creationDate
     }

     Text {
         id: fingerprintLabel
         x: 137
         y: 326
         text: qsTr("Fingerprint")
         font.pixelSize: 12
         font.bold: true
     }

     TextEdit {
         id: fingerprint
         x: 145
         y: 346
         text: keymap.fingerprint
         font.pixelSize: 12
         readOnly: true

     }

     KeyInfoRow {
         id: expiration
         x: 144
         y: 212
         key: qsTr("Expires on")
         value: keymap.expirationDate
     }

     KeyInfoRow {
         id: type
         x: 144
         y: 235
         key: qsTr("Algorithm")
         value: keymap.algorithm + "/" + keymap.encryptionAlgorithm
     }

     Button {
         id: exportPublicKeyButton
         x: 144
         y: 392
         text: qsTr("Export public key")
         onClicked: {
            keydetails.exportPublicKeyClicked();
         }

     }

     Button {
         id: exportPrivateKeyButton
         x: 316
         y: 392
         text: qsTr("Export private key")
         onClicked: {
            keydetails.exportPrivateKeyClicked();
         }
         visible: keymap.isSecret
     }

     Button {
         id: copyFingerprintButton
         x: 401
         y: 341
         text: qsTr("copy")
         onClicked: {
             fingerprint.selectAll();
             fingerprint.copy();
             fingerprint.deselect();
         }
     }




}
