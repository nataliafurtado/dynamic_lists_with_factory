import 'package:dynamic_lists_with_factory/domain/entities/product.dart';

class Item {
  List<Product> productsFromApi;
  int quantityShouldBeSelected;
  Item({
    required this.productsFromApi,
    required this.quantityShouldBeSelected,
  });
}
