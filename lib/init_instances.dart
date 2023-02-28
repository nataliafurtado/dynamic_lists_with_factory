import 'package:dynamic_lists_with_factory/domain/entities/product.dart';
import 'package:dynamic_lists_with_factory/domain/use_case/get_combo_use_case.dart';
import 'package:dynamic_lists_with_factory/presentation/controllers/view_controller.dart';
import 'package:dynamic_lists_with_factory/presentation/controllers/item_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_notifier/rx_notifier.dart';

initInstances() {
  GetIt.I.registerSingleton<ViewController>(
    ViewController(
      getComboUseCase: GetComboUseCase(),
    ),
  );

  GetIt.I.registerFactoryParam<ItemController, int, RxList<Product>>(
    (
      quantityShouldBeSelected,
      products,
    ) =>
        ItemController(
      products: products,
      quantityShouldBeSelected: quantityShouldBeSelected,
    ),
  );
}
