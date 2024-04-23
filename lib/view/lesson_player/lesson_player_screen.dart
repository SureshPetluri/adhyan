import 'package:adhyan/view/lesson_player/lesson_player_controller.dart';
import 'package:adhyan/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'animated_play_pause_btn.dart';

class LessonPlayerScreen extends StatefulWidget {
  const LessonPlayerScreen({super.key});

  @override
  State<LessonPlayerScreen> createState() => _LessonPlayerScreenState();
}

class _LessonPlayerScreenState extends State<LessonPlayerScreen> {
  @override
  void initState() {
    if (context.read<LessonPlayerController>().isYoutubeVideo == true) {
      context.read<LessonPlayerController>().youtubePlayerInitialization(
          context,
          videoId: 'BblraEtrFLI',);
    } else {
      context.read<LessonPlayerController>().videoInitialization(
          "asset/images/3694919-hd_1080_1920_30fps.mp4", "");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText("Lessons"),
      ),
      body: Consumer<LessonPlayerController>(builder: (context, controller, _) {
        return SingleChildScrollView(
          child: Column(
            children: [
              controller.isYoutubeVideo
                  ? YoutubePlayerScaffold(
                      controller: controller.youtubeVideoController,
                      aspectRatio: 16 / 9,
                      builder: (context, player) {
                        return Center(
                            child: player);
                      })
                  : Center(
                      child: (controller.videoController?.value.isInitialized ??
                              false)
                          ? AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Container(
                                color: Colors.black,
                                child: Stack(
                                  children: [
                                    VideoPlayer(controller.videoController!),
                                    Positioned(
                                      bottom: 50.0,
                                      top: 50.0,
                                      left: 0.0,
                                      right: 0.0,
                                      child: InkWell(
                                        radius: 0.0,
                                        child: AnimatedPlayPause(
                                          size: 40.0,
                                          color: Colors.blue,
                                          playing: controller.isPaused =
                                              controller.videoController!.value
                                                  .isPlaying,
                                        ),
                                        onTap: () {
                                          controller.playPauseVideo(
                                              (controller.videoController?.value
                                                      .isPlaying ??
                                                  false),
                                              controller.videoController!);
                                        },
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 20.0,
                                      left: 0.0,
                                      right: 0.0,
                                      child: Column(
                                        children: [
                                          VideoProgressIndicator(
                                            controller.videoController!,
                                            allowScrubbing: true,
                                            colors: const VideoProgressColors(
                                                backgroundColor: Colors.red,
                                                bufferedColor: Colors.grey,
                                                playedColor: Colors.blue),
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              children: [
                                                InkWell(
                                                  radius: 0.0,
                                                  child: AnimatedPlayPause(
                                                    color: Colors.blue,
                                                    playing: controller
                                                            .isPaused =
                                                        controller
                                                            .videoController!
                                                            .value
                                                            .isPlaying,
                                                  ),
                                                  onTap: () {
                                                    controller.playPauseVideo(
                                                        (controller
                                                                .videoController
                                                                ?.value
                                                                .isPlaying ??
                                                            false),
                                                        controller
                                                            .videoController!);
                                                  },
                                                ),
                                                Text(
                                                  "${controller.startTime}/${controller.endTime}",
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          : const SizedBox.shrink()),
              ListView.builder(
                  controller: controller.scrollController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.videoIds.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (context
                                .read<LessonPlayerController>()
                                .isYoutubeVideo ==
                            true) {
                          context.ytController.loadVideoById(
                            videoId: controller.videoIds[index],
                          );
                        } else {
                          context
                              .read<LessonPlayerController>()
                              .videoInitialization(
                                  "asset/images/videoplayback.mp4", "");
                        }
                      },
                      onDoubleTap: () {
                        if (context
                                .read<LessonPlayerController>()
                                .isYoutubeVideo ==
                            true) {
                          context
                              .read<LessonPlayerController>()
                              .youtubePlayerInitialization(context,
                                  videoId: 'iLnmTe5Q2Qw',);
                          setState(() {});
                        } else {
                          context
                              .read<LessonPlayerController>()
                              .videoInitialization(
                                  "asset/images/videoplayback.mp4", "");
                        }
                      },
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          height: 70,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        );
      }),
    );
  }
}
