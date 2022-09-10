

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/models/note_model.dart';

class MyFirestoreService{


  Future<List<NoteModel>> getNotes() async{
    List<NoteModel> notes = [];
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('notes');
    QuerySnapshot collection = await collectionReference.orderBy('date', descending: true).get();
    List<QueryDocumentSnapshot> docs = collection.docs;
    notes = docs.map((e){
      NoteModel noteModel = NoteModel.fromJson(e.data() as Map<String, dynamic>);
      noteModel.id = e.id;
      return noteModel;
    }).toList();
    return notes;
  }


}