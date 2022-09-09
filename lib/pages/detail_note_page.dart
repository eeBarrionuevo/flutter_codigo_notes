import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/ui/general/colors.dart';

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
      backgroundColor: kBackgroundPrimaryColor,
      appBar: AppBar(
        backgroundColor: kFontPrimaryColor,
        title: Text("Registrar nota"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text("Título",),
              const SizedBox(
                height: 6.0,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87.withOpacity(0.05),
                      blurRadius: 12,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Título",
                    hintStyle: TextStyle(
                        fontSize: 14.0,
                        color: kFontPrimaryColor.withOpacity(0.5)
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
