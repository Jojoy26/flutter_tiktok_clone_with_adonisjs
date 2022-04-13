import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tik_tok/src/controllers/create_video_controller.dart';
import 'package:flutter_tik_tok/src/pages/createVideo/widgets/header.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CreateVideo extends StatefulWidget {
  const CreateVideo({ Key? key }) : super(key: key);

  @override
  State<CreateVideo> createState() => _CreateVideoState();
}

class _CreateVideoState extends State<CreateVideo> {

  final controller = GetIt.I.get<CreateVideoController>();
  late VideoPlayerController videoPlayerController;

  File? video;

  Future getVideo() async {
    final ImagePicker _picker = ImagePicker();
    late XFile? videoFile;
    videoFile = await _picker.pickVideo(source: ImageSource.gallery);

    if(videoFile != null){

      video = File(videoFile!.path);
      videoPlayerController = VideoPlayerController.network(
        video!.path
      )..initialize().then((value){
        videoPlayerController.setLooping(true);
        
        setState(() {
          videoPlayerController.play();
        });
      });
    }
  }

  void toggleVideo(){
    if(videoPlayerController.value.isPlaying){
      setState(() {
        videoPlayerController.pause();
      });
    } else {
      setState(() {
        videoPlayerController.play();
      });
    }
  }

  void onSucess() {
    setState(() {
      video = null;
      videoPlayerController.dispose();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      appBar: video != null ? 
      Header(
        onUploadPress: () {
          controller.uploadVideo(video as File, onSucess);
        },
        onCancelPress: () {
          setState(() {
            video = null;
            videoPlayerController.dispose();
          });
        },
      ) : null,
      body: video == null ? Center(
        child: TextButton(
          onPressed: (){
            getVideo();
          },
          child: Text(
            'Upload Video',
            style: TextStyle(
              fontSize: 17
            ),
          ),
        ),
      ): Column(
        children: [
          Obx(() => controller.isLoading.value ? 
            LinearProgressIndicator() : Container()),
          SizedBox(height: 10,),
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: videoPlayerController.value.aspectRatio,
                child: InkWell(
                  onTap: toggleVideo,
                  child: VideoPlayer(videoPlayerController)
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}