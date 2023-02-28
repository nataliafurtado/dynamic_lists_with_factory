import 'package:dynamic_lists_with_factory/domain/entities/product.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ItemController {
  ItemController({
    required this.quantityShouldBeSelected,
    required this.products,
  });

  int quantityShouldBeSelected;
  final RxList<Product> products;
}
