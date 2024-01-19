// main.dart
import 'package:exclusive_details_and_restorations/const/cart_controller.dart';
import 'package:exclusive_details_and_restorations/views/about_view.dart';
import 'package:exclusive_details_and_restorations/views/cart_view.dart';
import 'package:exclusive_details_and_restorations/views/checkout_view.dart';
import 'package:exclusive_details_and_restorations/views/gallery_view.dart';
import 'package:exclusive_details_and_restorations/views/home_view.dart';
import 'package:exclusive_details_and_restorations/views/service_areas.dart';
import 'package:exclusive_details_and_restorations/views/services.dart';
import 'package:exclusive_details_and_restorations/views/shop.dart';
import 'package:exclusive_details_and_restorations/views/signup_view.dart';
import 'package:exclusive_details_and_restorations/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(CartController());
      }),
      routes: {
        '/': (context) => const SplashScreen(),
        'home': (context) => const HomeScreen(),
        'about': (context) => const AboutView(),
        'serviceAreas': (context) => const ServiceAreasView(),
        'gallery': (context) => const GalleryView(),
        'services': (context) => const ServicesView(),
        'shop': (context) => EcommerceTest(),
        'cart': (context) => CartScreen(),
        'checkout': (context) => CheckoutScreen(),
        'signup': (context) => const signUpView(),
      },
    );
  }
}
