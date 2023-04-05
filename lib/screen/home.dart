import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/verse_controller.dart';
import '../model/response_model.dart';
import '../utilites/style.dart';
import '../widget/dashboard.dart';
class HomeScreen extends StatelessWidget {
  final _controller = Get.put(VerseController());
   HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          color: greenColor,
        ),
        title: Text(
          "Ramadan Karim",
          style: titleGreenStyle(),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: blueColor,
            backgroundImage: const AssetImage(
              "assets/icons/moon.png",
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .07),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: height * .01),
                child: Center(
                  child: Image(
                    image: const AssetImage('assets/icons/logo.png'),
                    width: width * .2,
                  ),
                )),
            Dashboard(height: height),

          ],
        ),
      ),
    );
  }
}
