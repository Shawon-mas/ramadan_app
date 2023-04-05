import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/verse_controller.dart';
import '../model/response_model.dart';
import '../utilites/style.dart';

class QuranList extends StatelessWidget {
  final _controller = Get.put(VerseController());

  QuranList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: greenColor,
          ),
        ),
        title: Text(
          "myQuran",
          style: titleGreenStyle(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Obx(() => _controller.isDataFetch.value
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: _controller.result.length,
                      itemBuilder: (context, index) {
                        //  List<Datum?> getAllVideo = _controller.videos;
                        //   List<VideoListModel> getAllVideo = _controller.videos as List<VideoListModel>;
                        //   List<VideoModel> videos =_controller.videos;
                        Result result = _controller.result[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5)),
                            //  height: 300.h,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(result.verseKey!.toString()),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(result.text!.toString())),
                                  Html(data: result.translations![0].text!),
                                  //Text(result.translations![0].text!),
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                  : Center(
                      child: CircularProgressIndicator(),
                    )))
        ],
      ),
    );
  }
}
/*

 */
