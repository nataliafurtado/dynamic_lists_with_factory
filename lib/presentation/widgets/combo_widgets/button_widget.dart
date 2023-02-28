import 'package:dynamic_lists_with_factory/presentation/controllers/view_controller.dart';
import 'package:dynamic_lists_with_factory/presentation/widgets/combo_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (_) {
        final ViewController controller = GetIt.I.get<ViewController>();
        bool isAllProductsSelected = controller.isAllProductsSelected();
        return PrimaryButton(
          buttonColor: isAllProductsSelected ? Colors.blue : Colors.grey,
          text: isAllProductsSelected ? 'Botão liberado' : 'Botão desabilitado',
        );
      },
    );
  }
}
