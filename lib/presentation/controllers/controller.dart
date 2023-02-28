import 'package:dynamic_lists_with_factory/domain/entities/combo.dart';
import 'package:dynamic_lists_with_factory/domain/entities/item.dart';
import 'package:dynamic_lists_with_factory/domain/entities/product.dart';
import 'package:dynamic_lists_with_factory/domain/use_case/get_combo_use_case.dart';
import 'package:dynamic_lists_with_factory/presentation/controllers/combo_controller.dart';
import 'package:dynamic_lists_with_factory/presentation/controllers/item_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_notifier/rx_notifier.dart';

class Controller {
  final comboController = RxNotifier<ComboController?>(null);
  final quantityOfCombos = RxNotifier<int>(1);

  int get getQuantityOfCombos => quantityOfCombos.value;

  ComboController get getCombo => comboController.value!;

  RxList<ItemController> get getItems => comboController.value!.items;

  RxList<Product> getProductsListFromItems(int itemsIndex) {
    return comboController.value!.items[itemsIndex].products;
  }

  RxList<Product> getProducts(int itemIdex) =>
      comboController.value!.items[itemIdex].products;

  ItemController getItem(int itemIdex) =>
      comboController.value!.items[itemIdex];

  init() {
    final combo = GetComboUseCase()();
    createObservables(combo);
  }

  createObservables(Combo combo) {
    final newComboController = GetIt.I.get<ComboController>();

    newComboController.items.addAll(
      combo.itemFromApi.map(
        (itemFromApi) {
          return itemToItemController(
            itemFromApi,
          );
        },
      ).toList(),
    );

    comboController.value = newComboController;
  }

  ItemController itemToItemController(Item itemFromApi) {
    return GetIt.I.get<ItemController>(
      param1: itemFromApi.quantityShouldBeSelected,
      param2: RxList<Product>(
        itemFromApi.productsFromApi,
      ),
    );
  }

  changeQuantityOfCombos(int newQuantity) {
    quantityOfCombos.value = newQuantity;
  }

  changeQuantityOfProduct(int itemIdex, int productIndex, int newQuantity) {
    comboController.value!.items[itemIdex].products[productIndex] =
        comboController.value!.items[itemIdex].products[productIndex]
            .copyWith(quantity: newQuantity);
  }

  int getQuantityItemsShouldBeSelected(itemsIndex) {
    return comboController.value!.items[itemsIndex].quantityShouldBeSelected *
        getQuantityOfCombos;
  }

  int getQuantityProductsShouldBeSelected() {
    final totalOfProductsByCombo = comboController.value!.items
        .map(
          (item) => item.quantityShouldBeSelected,
        )
        .reduce(
          (value, current) => value + current,
        );

    return totalOfProductsByCombo * quantityOfCombos.value;
  }

  int getQuantityItemsSelected(itemsIndex) {
    return comboController.value!.items[itemsIndex].products
        .map(
          (product) => product.quantity,
        )
        .reduce(
          (value, current) => value + current,
        );
  }

  int getQuantityProductsSelected() {
    return comboController.value!.items
        .map(
          (item) => item.products.map(
            (product) {
              return product.quantity;
            },
          ).reduce(
            (value, current) => value + current,
          ),
        )
        .reduce(
          (value, current) => value + current,
        );
  }

  double getTotalToPaySelected() {
    return comboController.value!.items
        .map(
          (item) => item.products.map(
            (product) {
              return product.priceToPay * product.quantity;
            },
          ).reduce(
            (value, current) => value + current,
          ),
        )
        .reduce(
          (value, current) => value + current,
        );
  }
}
