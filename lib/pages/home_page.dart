import 'package:flutter/material.dart';
import 'package:notes/pages/detail_note_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                children: [
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.indigo,
                  ),
                  Container(
                    color: Colors.yellow,
                  ),
                  Container(
                    color: Colors.greenAccent,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
