// checkout_screen.dart
import 'package:exclusive_details_and_restorations/models/payment_gateway.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:exclusive_details_and_restorations/const/cart_controller.dart';
import 'package:exclusive_details_and_restorations/const/text.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Checkout",
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => Column(
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
                            CustomText(text: "Quantity: ${item.quantity}"),
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
                    CustomText(
                      text: "Total: ",
                      size: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text:
                          "\$${cartController.totalAmount.toStringAsFixed(2)}",
                      size: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    // Implement the checkout logic here
                    await WooCommerceService().placeOrder(context);
                    // Clear the cart after checkout
                    cartController.clearCart();

                    // Close the checkout screen
                    Get.back();

                    // Show a success message
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomText(
                      text: "Complete Purchase",
                      size: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
