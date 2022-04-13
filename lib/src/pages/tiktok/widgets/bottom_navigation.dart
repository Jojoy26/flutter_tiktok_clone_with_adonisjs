// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_tik_tok/src/controllers/tiktok_controller.dart';
import 'package:flutter_tik_tok/src/pages/tiktok/widgets/bottom_button.dart';
import 'package:flutter_tik_tok/src/pages/tiktok/widgets/tiktok_button.dart';
import 'package:get_it/get_it.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = GetIt.I.get<TikTokController>();

    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 14, right: 14),
      color: Colors.black,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [
          BottomButton(icon: Icons.home, index: 0,),
          BottomButton(icon: Icons.search, index: 1,),
          TikTokButton(
            onPressed: () {
              controller.setSelectedPage(2);
            },
          ),
          BottomButton(icon: Icons.message, index: 3,),
          BottomButton(icon: Icons.person, index: 4,)
        ],
      ),
    );
  }
}