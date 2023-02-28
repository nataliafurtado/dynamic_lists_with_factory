import 'package:dynamic_lists_with_factory/presentation/controllers/controller.dart';
import 'package:dynamic_lists_with_factory/presentation/widgets/items_widgets/items_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ItemsListWidget extends StatelessWidget {
  const ItemsListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller controller = GetIt.I.get<Controller>();

    return ListView.builder(
      itemCount: controller.getItems.length,
      padding: const EdgeInsets.only(top: 20),
      itemBuilder: (ctx, itemsIndex) {
        return ItemsCard(
          itemsIndex: itemsIndex,
        );
      },
    );
  }
}
