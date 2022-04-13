import 'package:flutter/material.dart';
import 'package:flutter_tik_tok/src/controllers/tiktok_controller.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class BottomButton extends StatelessWidget {
  final IconData icon;
  final int index;

  const BottomButton({
    Key? key,
    required this.icon,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = GetIt.I.get<TikTokController>();

    return IconButton(
      onPressed: () {
        controller.setSelectedPage(index);
      },
      icon: Obx(() => 
      Icon(
          icon,
          color: controller.selectedPage.value == index ? Colors.white : Colors.grey,
          size: 28,
        ),
      ),
    );
  }
}
