import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:dynamic_lists_with_factory/presentation/controllers/controller.dart';
import 'package:dynamic_lists_with_factory/utils/constants.dart';
import 'package:dynamic_lists_with_factory/presentation/widgets/products_widgets/products_list_widget.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ItemsCard extends StatelessWidget {
  const ItemsCard({
    Key? key,
    required this.itemsIndex,
  }) : super(key: key);
  final int itemsIndex;

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (_) {
        final Controller controller = GetIt.I.get<Controller>();
        controller.getQuantityOfCombos;
        controller.getItem(itemsIndex);
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: space),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  'Selecionado ${controller.getQuantityItemsSelected(itemsIndex)} de  ${controller.getQuantityItemsShouldBeSelected(itemsIndex)}',
                ),
              ),
              const SizedBox(height: space),
              ProductsListWidget(
                itemsIndex: itemsIndex,
              ),
            ],
          ),
        );
      },
    );
  }
}
