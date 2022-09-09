import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/ui/general/colors.dart';
import 'package:notes/ui/widgets/button_normal_widget.dart';
import 'package:notes/ui/widgets/textfield_normal_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _registerUser() async {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: "mandarina@gmail.com",
      password: "3volution",
    );
    print(userCredential);
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
                  onPressed: () {},
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
