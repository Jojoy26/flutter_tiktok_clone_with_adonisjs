import 'package:flutter/material.dart';

class Header extends StatelessWidget with PreferredSizeWidget  {

  final void Function() onUploadPress;
  final void Function() onCancelPress;

  const Header({
    Key? key,
    required this.onUploadPress,
    required this.onCancelPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF000000),
      title: Row(
        children: [
          TextButton(
            onPressed: onUploadPress, 
            child: Text(
              'Upload Video',
              style: TextStyle(
                fontSize: 17
              ),
            )
          ),
          TextButton(
            onPressed: onCancelPress, 
            child: Text(
              'Cancel',
              style: TextStyle(
                fontSize: 17
              ),
            )
          ),
        ],
      )
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
