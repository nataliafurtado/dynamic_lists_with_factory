import 'package:dynamic_lists_with_factory/presentation/controllers/view_controller.dart';
import 'package:dynamic_lists_with_factory/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:dynamic_lists_with_factory/presentation/widgets/add_quantity_widget.dart';
import 'package:get_it/get_it.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard({
    Key? key,
    required this.productsIndex,
    required this.itemsIndex,
  }) : super(key: key);
  final int productsIndex;
  final int itemsIndex;
  @override
  Widget build(BuildContext context) {
    final ViewController controller = GetIt.I.get<ViewController>();
    final products = controller.getProductsListFromItems(itemsIndex);
    return Container(
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        border: Border.all(
          color: Colors.blueAccent,
        ),
      ),
      child: Column(
        children: [
          AddQuantityWidget(
            onClick: (newQuantity) {
              controller.changeQuantityOfProduct(
                itemsIndex,
                productsIndex,
                newQuantity,
              );
            },
            quantity: products[productsIndex].quantity,
          ),
          const SizedBox(height: space),
          Text(products[productsIndex].name),
          const SizedBox(width: space),
        ],
      ),
    );
  }
}
