import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class LessonPlayerController extends ChangeNotifier {
  VideoPlayerController? videoController;
  bool? isPaused;
  String startTime = '';
  bool isYoutubeVideo = true;
  String endTime = '';
   YoutubePlayerController youtubeVideoController = YoutubePlayerController();
  final ScrollController scrollController = ScrollController();
  List<String> videoIds = [
    "H7rJ2EIyZYU",
    "Khek5yYqva4",
    'J8TjK5SR4ok',
    'kK_6yKCZpSA',
    'ysKQ7Tuo9qY',
    'pEqTsaFNCsE',
    'sq-SO4lQlNg',
    '2Igqa9pRxd0',
    'v64T8Mk5_Tc',
  ];

  void youtubePlayerInitialization(
    BuildContext context, {
    String videoId = "",
  }) {
    youtubeVideoController = YoutubePlayerController.fromVideoId(
      videoId: "v64T8Mk5_Tc",
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
    );
    // notifyListeners();
  }

  videoInitialization(String url, String videoTitle) async {
    videoController = VideoPlayerController.asset(
      url,
    )..addListener(() {
        if (videoController?.value.hasError ?? false) {
        } else {
          startTime = videoController?.value.position.toString().split(".")[0] ?? "";
          endTime = videoController?.value.duration.toString().split(".")[0] ?? "";
        }
        notifyListeners();
      });
    await videoController?.initialize().onError((error, stackTrace) {});
    await videoController?.seekTo(Duration.zero);
    videoController?.play();
    notifyListeners();
  }

  playPauseVideo(bool isPlaying, VideoPlayerController videoCon) {
    isPaused = !isPlaying;
    videoCon.value.isPlaying ? videoCon.pause() : videoCon.play();
    notifyListeners();
  }
}
