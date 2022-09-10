import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if(userCredential.user != null){
      // print(userCredential.user!.email);
      Map<String, dynamic> userData =  await getUser(userCredential.user!.email!);
      if(userData["role"] == "admin"){
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        // Navigator.pushNamed(context, routeName);
      }else if(userData["role"] == "user"){

      }else{

      }
    }

  }

  Future<Map<String, dynamic>> getUser(String email) async{
    QuerySnapshot collection = await _userReference.where("email", isEqualTo: email).get();
    QueryDocumentSnapshot doc = collection.docs.first;
    Map<String, dynamic> userMap = doc.data() as Map<String, dynamic>;
    return userMap;
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
                  "Iniciar Sesión",
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
                  hintText: "Correo electrónico",
                  controller: _emailController,
                ),
                TextFieldNormalWidget(
                  hintText: "Contraseña",
                  controller: _passwordController,
                ),
                const SizedBox(
                  height: 12.0,
                ),
                ButtonNormalWidget(
                  text: "Iniciar Sesión",
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
                    _registerUser();
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
