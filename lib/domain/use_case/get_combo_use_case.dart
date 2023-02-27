import 'package:Producdynamic_lists_with_factorytt/domain/entities/combo.dart';
import 'package:Producdynamic_lists_with_factorytt/domain/entities/item.dart';
import 'package:Producdynamic_lists_with_factorytt/domain/entities/product.dart';

class GetComboUseCase {
  Combo call() => Combo(
        itemFromApi: [
          Item(
            quantityShouldBeSelected: 3,
            productsFromApi: [
              Product(
                name: 'Perfume A',
                priceToPay: 50,
              ),
              Product(
                name: 'Perfume B',
                priceToPay: 60,
              ),
            ],
          ),
          Item(
            quantityShouldBeSelected: 2,
            productsFromApi: [
              Product(
                name: 'Batom A',
                priceToPay: 15,
              ),
              Product(
                name: 'Batom B',
                priceToPay: 10,
              ),
              Product(
                name: 'Batom c',
                priceToPay: 10,
              ),
              Product(
                name: 'Batom d',
                priceToPay: 10,
              ),
            ],
          ),
          Item(
            quantityShouldBeSelected: 4,
            productsFromApi: [
              Product(
                name: 'Creme A',
                priceToPay: 50,
              ),
              Product(
                name: 'Creme b',
                priceToPay: 40,
              ),
            ],
          ),
        ],
      );
}
