import 'package:ecommerce_with_getx/Screens/HomeScreen/Controller/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Product",style: GoogleFonts.lobster(color: Colors.black),),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: Icon(Icons.arrow_back,color: Colors.black,size: 25,),
          ),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: Get.height/2.1,
                width: Get.width/1,
                child: Image.asset("${homeController.h1.value.image}"),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(left: Get.width/15),
                child: Text(
                  "${homeController.h1.value.name}",
                  style: GoogleFonts.lobster(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 21.sp
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: Get.width/1.2,
                height: Get.height/4.6,
                //color: Colors.red,
                margin: EdgeInsets.only(left: Get.width/15,top: Get.height/40),
                child: Text(
                  "${homeController.h1.value.description}",
                  maxLines: 9,
                  style: GoogleFonts.lobster(
                      color: Colors.black,
                      textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                      fontSize: 12.sp
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: Get.height/12,
                width: Get.width/1.1,
                margin: EdgeInsets.only(top: Get.height/60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "U\$ ${homeController.h1.value.price}",
                        style: GoogleFonts.lobster(
                            color: Colors.green,
                            textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                            fontSize: 23.sp
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        homeController.CartList.value.add(homeController.h1.value);
                        homeController.Totle_Price!.value = 0;
                        for(int i=0; i<homeController.CartList.length; i++)//0<2
                        {
                          homeController.Totle_Price!.value = homeController.CartList[i].quantity! * homeController.CartList[i].price! + homeController.Totle_Price!.value ;
                        }
                        homeController.lenth.value++;
                        Get.back();
                      },
                      child: Container(
                        height: Get.height/15,
                        width: Get.width/1.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Add To Cart",
                              style: GoogleFonts.lobster(
                                color: Colors.black,
                                fontSize: 21.sp
                              ),
                            ),
                            Container(
                              height: Get.height/18,
                              width: Get.height/18,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green
                              ),
                              child: Icon(Icons.shopping_cart_outlined,color: Colors.white,size: 25,),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
