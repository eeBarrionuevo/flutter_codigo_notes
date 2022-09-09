import 'package:flutter/material.dart';

class ButtonNormalWidget extends StatelessWidget {

  String text;
  Function onPressed;

  ButtonNormalWidget({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.indigo,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
        child: Text(
          text,
        ),
      ),
    );
  }
}
