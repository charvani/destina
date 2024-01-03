import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class FormViewScreen extends StatefulWidget {
  final String date, description, downloadlink, title;

  const FormViewScreen(
      {super.key,
      required this.title,
      required this.date,
      required this.description,
      required this.downloadlink});

  @override
  State<FormViewScreen> createState() => _FormViewScreenState();
}

class _FormViewScreenState extends State<FormViewScreen> {
  double? progressVal;
  bool progressbar = false;

  @override
  void initState() {
    super.initState();
    print("url is...${widget.downloadlink}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "", backNavigation: true),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(
                color: lightBlackColor.withOpacity(0.3),
              ),
              borderRadius: BorderRadius.circular(15)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Forms & Agreement",
              style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 16),
            ),
            const SpaceHeightWidget(height: 25),
            Text(
              widget.date,
              style: const TextStyle(fontFamily: "OnestRegular", fontSize: 14),
            ),
            const SpaceHeightWidget(height: 18),
            Text(
              widget.title,
              style: const TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
            ),
            Text(
              widget.description,
              style: const TextStyle(fontFamily: "OnestRegular", fontSize: 12),
            ),
            const SpaceHeightWidget(height: 25),
            if (progressbar)
              Column(
                children: [
                  LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(10),
                    value: progressVal! / 100.00,
                  ),
                  const SpaceHeightWidget(height: 10)
                ],
              ),
            CustomElevatedButton(
                onTapFun: () async {
                  if (progressbar == false) {
                    FileDownloader.downloadFile(
                        url: widget.downloadlink,
                        // url:
                        //     "https://admin.destina1.com/MemberDownloads/GoProChapter_12.mp3",
                        name: widget.downloadlink
                            .split('MemberDownloads/')
                            .last, //(optional)
                        onProgress: (String? name, double? onProgress) {
                          setState(() {
                            progressbar = true;
                            progressVal = onProgress;
                            if (progressVal == 100.0) {
                              progressbar = false;
                            }
                          });

                          print('FILE fileName HAS PROGRESS $onProgress');
                        },
                        onDownloadCompleted: (String path) {
                          print('FILE DOWNLOADED TO PATH: $path');
                          CommonToastTrue("Successfully donwloaded");
                        },
                        onDownloadError: (String error) {
                          print('DOWNLOAD ERROR: $error');
                          CommonToast(error);
                        });
                  }
                },
                title: "Click To Download")
          ]),
        ),
      ),
    );
  }
}
