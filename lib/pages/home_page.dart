import 'package:flutter/material.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/pages/detail_note_page.dart';
import 'package:notes/providers/note_provider.dart';
import 'package:notes/ui/general/colors.dart';
import 'package:notes/ui/widgets/item_list_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<NoteProvider>(context, listen: false).setNoteList();
  }

  @override
  Widget build(BuildContext context) {

    NoteProvider _noteProviderx = Provider.of<NoteProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: kBackgroundPrimaryColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailNotePage()))
              .then((value) {
            // setState((){});
          });
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      "Mis notas",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14.0,
                ),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: _noteProviderx.notes.length,
                  itemBuilder: (context, index) {
                    return ItemListWidget(
                      noteModel: _noteProviderx.notes[index],
                    );
                  },
                ),

                // StreamBuilder(
                //   stream: _notesReference.orderBy('date', descending: true).snapshots(),
                //   builder: (BuildContext context, AsyncSnapshot snap){
                //     if(snap.hasData){
                //       QuerySnapshot collection = snap.data;
                //       List<QueryDocumentSnapshot> docs = collection.docs;
                //       List<NoteModel> notes = docs.map((e){
                //         NoteModel noteModel = NoteModel.fromJson(e.data() as Map<String, dynamic>);
                //         noteModel.id  = e.id;
                //         return noteModel;
                //       }).toList();
                //       return ListView.builder(
                //         shrinkWrap: true,
                //         physics: const ScrollPhysics(),
                //         itemCount: notes.length,
                //         itemBuilder: (context, index){
                //           return ItemListWidget(
                //             noteModel: notes[index],
                //           );
                //         },
                //       );
                //     }
                //     return const Center(
                //       child: CircularProgressIndicator(),
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
