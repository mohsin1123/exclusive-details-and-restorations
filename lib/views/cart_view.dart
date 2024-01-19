import 'package:exclusive_details_and_restorations/views/checkout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:exclusive_details_and_restorations/const/cart_controller.dart';
import 'package:exclusive_details_and_restorations/const/text.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    print('CartScreen rebuilt');
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
            text: "Cart",
            color: Colors.white,
          ),
          actions: [
            SizedBox(
              width: 100,
              child: Image.asset("assets/images/exclusive-details-rename.png"),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartController.cartItems.length,
                    itemBuilder: (context, index) {
                      var item = cartController.cartItems[index];
                      return ListTile(
                        title: CustomText(text: item.productName),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: "\$${item.price}"),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // Decrease quantity
                                    cartController.decreaseQuantity(item);
                                  },
                                  child: const Icon(Icons.remove),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: CustomText(
                                      text: item.quantity.toString()),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Increase quantity
                                    cartController.increaseQuantity(item);
                                  },
                                  child: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: "Total: ",
                      size: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    CustomText(
                      text:
                          "\$${cartController.totalAmount.toStringAsFixed(2)}",
                      size: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.red.shade800)),
                  onPressed: () {
                    Get.to(() => CheckoutScreen());
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomText(
                      text: "Proceed to Checkout",
                      size: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
