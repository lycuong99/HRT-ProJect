import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MessageHandlerWidget extends StatefulWidget {
  @override
  _MessageHandlerWidgetState createState() => _MessageHandlerWidgetState();
}

class _MessageHandlerWidgetState extends State<MessageHandlerWidget> {
  // final Firestore _db = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();

  @override
  void initState() {
    // TODO: implement initState
    _fcm.getToken().then((token) {
      print("Device TOKEN:" + token);
    });

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text('${message['notification']['title']}'),
              subtitle: Text('${message['notification']['body']}'),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // TODO optional
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        // TODO optional
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text('Notification'),
    );
  }

// TODO...

}
