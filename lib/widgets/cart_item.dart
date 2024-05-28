import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItemDescription extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;
  final String itemKey;
  const CartItemDescription(
      this.id, this.price, this.quantity, this.title, this.itemKey,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    String totalAmount = (quantity * price).toStringAsFixed(2);
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: itemBackground(),
      onDismissed: (_) => cart.removeItem(itemKey), 
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: FittedBox(
                  child: Text(
                    '\$$price',
                  ),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: $totalAmount'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }

  Widget itemBackground() {
    return Container(
      alignment: Alignment.centerRight,
      color: Colors.red,
      child: const Padding(
        padding: EdgeInsets.only(
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.delete,
              size: 20,
              color: Colors.white,
            ),
            Text(
              'Delete',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
