import 'package:flutter/material.dart';

class TikTokCloneText extends StatelessWidget {
  const TikTokCloneText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'TikTok Clone',
      style: TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
        fontSize: 35,
      ),
      textAlign: TextAlign.center,
    );
  }
}