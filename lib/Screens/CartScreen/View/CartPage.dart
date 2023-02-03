import 'package:ecommerce_with_getx/Screens/HomeScreen/Controller/HomeController.dart';
import 'package:ecommerce_with_getx/Screens/HomeScreen/Model/HomeModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cart",style: GoogleFonts.lobster(color: Colors.black),),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: (){
              Get.back();
              if(homeController.Totle_Price!.value == 0.0)
                {
                  homeController.lenth.value = 0;
                }
            },
            icon: Icon(Icons.arrow_back,color: Colors.black,size: 25,),
          ),
        ),
        body: Obx(() => Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: homeController.CartList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: Get.height/9,
                    alignment: Alignment.center,
                    child: ListTile(
                      leading: Container(
                        height: Get.height/12,
                        width: Get.width/5,
                        child: Image.asset("${homeController.CartList[index].image}",),
                      ),
                      title: Text(
                        "${homeController.h1.value.name}",
                        style: GoogleFonts.lobster(fontSize: 15.sp),
                      ),
                      subtitle: Text(
                        "${homeController.CartList[index].quantity}x U\$ ${homeController.CartList[index].price}",
                        style: GoogleFonts.lobster(fontSize: 12.sp),
                      ),
                      trailing: Container(
                        width: Get.width/2.6,
                        // color: Colors.green,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: (){
                                homeController.CartList.value[index] = HomeModel(
                                  name: homeController.CartList[index].name,
                                  description: homeController.CartList[index].description,
                                  image: homeController.CartList[index].image,
                                  price: homeController.CartList[index].price,
                                  TotalPrice: homeController.CartList[index].TotalPrice,
                                  quantity: homeController.CartList[index].quantity! - 1,
                                );
                                if(homeController.CartList[index].quantity! >= 1)
                                  {
                                    homeController.Totle_Price!.value = 0.0;
                                    homeController.CartList[index].TotalPrice = 0.0;
                                    for(int i=0; i<homeController.CartList.length; i++)
                                    {
                                      homeController.CartList.value[i] = HomeModel(
                                        name: homeController.CartList[i].name,
                                        description: homeController.CartList[i].description,
                                        image: homeController.CartList[i].image,
                                        price: homeController.CartList[i].price,
                                        TotalPrice: homeController.CartList[i].quantity! * homeController.CartList[i].price!,
                                        quantity: homeController.CartList[i].quantity!,
                                      );
                                      homeController.Totle_Price!.value = homeController.Totle_Price!.value + homeController.CartList[i].TotalPrice!;
                                    }
                                  }
                                else if(homeController.CartList[index].quantity! == 0)
                                  {
                                    homeController.Totle_Price!.value = 0.0;
                                    homeController.CartList[index].TotalPrice = 0.0;
                                    homeController.CartList.value.removeAt(index);
                                    for(int i=0; i<homeController.CartList.length; i++)
                                    {
                                      homeController.CartList.value[i] = HomeModel(
                                        name: homeController.CartList[i].name,
                                        description: homeController.CartList[i].description,
                                        image: homeController.CartList[i].image,
                                        price: homeController.CartList[i].price,
                                        TotalPrice: homeController.CartList[i].quantity! * homeController.CartList[i].price!,
                                        quantity: homeController.CartList[i].quantity!,
                                      );
                                      homeController.Totle_Price!.value = homeController.Totle_Price!.value + homeController.CartList[i].TotalPrice!;
                                    }
                                  }
                              },
                              icon: Icon(Icons.remove,color: Colors.green,),
                            ),
                            IconButton(
                              onPressed: (){
                                homeController.Totle_Price!.value = 0.0;
                                homeController.CartList[index].TotalPrice = 0.0;
                                homeController.CartList.value[index] = HomeModel(
                                  name: homeController.CartList[index].name,
                                  description: homeController.CartList[index].description,
                                  image: homeController.CartList[index].image,
                                  price: homeController.CartList[index].price,
                                  TotalPrice: homeController.CartList[index].TotalPrice,
                                  quantity: homeController.CartList[index].quantity! + 1,
                                );
                                for(int i=0; i<homeController.CartList.length; i++)
                                {
                                  homeController.CartList.value[i] = HomeModel(
                                    name: homeController.CartList[i].name,
                                    description: homeController.CartList[i].description,
                                    image: homeController.CartList[i].image,
                                    price: homeController.CartList[i].price,
                                    TotalPrice: homeController.CartList[i].quantity! * homeController.CartList[i].price!,
                                    quantity: homeController.CartList[i].quantity!,
                                  );
                                  homeController.Totle_Price!.value = homeController.Totle_Price!.value + homeController.CartList[i].TotalPrice!;
                                }
                              },
                              icon: Icon(Icons.add,color: Colors.green,),
                            ),
                            IconButton(
                              onPressed: (){
                                homeController.Totle_Price!.value = 0.0;
                                homeController.CartList[index].TotalPrice = 0.0;
                                homeController.CartList.value.removeAt(index);
                                homeController.lenth.value--;
                                // for(int i=0; i<homeController.CartList.length; i++)
                                //   {
                                //     homeController.CartList.value[i] = HomeModel(
                                //       name: homeController.CartList[i].name,
                                //       description: homeController.CartList[i].description,
                                //       image: homeController.CartList[i].image,
                                //       price: homeController.CartList[i].price,
                                //       quantity: 1,
                                //       TotalPrice: homeController.CartList[i].quantity! * homeController.CartList[i].price!,
                                //     );
                                //     homeController.Totle_Price!.value = homeController.Totle_Price!.value + homeController.CartList[i].TotalPrice!;
                                //   }
                                homeController.CartList.value[index] = HomeModel(
                                  name: homeController.CartList[index].name,
                                  description: homeController.CartList[index].description,
                                  image: homeController.CartList[index].image,
                                  price: homeController.CartList[index].price,
                                  TotalPrice: homeController.CartList[index].TotalPrice,
                                  quantity: 1,
                                );
                                for(int i=0; i<homeController.CartList.length; i++)
                                    {
                                  homeController.CartList[i].TotalPrice = homeController.CartList[i].quantity! * homeController.CartList[i].price!;
                                  homeController.Totle_Price!.value = homeController.Totle_Price!.value + homeController.CartList[i].TotalPrice!;
                                }
                              },
                              icon: Icon(Icons.delete_outline,color: Colors.green,),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
                height: Get.height/8,
                margin: EdgeInsets.symmetric(horizontal: Get.width/60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: Get.width/20,top: Get.height/40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total",
                            style: GoogleFonts.lobster(
                                color: Colors.black,
                                textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                                fontSize: 15.sp
                            ),
                          ),
                          Text(
                            "U\$ ${homeController.Totle_Price!.value.toStringAsFixed(1)}",
                            style: GoogleFonts.lobster(
                                color: Colors.green,
                                textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                                fontSize: 19.sp
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.back();
                        if(homeController.Totle_Price!.value == 0.0)
                          {
                            Get.snackbar(
                              "Cart Alert",
                              "Please Add Your Product",
                            );
                            homeController.lenth!.value = 0;
                          }
                        else
                          {
                            Get.snackbar(
                              "Order Placed",
                              "Order Placed With Success",
                            );
                            homeController.CartList.clear();
                            homeController.Totle_Price!.value = 0.0;
                            homeController.lenth!.value = 0;
                          }
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
                              "PURCHASE",
                              style: GoogleFonts.lobster(
                                  color: Colors.black,
                                  fontSize: 18.sp
                              ),
                            ),
                            Container(
                              height: Get.height/19,
                              width: Get.height/19,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green
                              ),
                              child: Icon(Icons.arrow_forward_ios,color: Colors.white,size: 25,),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
            ),
          ],
        ),)
      ),
    );
  }
}
