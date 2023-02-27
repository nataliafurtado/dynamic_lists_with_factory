import 'package:Producdynamic_lists_with_factorytt/domain/entities/product.dart';

class Item {
  List<Product> productsFromApi;
  int quantityShouldBeSelected;
  Item({
    required this.productsFromApi,
    required this.quantityShouldBeSelected,
  });
}
