import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoDisplayScreen extends StatefulWidget {
  final String videoUrl;
  const VideoDisplayScreen({super.key, required this.videoUrl});

  @override
  State<VideoDisplayScreen> createState() => _VideoDisplayScreenState();
}

class _VideoDisplayScreenState extends State<VideoDisplayScreen> {
  late VideoPlayerController _controller = VideoPlayerController.asset("");

  void _onVideoPlayerStateChanged() {
    if (_controller.value.isInitialized) {
      if (_controller.value.isCompleted) {
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.addListener(_onVideoPlayerStateChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "", backNavigation: true),
      body: Column(children: [
        Container(
          height: 200,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
          child: _controller.value.isInitialized
              ? VideoPlayer(_controller)
              : loader,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 35,
              width: 100,
              child: CustomAutoWidthButton(
                  onTapFun: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    });
                  },
                  title: (_controller.value.isPlaying) ? "Pause" : "Play"),
            ),
            const SpaceWidthWidget(width: 10),
            GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  setState(() {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }
                  });
                },
                child: CircleAvatar(
                    backgroundColor: darkRedColor,
                    radius: 15,
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      size: 18,
                      color: whiteColor,
                    ))),
          ],
        )
      ]),
    );
  }
}
