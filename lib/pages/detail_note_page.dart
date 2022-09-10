import 'dart:io';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/providers/note_provider.dart';
import 'package:notes/ui/general/colors.dart';
import 'package:notes/ui/widgets/button_normal_widget.dart';
import 'package:notes/ui/widgets/textfield_normal_widget.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:provider/provider.dart';

class DetailNotePage extends StatefulWidget {
  @override
  State<DetailNotePage> createState() => _DetailNotePageState();
}

class _DetailNotePageState extends State<DetailNotePage> {
  final firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instance;

  final CollectionReference _noteReference =
      FirebaseFirestore.instance.collection("notes");

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

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

  saveNote() async {
    final DateTime now = DateTime.now();
    final DateFormat formatterDate = DateFormat('yyyy-MM-dd');
    final DateFormat formatterTime = DateFormat('hh:mm a');
    final String formattedDate = formatterDate.format(now);
    final String formattedTime = formatterTime.format(now);

    if (_image != null) {
      String urlImage = await uploadImage();
      NoteModel noteModel = NoteModel(
        title: _titleController.text,
        date: formattedDate,
        time: formattedTime,
        image: urlImage,
        description: _descriptionController.text,
      );
      _noteReference.add(noteModel.toJson()).then((value) {
        print(value);
      });
    }

  }

  Future<String> uploadImage() async {
    firebase_storage.Reference _reference = _storage.ref().child("images");
    String nameImage = DateTime.now().toString();
    firebase_storage.TaskSnapshot uploadTask =
        await _reference.child("$nameImage.jpg").putFile(File(_image!.path));
    String url = await uploadTask.ref.getDownloadURL();
    return url;
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

    NoteProvider noteProvider = Provider.of<NoteProvider>(context);

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
                controller: _titleController,
              ),
              TextFieldNormalWidget(
                hintText: "Descripción",
                controller: _descriptionController,
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
                      : const AssetImage(
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
                onPressed: () {
                  saveNote();
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              ButtonNormalWidget(
                text: "Provider",
                onPressed: () {
                  noteProvider.setNumberNote(400);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
