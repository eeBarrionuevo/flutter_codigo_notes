import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/ui/general/colors.dart';
import 'package:notes/ui/widgets/button_normal_widget.dart';
import 'package:notes/ui/widgets/textfield_normal_widget.dart';

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
              TextFieldNormalWidget(
                hintText: "Título",
              ),
              TextFieldNormalWidget(
                hintText: "Descripción",
              ),
              const Divider(
                indent: 12.0,
                endIndent: 12.0,
              ),
              const Text(
                "Selecciona una imagen",
              ),
              const SizedBox(
                height: 12.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: Image(
                  image: AssetImage("assets/images/placeholder.jpg"),
                  width: double.infinity,
                  height: 200,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ButtonNormalWidget(
                text: "Guardar",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
