
import 'package:flutter/material.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/services/my_firestore_service.dart';

class NoteProvider extends ChangeNotifier{

  final MyFirestoreService _noteService = MyFirestoreService(collectionName: 'notes');

  List<NoteModel> _noteList = [];

  List<NoteModel> get notes => _noteList;

  void setNoteList() async {
    _noteList = await _noteService.getNotes();
    notifyListeners();
  }


}