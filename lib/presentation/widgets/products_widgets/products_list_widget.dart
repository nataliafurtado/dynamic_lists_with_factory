import 'package:dynamic_lists_with_factory/presentation/controllers/controller.dart';
import 'package:dynamic_lists_with_factory/presentation/widgets/products_widgets/products_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({
    Key? key,
    required this.itemsIndex,
  }) : super(key: key);
  final int itemsIndex;

  @override
  Widget build(BuildContext context) {
    const space = 20.0;
    final Controller controller = GetIt.I.get<Controller>();
    final products = controller.getProductsListFromItems(itemsIndex);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      primary: false,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              products.length,
              (productsIndex) => RxBuilder(
                builder: (_) {
                  controller.getProducts(itemsIndex);
                  return ProductsCard(
                    productsIndex: productsIndex,
                    itemsIndex: itemsIndex,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: space),
        ],
      ),
    );
  }
}
