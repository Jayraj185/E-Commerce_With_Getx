import 'package:ecommerce_with_getx/Screens/HomeScreen/Model/HomeModel.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{
  RxList<HomeModel> ProductList = [
    HomeModel(
      image: "assets/image/apple.png",
      name: "Apple",
      TotalPrice: 9.36,
      price: 9.36,
      quantity: 1,
      description: "Apples are an incredibly nutritious fruit that offers multiple health benefits. They're rich in fiber and antioxidants. Eating them is linked to a lower risk of many chronic conditions, including diabetes, heart disease, and cancer. Apples may also promote weight loss and improve gut and brain health.",
    ),
    HomeModel(
      image: "assets/image/banana.png",
      name: "Banana",
      TotalPrice: 6.24,
      price: 6.24,
      quantity: 1,
      description: "Bananas are rich in vitamins, minerals, fibre and simple sugar. They contain no fat. Bananas are a rich source of vitamin B6, vitamin A, folate, vitamin C, fibres, magnesium, potassium and carbohydrates.",
    ),
    HomeModel(
        image: "assets/image/broccoli.png",
        name: "Broccoli",
        price: 3.20,
        TotalPrice: 3.20,
        quantity: 1,
        description: "Broccoli is a great source of antioxidants and may enhance your health by reducing inflammation, improving blood sugar control, boosting immunity, and promoting heart health. Why Is Broccoli a Superfood? fiber, vitamin C, vitamin K, iron, and potassium."
    ),
    HomeModel(
      image: "assets/image/carrot.png",
      name: "Carrot",
      price: 1.50,
      TotalPrice: 1.50,
      quantity: 1,
      description: "They're rich in beta-carotene, a compound your body changes into vitamin A, which helps keep your eyes healthy. And beta-carotene helps protect your eyes from the sun and lowers your chances of cataracts and other eye problems. Yellow carrots have lutein, which is also good for your eyes.",
    ),
    HomeModel(
      image: "assets/image/kiwi.png",
      name: "Kiwi",
      price: 16.67,
      quantity: 1,
      TotalPrice: 16.67,
      description: "Kiwis are high in Vitamin C and dietary fiber and provide a variety of health benefits. This tart fruit can support heart health, digestive health, and immunity. The kiwi is a healthy choice of fruit and is rich with vitamins and antioxidants.",
    ),
    HomeModel(
      image: "assets/image/orange.png",
      name: "Orange",
      price: 3.84,
      TotalPrice: 3.84,
      quantity: 1,
      description: "Oranges are an excellent source of vitamin C. One orange offers 116.2 per cent of the daily value for vitamin C. Good intake of vitamin C is associated with a reduced risk of colon cancer as it helps to get of free radicals that cause damage to our DNA.",
    ),
    HomeModel(
      image: "assets/image/peppers.png",
      name: "Peppers",
      price: 13.80,
      TotalPrice: 13.80,
      quantity: 1,
      description: "Pepper is an antioxidant that provides anti-inflammatory and antimicrobial effects, among other health benefits. It may also boost brain function and increase levels of good cholesterol.",
    ),
    HomeModel(
      image: "assets/image/strawberry.png",
      name: "Strawberry",
      price: 18.90,
      TotalPrice: 18.90,
      quantity: 1,
      description: "A strawberry is actually a multiple fruit which consists of many tiny individual fruits embedded in a fleshy receptacle. The brownish or whitish specks, which are commonly considered seeds, are the true fruits, called achenes, and each of them surrounds a tiny seed.",
    ),
    HomeModel(
      image: "assets/image/watermelon.png",
      name: "Watermelon",
      price: 18.57,
      quantity: 1,
      TotalPrice: 18.57,
      description: "It has a very high water content and provides nutrients like lycopene,citrulline, and vitamins A and C.Studies suggest that this sweet, redmelon may even boost heart health, reduce muscle soreness, and decreaseinflammation, though more research is needed.",
    ),
  ].obs;
  RxList<HomeModel> CartList = <HomeModel>[].obs;
  Rx<HomeModel> h1 = HomeModel().obs;
  RxInt lenth = 0.obs;
  RxDouble? Totle_Price = 0.0.obs;
}