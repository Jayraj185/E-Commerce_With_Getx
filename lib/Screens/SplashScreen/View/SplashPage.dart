import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Get.offNamed('Home');
    });
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: Get.height/2,
                width: Get.width/1.2,
                child: Lottie.asset('assets/animation/ecommerse.json'),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(left: Get.width/120,bottom: Get.height/6),
                child: Text(
                  "From",
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 10.sp
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: Get.height/7.3),
                child: Text(
                  "Jayraj",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: Get.height/21),
                child: CircularProgressIndicator(color: Colors.black,)
              ),
            )

          ],
        ),
      ),
    );
  }
}
