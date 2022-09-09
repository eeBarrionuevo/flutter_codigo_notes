

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/ui/general/colors.dart';

class ItemListWidget extends StatelessWidget {

  NoteModel noteModel;
  ItemListWidget({required this.noteModel});

  final DateFormat formatterDate = DateFormat('dd-MMM-y');

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          const BoxShadow(
            color: Colors.white,
            offset: Offset(5, -5),
            blurRadius: 10.0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(4, 4),
            blurRadius: 12.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: kFontPrimaryColor,
                child: Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 12.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      noteModel.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kFontPrimaryColor.withOpacity(0.90),
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "${formatterDate.format(DateTime.parse(noteModel.date))}, ${noteModel.time}",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: kFontPrimaryColor.withOpacity(0.85),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6.0,
          ),
          const Divider(
            indent: 12.0,
            endIndent: 12.0,
          ),
          const SizedBox(
            height: 6.0,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              noteModel.image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            noteModel.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              height: 1.5,
              fontWeight: FontWeight.normal,
              color: kFontPrimaryColor.withOpacity(0.90),
            ),
          ),
        ],
      ),
    );
  }
}
