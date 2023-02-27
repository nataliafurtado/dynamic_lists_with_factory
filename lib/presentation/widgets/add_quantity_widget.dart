import 'package:flutter/material.dart';

class AddQuantityWidget extends StatelessWidget {
  const AddQuantityWidget({
    Key? key,
    this.quantity = 0,
    required this.onClick,
  }) : super(key: key);
  final int quantity;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      height: 40,
      width: 110,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => onClick(quantity - 1),
            icon: const Icon(Icons.remove),
          ),
          Text(quantity.toString()),
          IconButton(
            onPressed: () => onClick(quantity + 1),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
