import 'package:Producdynamic_lists_with_factorytt/domain/entities/product.dart';
import 'package:Producdynamic_lists_with_factorytt/presentation/controllers/combo_controller.dart';
import 'package:Producdynamic_lists_with_factorytt/presentation/controllers/controller.dart';
import 'package:Producdynamic_lists_with_factorytt/presentation/controllers/item_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_notifier/rx_notifier.dart';

initInstances() {
  GetIt.I.registerSingleton<Controller>(
    Controller(),
  );

  GetIt.I.registerFactory<ComboController>(
    () => ComboController(),
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
