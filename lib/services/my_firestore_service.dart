

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/models/note_model.dart';

class MyFirestoreService{

  String collectionName;

  MyFirestoreService({required this.collectionName});

  late final CollectionReference _collectionReference = FirebaseFirestore.instance.collection(collectionName);

  Future<List<NoteModel>> getNotes() async{
    List<NoteModel> notes = [];
    QuerySnapshot collection = await _collectionReference.orderBy('date', descending: true).get();
    List<QueryDocumentSnapshot> docs = collection.docs;
    notes = docs.map((e){
      NoteModel noteModel = NoteModel.fromJson(e.data() as Map<String, dynamic>);
      noteModel.id = e.id;
      return noteModel;
    }).toList();
    return notes;
  }


}