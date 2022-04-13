import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {

  final String url;

  const Avatar({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle
        ),
        padding: EdgeInsets.all(0.7),
          child: CircleAvatar(
            radius: 23,
            backgroundImage: NetworkImage(url),                  
          )
        ),
        Positioned.fill(
          bottom: -10,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle
              ),
              child: Icon(Icons.add, color: Colors.white, size: 16,),
            ),
          )
        )
      ],
    );
  }
}
