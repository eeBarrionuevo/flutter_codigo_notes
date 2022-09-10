
import 'package:flutter/material.dart';
import 'package:notes/models/note_model.dart';

class NoteProvider extends ChangeNotifier{

  List<NoteModel> _noteList = [];

  List<NoteModel> get notes => _noteList;

  void initNoteList(List<NoteModel> value){
    _noteList = value;
    notifyListeners();
  }


}