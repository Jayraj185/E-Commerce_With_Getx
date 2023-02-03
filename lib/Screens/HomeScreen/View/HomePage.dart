import 'package:ecommerce_with_getx/Screens/HomeScreen/Controller/HomeController.dart';
import 'package:ecommerce_with_getx/Screens/HomeScreen/Model/HomeModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Product App",style: GoogleFonts.lobster(color: Colors.black),),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Container(
              width: Get.width/6,
             // color: Colors.red,
              alignment: Alignment.centerLeft,
              child: Container(
                height: Get.height/25,
                width: Get.width/10.5,
                //color: Colors.black,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: (){
                          if(homeController.CartList.isNotEmpty)
                            {
                              Get.toNamed('Cart');
                            }
                          else
                            {
                              Get.snackbar("Cart Alert", "Please Add Your Product");
                            }
                        },
                        icon: Icon(Icons.shopping_cart_outlined,color: Colors.green,size: 25,),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Obx(() => homeController.lenth.value == 0 ? Container() : Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "${homeController.lenth}",
                          style: TextStyle(color: Colors.white,fontSize: 10),
                        ),
                      ),
                      )
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        body: Obx(() => GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: homeController.ProductList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: Get.height/3.6),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(Get.width/26),
              child: Container(
                width: Get.width/2.3,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: Get.width/3,
                        margin: EdgeInsets.only(top: Get.height/40),
                        child: Image.asset("${homeController.ProductList[index].image}"),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: Get.height/15,left: Get.width/21),
                        child: Text(
                          "${homeController.ProductList[index].name}",
                          style: GoogleFonts.lobster(
                              fontSize: 15.sp,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: EdgeInsets.only(bottom: Get.height/40,left: Get.width/21),
                        child: Text(
                          "U\$ ${homeController.ProductList[index].price}",
                          style: GoogleFonts.lobster(
                              fontSize: 15.sp,
                              color: Colors.green
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: (){
                          homeController.h1.value = homeController.ProductList[index];
                          Get.toNamed('Detail');
                        },
                        child: Container(
                          height: Get.height/23,
                          width: Get.width/12,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomRight: Radius.circular(12))
                          ),
                          child: Icon(Icons.shopping_bag_outlined,color: Colors.white,size: 23,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ))
      ),
    );
  }
}
