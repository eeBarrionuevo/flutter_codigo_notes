import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notes/pages/home_page.dart';
import 'package:notes/ui/general/colors.dart';
import 'package:notes/ui/widgets/button_normal_widget.dart';
import 'package:notes/ui/widgets/textfield_normal_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _registerUser() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );
    if (userCredential.user != null) {
      Map<String, dynamic> userMap = {
        "name": "Luis Montes",
        "email": _emailController.text,
        "status": true,
        "role": "user",
      };
      _userReference.add(userMap).then((value) {
        print(value);
      });
    }
  }

  _login() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (userCredential.user != null) {
      // print(userCredential.user!.email);
      Map<String, dynamic> userData =
          await getUser(userCredential.user!.email!);
      if (userData["role"] == "admin") {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false);
        //Navigator.pushNamed(context, '/home');
        //Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);

      } else if (userData["role"] == "user") {
      } else {}
    }
  }

  Future<Map<String, dynamic>> getUser(String email) async {
    QuerySnapshot collection =
        await _userReference.where("email", isEqualTo: email).get();
    QueryDocumentSnapshot doc = collection.docs.first;
    Map<String, dynamic> userMap = doc.data() as Map<String, dynamic>;
    return userMap;
  }

  showNotification() async {

    AndroidInitializationSettings androidInitializationSettings = const AndroidInitializationSettings("@mipmap/ic_launcher");


    IOSInitializationSettings iosInitializationSettings = const IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      defaultPresentSound: true,
      defaultPresentBadge: true,
      defaultPresentAlert: true
    );

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);

    _flutterLocalNotificationsPlugin.show(
      0,
      "Hola desde Flutter",
      "Esta es una notificaci??n",
      NotificationDetails(
        android: AndroidNotificationDetails(
          "Canal Note App ID",
          "Canal Note App",
          enableVibration: true,
          priority: Priority.max,
          importance: Importance.max,
        ),
        iOS: IOSNotificationDetails(
          threadIdentifier: "Canal Note App ID"
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundPrimaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Iniciar Sesi??n",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kFontPrimaryColor,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFieldNormalWidget(
                  hintText: "Correo electr??nico",
                  controller: _emailController,
                ),
                TextFieldNormalWidget(
                  hintText: "Contrase??a",
                  controller: _passwordController,
                ),
                const SizedBox(
                  height: 12.0,
                ),
                ButtonNormalWidget(
                  text: "Iniciar Sesi??n",
                  onPressed: () {
                    _login();
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ButtonNormalWidget(
                  text: "Registrar",
                  onPressed: () {
                    // _registerUser();
                    //Navigator.pop(context);
                    Navigator.maybePop(context);
                    print(Navigator.canPop(context));
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ButtonNormalWidget(
                  text: "Show Notification",
                  onPressed: () {
                    showNotification();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
