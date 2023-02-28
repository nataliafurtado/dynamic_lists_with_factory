import 'package:dynamic_lists_with_factory/presentation/controllers/controller.dart';
import 'package:dynamic_lists_with_factory/utils/constants.dart';
import 'package:dynamic_lists_with_factory/presentation/widgets/combo_widgets/button_widget.dart';
import 'package:dynamic_lists_with_factory/presentation/widgets/combo_widgets/combo_details.dart';
import 'package:dynamic_lists_with_factory/presentation/widgets/items_widgets/items_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ComboWidget extends StatelessWidget {
  const ComboWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller controller = GetIt.I.get<Controller>();

    return RxBuilder(
      builder: (_) {
        if (controller.getCombo.items.isEmpty) {
          return const SizedBox.shrink();
        }

        return Container(
          color: Colors.blueGrey.shade50,
          child: Column(
            children: const [
              ComboDetails(),
              Expanded(
                child: ItemsListWidget(),
              ),
              SizedBox(height: 10),
              ButtonWidget(),
              SizedBox(height: space),
            ],
          ),
        );
      },
    );
  }
}
