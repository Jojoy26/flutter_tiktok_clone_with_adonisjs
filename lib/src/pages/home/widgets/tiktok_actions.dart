import 'package:flutter/material.dart';
import 'package:flutter_tik_tok/src/models/video_model.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_tik_tok/src/controllers/home_controller.dart';
import 'package:flutter_tik_tok/src/pages/home/widgets/avatar.dart';

class TikTokActions extends StatefulWidget {

  final int index;

  const TikTokActions({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<TikTokActions> createState() => _TikTokActionsState();
}

class _TikTokActionsState extends State<TikTokActions> with TickerProviderStateMixin {

  final homeController = GetIt.I.get<HomeController>();
  late Rx<VideoModel> video;

  late AnimationController animationController;
  late Animation<double> scale;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    video = homeController.videosList[widget.index];
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200)
    );

    scale = Tween<double>(begin: 1, end: 1.2).animate(animationController);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 85,
      right: 10,
      child: Column(
        children: [
          Avatar(url: video.value.user.profileImage),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: () async{
              homeController.like(widget.index);
              await animationController.forward();
              await animationController.reverse();
            }, 
            child: ScaleTransition(
              scale: scale,
              child: Obx(() => 
                  Icon(
                    Icons.favorite,
                    color: video.value.isLiked ? Colors.red : Colors.white,
                    size: 39.6,
                  ),
                )
              )
            ),
          Obx(() => textLabel(video.value.likeCount.toString())),
          SizedBox(height: 20,),
          Icon(Icons.message, color: Colors.white, size: 33,),
          textLabel('55'),
          SizedBox(height: 20,),
          Transform.rotate(
            angle: 9.4,
            child: Icon(Icons.reply, color: Colors.white, size: 44,),
          ),
          textLabel('67')
        ],
      )
    );
  }
}

Widget textLabel(String label){
  return Text(
    label, style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 11
    ),
  );
}