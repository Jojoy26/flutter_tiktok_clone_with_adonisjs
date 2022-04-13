import 'package:flutter/material.dart';

class TikTokButton extends StatelessWidget {

  final void Function() onPressed;

  const TikTokButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 24.5,
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  width: 21,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(6)
                  ),
                ),
                Container(
                  width: 21,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(6)
                  ),
                )
              ],
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.only(left: 6, right: 6,),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Icon(
                    Icons.add
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
