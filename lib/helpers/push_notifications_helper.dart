

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsHelper {

  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static initApp() async{
    String token = await messaging.getToken() ?? "";
    print(token);
  }

}