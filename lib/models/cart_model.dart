// models/cart_model.dart
class CartItem {
  final String productId;
  final String productName;
  final double price;
  int quantity;

  CartItem({
    required this.productId,
    required this.productName,
    required this.price,
    required this.quantity,
  });

  double get totalPrice => price * quantity;

  void increaseQuantity() {
    quantity += 1;
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }
}
