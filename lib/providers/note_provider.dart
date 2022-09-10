
import 'package:flutter/material.dart';

class NoteProvider extends ChangeNotifier{

  int numberNote = 100;

  setNumberNote(int value){
    numberNote = value;
    notifyListeners();
  }

}