// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_tik_tok/src/controllers/tiktok_controller.dart';
import 'package:flutter_tik_tok/src/pages/tiktok/pages.dart';
import 'package:flutter_tik_tok/src/pages/tiktok/widgets/bottom_navigation.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class TikTokPage extends StatelessWidget {
  const TikTokPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = GetIt.I.get<TikTokController>();

    return Scaffold(
      body: Obx(() => pages[controller.selectedPage.value]),
      bottomNavigationBar: BottomNavigation()
    );
  }
}