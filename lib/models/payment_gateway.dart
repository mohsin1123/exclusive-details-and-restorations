import 'package:exclusive_details_and_restorations/const/cart_controller.dart';
import 'package:exclusive_details_and_restorations/views/widgets/paypal_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_api/woocommerce_api.dart';

class WooCommerceService {
  final WooCommerceAPI _wooCommerce = WooCommerceAPI(
    url: "https://exclusive-details.com/wp-json/wc/v3/orders",
    consumerKey: "ck_d61953caad0c6c99ca5d42ea8c47ce579d1d037c",
    consumerSecret: "cs_e2474096c2361bcaae48810631a3a6d4b3b44cf4",
  );

  Future<void> placeOrder(BuildContext context) async {
    // Get the cart items
    final cartController = Get.find<CartController>();
    final cartItems = cartController.cartItems;

    // Create an order payload
    final orderPayload = {
      "payment_method": "PayPal", // Replace with your preferred payment method
      "payment_method_title": "PayPal",
      "set_paid": false,
      "line_items": cartItems.map((item) {
        return {
          "product_id": item.productId,
          "quantity": item.quantity,
        };
      }).toList(),
      "payment_details": {
        "method_id": "PayPal",
        "method_title": "PayPal",
        // Add additional PayPal-specific details as needed
        // For example:
        // "paypal_payer_id": "payer_id",
        // "paypal_payer_email": "payer_email",
      },
    };

    try {
      // Place the order
      final response = await _wooCommerce.postAsync("orders", orderPayload);

      // Handle the order response as needed
      print('Order placed successfully: ${response['id']}');

      // Get the PayPal URL from the order response (replace 'paypalUrl' with the actual key)
      final paypalUrl = response['https://www.paypal.com/'] as String?;

      if (paypalUrl != null) {
        // Open the PayPal payment screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PayPalPaymentScreen(paypalUrl: paypalUrl),
          ),
        );
      } else {
        print('PayPal URL is null or invalid');
      }
    } catch (e) {
      print('Error placing order: $e');
    }
  }
}
