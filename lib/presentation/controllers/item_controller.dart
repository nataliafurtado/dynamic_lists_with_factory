import 'package:Producdynamic_lists_with_factorytt/domain/entities/product.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ItemController {
  ItemController({
    required this.quantityShouldBeSelected,
    required this.products,
  });

  int quantityShouldBeSelected;
  final RxList<Product> products;
}

class ItemViewModel {
  int quantityShouldBeSelected;
  ItemViewModel({
    required this.quantityShouldBeSelected,
  });
}
