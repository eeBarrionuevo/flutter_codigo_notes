import 'package:flutter/material.dart';
import 'package:notes/pages/detail_note_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Text("Hola"),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailNotePage()));
                },
                child: Text(
                  "Ir",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
