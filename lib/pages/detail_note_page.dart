import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailNotePage extends StatefulWidget {
  @override
  State<DetailNotePage> createState() => _DetailNotePageState();
}

class _DetailNotePageState extends State<DetailNotePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("INIT");
    // SystemChrome.setPreferredOrientations(
    //   [DeviceOrientation.landscapeLeft],
    // );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("DISPOSE");
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
  }

  @override
  Widget build(BuildContext context) {
    print("BUILD");
    return Scaffold(
      body: Center(
        child: Text("Detail"),
      ),
    );
  }
}
