import 'package:dynamic_lists_with_factory/domain/entities/item.dart';
import 'package:dynamic_lists_with_factory/domain/entities/product.dart';
import 'package:dynamic_lists_with_factory/domain/use_case/get_combo_use_case.dart';
import 'package:dynamic_lists_with_factory/presentation/controllers/combo_controller.dart';
import 'package:dynamic_lists_with_factory/presentation/controllers/item_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ViewController {
  ViewController({
    required this.getComboUseCase,
  });
  final GetComboUseCase getComboUseCase;

  late ComboController comboController = ComboController();

  int get getQuantityOfCombos => comboController.quantityOfCombos.value;

  ComboController get getCombo => comboController;

  RxList<ItemController> get getItems => comboController.items;

  RxList<Product> getProductsListFromItems(int itemsIndex) {
    return comboController.items[itemsIndex].products;
  }

  RxList<Product> getProducts(int itemIdex) =>
      comboController.items[itemIdex].products;

  ItemController getItem(int itemIdex) => comboController.items[itemIdex];

  void init() {
    final combo = getComboUseCase();
    comboController.items.addAll(
      combo.itemFromApi.map(
        (itemFromApi) {
          return itemToItemController(
            itemFromApi,
          );
        },
      ).toList(),
    );
  }

  ItemController itemToItemController(Item itemFromApi) {
    return GetIt.I.get<ItemController>(
      param1: itemFromApi.quantityShouldBeSelected,
      param2: RxList<Product>(
        itemFromApi.productsFromApi,
      ),
    );
  }

  void changeQuantityOfCombos(int newQuantity) {
    comboController.quantityOfCombos.value = newQuantity;
  }

  void changeQuantityOfProduct(
      int itemIdex, int productIndex, int newQuantity) {
    comboController.items[itemIdex].products[productIndex] =
        comboController.items[itemIdex].products[productIndex].copyWith(
      quantity: newQuantity,
    );
  }

  int getQuantityItemsShouldBeSelected(itemsIndex) {
    return comboController.items[itemsIndex].quantityShouldBeSelected *
        getQuantityOfCombos;
  }

  int getQuantityItemsSelected(itemsIndex) {
    return comboController.items[itemsIndex].products
        .map(
          (product) => product.quantity,
        )
        .reduce(
          (value, current) => value + current,
        );
  }

  int getQuantityProductsShouldBeSelected() {
    final totalOfProductsByCombo = comboController.items
        .map(
          (item) => item.quantityShouldBeSelected,
        )
        .reduce(
          (value, current) => value + current,
        );

    return totalOfProductsByCombo * comboController.quantityOfCombos.value;
  }

  int getQuantityProductsSelected() {
    return comboController.items
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
    return comboController.items
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

  bool isAllProductsSelected() {
    bool isAllSelected = true;
    for (var i = 0; i < comboController.items.length; i++) {
      final qtdShouldBeSelected =
          comboController.items[i].quantityShouldBeSelected *
              getQuantityOfCombos;

      final qtdSelected = comboController.items[i].products
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
    return isAllSelected;
  }
}
