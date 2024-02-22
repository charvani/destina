import 'dart:io';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({super.key});

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController reviewController = TextEditingController();
  final _fomkey = GlobalKey<FormState>();
  List<XFile>? imagesList = [];
  XFile? videoFile;
  VideoPlayerController _controller = VideoPlayerController.asset("");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _onVideoPlayerStateChanged() {
    if (_controller.value.isInitialized) {
      if (_controller.value.isCompleted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: "Write Review"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SpaceHeightWidget(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _fomkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CommonTitle(
                      titleName: "Your Name",
                      size: 14,
                    ),
                    RegisterTextField(
                      // inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                      controller: nameController,
                      hintText: '',
                      textInputType: TextInputType.name,
                      onchangeFun: (val) {
                        setState(() {});
                      },
                      validation: (val) {
                        return null;
                      },
                      labelText: '',
                    ),
                    const CommonTitle(
                      titleName: "Write your review",
                      size: 14,
                    ),
                    AccountTextField(
                      minLines: 3,
                      onchangeFun: (val) {},
                      outsideFun: (val) async {},
                      textInputType: TextInputType.multiline,
                      hintText: "",
                      controller: reviewController,
                      validation: (val) {
                        if (val!.isEmpty) {
                          return "Enter your review";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const CommonTitle(
                      titleName: "How would you rate it?",
                      size: 14,
                    ),
                    const SpaceHeightWidget(height: 2),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemSize: 25,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    const SpaceHeightWidget(height: 15),
                    const CommonTitle(
                      titleName: "Share photos",
                      size: 14,
                    ),
                    const SpaceHeightWidget(height: 5),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          if (imagesList!.isNotEmpty)
                            for (int i = 0; i < imagesList!.length; i++)
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 4),
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: lightBlackColor),
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: FileImage(
                                                File(imagesList![i].path)),
                                            fit: BoxFit.cover)),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(right: 8, top: 5),
                                    child: GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () {
                                          setState(() {
                                            imagesList!.remove(imagesList![i]);
                                          });
                                        },
                                        child: CircleAvatar(
                                            backgroundColor: darkBlue,
                                            radius: 11,
                                            child: Icon(
                                              Icons.close,
                                              size: 18,
                                              color: whiteColor,
                                            ))),
                                  )
                                ],
                              ),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              imageSelctionFun();
                            },
                            child: DottedBorder(
                              color: middleBlackColor.withOpacity(0.3),
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(12),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Icon(
                                    Icons.add_photo_alternate_outlined,
                                    color: middleBlackColor.withOpacity(0.4),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SpaceHeightWidget(height: 10),
                    const CommonTitle(
                      titleName: "Share a video(single)",
                      size: 14,
                    ),
                    if (videoFile != null) Text("my...$videoFile"),
                    _controller.value.isInitialized
                        ? Stack(
                            alignment: Alignment.topRight,
                            children: [
                              // AspectRatio(
                              //   aspectRatio: _controller.value.aspectRatio,
                              //   child: VideoPlayer(_controller),
                              // ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 4),
                                    height: 100,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: lightBlackColor),
                                      borderRadius: BorderRadius.circular(10),
                                      // image: DecorationImage(
                                      //     image: FileImage(File(videoFile!.path)),
                                      //     fit: BoxFit.cover)
                                    ),
                                    child: VideoPlayer(_controller),
                                  ),
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
                                          )))
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 8, top: 5),
                                child: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      setState(() {
                                        videoFile = null;
                                      });
                                    },
                                    child: CircleAvatar(
                                        backgroundColor: darkBlue,
                                        radius: 11,
                                        child: Icon(
                                          Icons.close,
                                          size: 18,
                                          color: whiteColor,
                                        ))),
                              )
                            ],
                          )
                        : GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              videoSelctionFun();
                            },
                            child: DottedBorder(
                              color: middleBlackColor.withOpacity(0.3),
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(12),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Icon(
                                    Icons.video_collection_outlined,
                                    color: middleBlackColor.withOpacity(0.4),
                                  ),
                                ),
                              ),
                            ),
                          ),
                    const SpaceHeightWidget(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 35,
                            child: CustomAutoWidthButton(
                                onTapFun: () {
                                  Get.back();
                                },
                                title: "Submit")),
                      ],
                    ),
                    const SpaceHeightWidget(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  imageSelctionFun() {
    Get.dialog(ImageOptionsDialog(
      cameraFun: () async {
        print("camera");
        Get.back();
        XFile imageFile = await imagePickFun("camera");
        setState(() {
          imagesList!.add(imageFile);
        });
      },
      galleryFun: () async {
        print("gallery");
        Get.back();
        XFile imageFile = await imagePickFun("gallery");
        setState(() {
          imagesList!.add(imageFile);
        });
      },
    ));
  }

  videoSelctionFun() {
    Get.dialog(ImageOptionsDialog(
      cameraFun: () async {
        print("camera");
        Get.back();
        XFile videofile = await videoPickFun("camera");
        _controller = VideoPlayerController.file(File(videofile.path))
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });
        _controller.addListener(_onVideoPlayerStateChanged);
      },
      galleryFun: () async {
        print("gallery");
        Get.back();
        XFile videofile = await videoPickFun("gallery");

        _controller = VideoPlayerController.file(File(videofile.path))
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });
        _controller.addListener(_onVideoPlayerStateChanged);
      },
    ));
  }
}
