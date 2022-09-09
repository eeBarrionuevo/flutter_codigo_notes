import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes/ui/general/colors.dart';
import 'package:notes/ui/widgets/button_normal_widget.dart';
import 'package:notes/ui/widgets/textfield_normal_widget.dart';

class DetailNotePage extends StatefulWidget {
  @override
  State<DetailNotePage> createState() => _DetailNotePageState();
}

class _DetailNotePageState extends State<DetailNotePage> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("INIT");
    // SystemChrome.setPreferredOrientations(
    //   [DeviceOrientation.landscapeLeft],
    // );
  }

  getImageGallery() async {
    _image = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  getImageCamera() async {
    _image = await _imagePicker.pickImage(source: ImageSource.camera);
    setState(() {});
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
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        getImageGallery();
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.pinkAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          )),
                      child: const Text("Galería"),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        getImageCamera();
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          )),
                      child: const Text("Cámara"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: Image(
                  image: _image != null
                      ? FileImage(
                          File(
                            _image!.path,
                          ),
                        )
                      : AssetImage(
                          "assets/images/placeholder.jpg",
                        ) as ImageProvider,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
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
