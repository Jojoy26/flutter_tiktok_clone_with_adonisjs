import 'package:flutter/material.dart';
import 'package:flutter_tik_tok/src/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:video_player/video_player.dart';

import 'package:flutter_tik_tok/src/models/video_model.dart';
import 'package:flutter_tik_tok/src/pages/home/widgets/tiktok_actions.dart';

class Video extends StatefulWidget {

  final int index;

  const Video({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {

  final homeController = GetIt.I.get<HomeController>();
  late Rx<VideoModel> video;

  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    print(widget.index);
    video = homeController.videosList[widget.index];
    controller = VideoPlayerController.network(
      video.value.video
    )..initialize().then((value){
      controller.setLooping(true);
      setState(() {
        controller.play();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void toggleVideo(){
    if(controller.value.isPlaying){
      setState(() {
        controller.pause();
      });
    } else {
      setState(() {
        controller.play();
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: InkWell(
                onTap: toggleVideo,
                child: VideoPlayer(controller)
              ),
            ),
          ),
          TikTokActions(
            index: widget.index,
          )
        ],
      )
    );
  }
}