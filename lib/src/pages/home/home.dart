import 'package:flutter/material.dart';
import 'package:flutter_tik_tok/src/controllers/home_controller.dart';
import 'package:flutter_tik_tok/src/pages/home/widgets/video.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = GetIt.I.get<HomeController>();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: Obx((){
          if (controller.isLoading.value && !controller.hasError.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if(!controller.isLoading.value && controller.hasError.value) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Failed to load videos",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17
                  ),
                ),
                TextButton(
                  onPressed: controller.getVideos, 
                  child: Text(
                    'Try again',
                    style: TextStyle(
                      fontSize: 17
                    ),
                  )
                )
              ],
            );
          } else if(!controller.isLoading.value && !controller.hasError.value && controller.videosList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No videos to show",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17
                    ),
                  ),
                  TextButton(
                    onPressed: controller.getVideos, 
                    child: Text(
                      'Load Videos',
                      style: TextStyle(
                        fontSize: 17
                      ),
                    )
                  )
                ],
              ),
            );
          }
          return SafeArea(
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.videosList.length,
              itemBuilder: (context, index) {
                return Video(
                  index: index,
                );
              }
            ),
          );
        }
      )
    );
  }
}