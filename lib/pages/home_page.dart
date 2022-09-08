import 'package:flutter/material.dart';
import 'package:notes/pages/detail_note_page.dart';
import 'package:notes/ui/widgets/item_list_widget.dart';

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
      backgroundColor: Color(0xffF9FDFF),
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
                ItemListWidget(),
                ItemListWidget(),
                ItemListWidget(),
                ItemListWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
