import 'package:dynamic_lists_with_factory/presentation/controllers/item_controller.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ComboController {
  final quantityOfCombos = RxNotifier<int>(1);
  final items = RxList<ItemController>([]);
}
