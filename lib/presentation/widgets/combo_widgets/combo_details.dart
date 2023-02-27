import 'package:Producdynamic_lists_with_factorytt/presentation/controllers/controller.dart';
import 'package:Producdynamic_lists_with_factorytt/utils/constants.dart';
import 'package:Producdynamic_lists_with_factorytt/presentation/widgets/add_quantity_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ComboDetails extends StatelessWidget {
  const ComboDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller controller = GetIt.I.get<Controller>();
    return RxBuilder(
      builder: (_) {
        return Column(
          children: [
            const SizedBox(height: space),
            const Text(
              'Quantidade de Combos',
            ),
            const SizedBox(height: space),
            AddQuantityWidget(
              onClick: controller.changeQuantityOfCombos,
              quantity: controller.getQuantityOfCombos,
            ),
            const SizedBox(height: space),
            Text(
              'Total de produtos a selecionar ${controller.getQuantityProductsShouldBeSelected()}',
            ),
            Text(
              'Total de produtos selecionados ${controller.getQuantityProductsSelected()}',
            ),
            Text(
              'Total a pagar dos produtos selecionado ${controller.getTotalToPaySelected()}',
            ),
            const SizedBox(height: space),
          ],
        );
      },
    );
  }
}
