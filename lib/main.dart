import 'package:ecommerce_with_getx/Screens/CartScreen/View/CartPage.dart';
import 'package:ecommerce_with_getx/Screens/DetailScreen/View/DetailPage.dart';
import 'package:ecommerce_with_getx/Screens/HomeScreen/View/HomePage.dart';
import 'package:ecommerce_with_getx/Screens/SplashScreen/View/SplashPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/' : (context) => SplashPage(),
            'Home' : (context) => HomePage(),
            'Detail' : (context) => DetailPage(),
            'Cart' : (context) => CartPage(),
          },
        );
      },
    )
  );
}