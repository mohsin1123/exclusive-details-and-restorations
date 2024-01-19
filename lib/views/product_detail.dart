// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exclusive_details_and_restorations/const/cart_controller.dart';
import 'package:exclusive_details_and_restorations/models/cart_model.dart';
import 'package:exclusive_details_and_restorations/views/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:exclusive_details_and_restorations/const/text.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:html/parser.dart' as html_parser;

class ProductDetailView extends StatelessWidget {
  final String? text;
  final String? category;
  final String? desc;
  final String? price;
  final String? img;
  const ProductDetailView({
    Key? key,
    this.text,
    this.img,
    this.category,
    this.desc,
    this.price,
  }) : super(key: key);
  void addToCart() {
    CartItem newItem = CartItem(
      productId: text!,
      productName: text!,
      price: double.parse(price!),
      quantity: 1,
    );

    Get.find<CartController>().addItem(newItem);
    Get.snackbar('All Done!', 'Product added to the cart',
        backgroundColor: Colors.red.shade800, colorText: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    String plainText = html_parser.parse(desc).body!.text;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromRGBO(0, 40, 70, 100),
            Colors.red.shade900,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 40, 70, 100),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromRGBO(0, 40, 70, 100),
          title: const CustomText(
            text: "Buy now",
            color: Colors.white,
          ),
          actions: [
            SizedBox(
              width: 100,
              child: Image.asset("assets/images/exclusive-details-rename.png"),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(img!),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomText(
                  text: text!,
                  color: Colors.white,
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    const CustomText(
                      text: "Category: ",
                      color: Colors.white,
                      size: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: category!,
                      color: Colors.white,
                      size: 12,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: CustomText(
                  text: "Description: ",
                  color: Colors.white,
                  size: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomText(
                  text: plainText,
                  color: Colors.white,
                  size: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.black)),
                      onPressed: () {
                        Get.to(() => CartScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          text: "Check out" + " \$" + price!,
                          size: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Colors.red.shade800)),
                      onPressed: addToCart,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          text: "Add to cart" + " \$" + price!,
                          size: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
