import 'package:flutter/material.dart';
import 'package:flutter_tik_tok/src/controllers/splash_controller.dart';
import 'package:flutter_tik_tok/src/widgets/tiktok_clone_text.dart';
import 'package:get_it/get_it.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = GetIt.I.get<SplashController>();
    controller.getCurrentUser();

    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: Center(
        child: TikTokCloneText(),
      ),
    );
  }
}