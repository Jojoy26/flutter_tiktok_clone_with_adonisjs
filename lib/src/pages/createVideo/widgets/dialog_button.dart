import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {

  final void Function() onPressed;
  final String title;

  const DialogButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 25),
          alignment: Alignment.centerLeft,
          primary: Colors.white
        ),
        onPressed: onPressed, 
        child: Text(title, style: TextStyle(color: Colors.white),)
      ),
    );
  }
}
