

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsHelper {

  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static initApp() async{
    String token = await messaging.getToken() ?? "";
    print(token);
    FirebaseMessaging.onMessage.listen(_onMessage);

  }

  static Future _onMessage(RemoteMessage message) async{
    if(message.notification != null){
      print(message.notification!.title);
      print(message.notification!.body);
    }
  }





}