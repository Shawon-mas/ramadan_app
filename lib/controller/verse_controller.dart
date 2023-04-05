import 'package:get/get.dart';
import 'dart:convert';

import '../model/response_model.dart';
import '../utilites/api_services.dart';
import '../utilites/response_repository.dart';

class VerseController extends GetxController {
  RxList<Word> word = RxList<Word>();
  RxList<Translation> translation = RxList<Translation>();
  RxList<Result> result = RxList<Result>();
  var isDataFetch = false.obs;

  Future _getAllVerse() async {

    var response = await generalGet(url: ApiServices.baseUrl);
    if (response != null) {
      //Search verseResponse = Search.fromJson(json.decode(response.body));
      final model=responseModelFromJson(response.body);
      result.value=model!.search!.results!;
      isDataFetch.value = true;
      print(result.length);
      print(response.body);

    }
    isDataFetch.value = true;
  }
  @override
  void onInit() {
    // TODO: implement onInit
    _getAllVerse();
    //  videoPlayer();
    //  fetchVideos();
    super.onInit();

  }
}