import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/helpers/push_notifications_helper.dart';
import 'package:notes/pages/detail_note_page.dart';
import 'package:notes/pages/home_page.dart';
import 'package:notes/pages/login_page.dart';
import 'package:notes/providers/note_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationsHelper.initApp();
  await Firebase.initializeApp();
  // SystemChrome.setPreferredOrientations(
  //   [
  //     DeviceOrientation.portraitUp
  //   ],
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> NoteProvider()),
      ],
      child: MaterialApp(
        title: "Notes",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.manropeTextTheme(),
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
         //Locale('en', ''), // English, no country code
          Locale('es', ''), // Spanish, no country code
        ],

        routes: {
          "/home": (BuildContext context)=> HomePage(),
          "/detail": (BuildContext context)=> DetailNotePage(),
          "/login": (BuildContext context)=> LoginPage(),
        },

        home: LoginPage(),
      ),
    );
  }
}
