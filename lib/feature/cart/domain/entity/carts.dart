class Cart {
  Cart({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  int id;
  List<ProductElement> products;
  int total;
  int discountedTotal;
  int userId;
  int totalProducts;
  int totalQuantity;
}

class ProductElement {
  ProductElement({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedPrice,
  });

  int id;
  String title;
  int price;
  int quantity;
  int total;
  double discountPercentage;
  int discountedPrice;
}
