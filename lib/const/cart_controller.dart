// controllers/cart_controller.dart
import 'package:exclusive_details_and_restorations/models/cart_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<CartItem> cartItems = <CartItem>[].obs;

  void addItem(CartItem newItem) {
    int existingIndex = cartItems.indexWhere(
      (item) => item.productName == newItem.productName,
    );

    if (existingIndex != -1) {
      cartItems[existingIndex].quantity += 1;
      cartItems.refresh();
    } else {
      cartItems.add(newItem);
    }
  }

  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity -= 1;
      cartItems.refresh();
    } else {
      cartItems.remove(item);
    }
  }

  void increaseQuantity(CartItem item) {
    if (item.quantity > 0) {
      item.quantity += 1;
      cartItems.refresh();
    } else {
      cartItems.remove(item);
    }
  }

  void clearCart() {
    cartItems.clear();
  }

  double get totalAmount {
    return cartItems.fold(0, (sum, item) => sum + item.totalPrice);
  }
}
