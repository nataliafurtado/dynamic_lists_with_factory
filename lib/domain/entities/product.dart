class Product {
  String name;
  double priceToPay;

  int quantity;
  Product({
    required this.name,
    required this.priceToPay,
    this.quantity = 0,
  });

  Product copyWith({
    String? name,
    double? priceToPay,
    int? quantity,
  }) {
    return Product(
      name: name ?? this.name,
      priceToPay: priceToPay ?? this.priceToPay,
      quantity: quantity ?? this.quantity,
    );
  }
}
