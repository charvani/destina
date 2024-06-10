import 'dart:convert';
import 'dart:io';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:video_player/video_player.dart';

import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';

class WriteReviewScreen extends StatefulWidget {
  final String pid;
  const WriteReviewScreen({super.key, required this.pid});

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController reviewController = TextEditingController();
  final _fomkey = GlobalKey<FormState>();
  List<XFile>? imagesList = [];
  List<dynamic>? finalImagesList = [];
  List<dynamic>? imgExtensionsList = [];
  XFile? videoFile;
  VideoPlayerController _controller = VideoPlayerController.asset("");
  final MainController _reviewController = Get.put(MainController());
  dynamic ratingVal, reviewSession;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ratingVal = "3";
      reviewSession = generateTimeStamp();
    });
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
                        if (val!.isEmpty) {
                          return "Please enter your name";
                        } else {
                          return null;
                        }
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
                        setState(() {
                          ratingVal = rating;
                        });
                      },
                    ),
                    const SpaceHeightWidget(height: 15),
                    const CommonTitle(
                      titleName: "Share photos",
                      size: 14,
                    ),
                    CommonTitle(
                      titleName: "Note: Images size should not exceed 1.0MB",
                      size: 12,
                      fontColor: darkRedColor,
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
                                            imageBytesCount = imageBytesCount -
                                                File(imagesList![i].path)
                                                    .readAsBytesSync()
                                                    .lengthInBytes;
                                            imagesList!.remove(imagesList![i]);
                                            finalImagesList!
                                                .remove(finalImagesList![i]);
                                            imgExtensionsList!
                                                .remove(imgExtensionsList![i]);
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
                    CommonTitle(
                      titleName: "Note: Video size should not exceed 1.0MB",
                      size: 12,
                      fontColor: darkRedColor,
                    ),
                    _controller.value.isInitialized && videoFile != null
                        ? Stack(
                            alignment: Alignment.topRight,
                            children: [
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
                                        videoExtension = null;
                                        _controller.dispose();
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
                        Obx(() {
                          return _reviewController.loading.value
                              ? loader
                              : SizedBox(
                                  height: 35,
                                  child: CustomAutoWidthButton(
                                      onTapFun: () {
                                        if (_fomkey.currentState!.validate()) {
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();

                                          if (imageBytesCount > 0 &&
                                              imageBytesCount > 1000000) {
                                            Get.dialog(const OkDialog(
                                                title:
                                                    "Images size should not exceed 1.0MB"));
                                          } else {
                                            videosubmitFun();
                                          }
                                        }
                                      },
                                      title: "Submit"));
                        })
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

  dynamic img64;
  int imageBytesCount = 0;
  imageSelctionFun() {
    Get.dialog(ImageOptionsDialog(
      cameraFun: () async {
        Get.back();
        XFile imageFile = await imagePickFun("camera");
        final filePath = imageFile.path;
        final extension = path.extension(filePath);
        final bytes = File(imageFile.path).readAsBytesSync();
        img64 = base64Encode(bytes);
        setState(() {
          imagesList!.add(imageFile);
          finalImagesList!.add(img64);
          imgExtensionsList!.add(extension);
          imageBytesCount = imageBytesCount +
              File(imageFile.path).readAsBytesSync().lengthInBytes;
        });
      },
      galleryFun: () async {
        Get.back();
        XFile imageFile = await imagePickFun("gallery");
        final filePath = imageFile.path;
        final extension = path.extension(filePath);
        final bytes = File(imageFile.path).readAsBytesSync();
        img64 = base64Encode(bytes);
        setState(() {
          imagesList!.add(imageFile);
          finalImagesList!.add(img64);
          imgExtensionsList!.add(extension);
          imageBytesCount = imageBytesCount +
              File(imageFile.path).readAsBytesSync().lengthInBytes;
        });
      },
    ));
  }

  dynamic videoExtension;
  videoSelctionFun() {
    Get.dialog(ImageOptionsDialog(
      cameraFun: () async {
        Get.back();
        XFile videofile = await videoPickFun("camera");
        final filePath = videofile.path;
        final extension = path.extension(filePath);
        setState(() {
          videoFile = videofile;
          videoExtension = extension;
        });
        _controller = VideoPlayerController.file(File(videofile.path))
          ..initialize().then((_) {
            setState(() {});
          });
        _controller.addListener(_onVideoPlayerStateChanged);
      },
      galleryFun: () async {
        Get.back();
        XFile videofile = await videoPickFun("gallery");
        final filePath = videofile.path;
        final extension = path.extension(filePath);
        setState(() {
          videoFile = videofile;
          videoExtension = extension;
        });
        _controller = VideoPlayerController.file(File(videofile.path))
          ..initialize().then((_) {
            setState(() {});
          });
        _controller.addListener(_onVideoPlayerStateChanged);
      },
    ));
  }

  dynamic video64;
  videosubmitFun() async {
    if (videoFile != null) {
      int videoBytesCount =
          File(videoFile!.path).readAsBytesSync().lengthInBytes;
      if (videoBytesCount > 1000000) {
        Get.dialog(const OkDialog(title: "Video size should not exceed 1.0MB"));
      } else {
        List<int> videoBytes = await videoFile!.readAsBytes();
        setState(() {
          video64 = base64Encode(videoBytes);
        });
        videoapiFun();
      }
    } else {
      apicallFun("");
    }
  }

  videoapiFun() async {
    Map bdata = {
      "Action": "Insert",
      "VidFiles": videoExtension ?? "",
      "Video": video64 ?? ""
    };

    dynamic res = await _reviewController.getReviewVideoUpload(
      bdata,
    );
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        apicallFun(res['Rid']);
      } else {
        CommonToast(res['Message']);
      }
    }
  }

  submitFun(String rid) async {
    if (videoFile != null) {
      int videoBytesCount =
          File(videoFile!.path).readAsBytesSync().lengthInBytes;
      List<int> videoBytes = await videoFile!.readAsBytes();
      setState(() {
        video64 = base64Encode(videoBytes);
      });
    }
  }

  apicallFun(String rid) async {
    Map bdata = {
      "Action": "Insert",
      "Pid": widget.pid,
      "Name": nameController.text,
      "Review": reviewController.text,
      "Rating": ratingVal.toString(),
      "ImgFiles": finalImagesList!.isEmpty ? "" : imgExtensionsList!.join(","),
      "VidFiles": "",
      "Session": reviewSession,
      "Images": finalImagesList!.isEmpty ? "" : finalImagesList!.join(","),
      "Rid": rid,
      "Video": "",
    };

    Map reviewDataParams = {
      "action": "Report",
      "Pid": widget.pid,
      "Name": null,
      "Review": null,
      "Rating": null,
      "Images": null,
      "Video": null,
      "Session": null
    };
    dynamic res =
        await _reviewController.getReviewUpload(bdata, reviewDataParams);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        Get.back();
        CommonToastTrue(res['Message']);
      } else {
        CommonToast(res['Message']);
      }
    }
  }
}
