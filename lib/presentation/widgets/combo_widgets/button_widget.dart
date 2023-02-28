import 'package:dynamic_lists_with_factory/presentation/controllers/controller.dart';
import 'package:dynamic_lists_with_factory/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (_) {
        final Controller controller = GetIt.I.get<Controller>();
        final combo = controller.getCombo;
        final quantityOfCombos = controller.getQuantityOfCombos;
        bool isAllSelected = true;

        for (var i = 0; i < combo.items.length; i++) {
          final qtdShouldBeSelected =
              combo.items[i].quantityShouldBeSelected * quantityOfCombos;

          final qtdSelected = combo.items[i].products
              .map(
                (prod) => prod.quantity,
              )
              .reduce(
                (value, current) => value + current,
              );
          if (qtdSelected < qtdShouldBeSelected) {
            isAllSelected = false;
          }
        }

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: space),
          width: double.infinity,
          child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(
                isAllSelected ? Colors.blue : Colors.grey,
              ),
            ),
            onPressed: () {},
            child:
                Text(isAllSelected ? 'Botão liberado' : 'Botão desabilitado'),
          ),
        );
      },
    );
  }
}
