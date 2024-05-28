import 'package:flutter/material.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widgets/product_item.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductGrid extends StatefulWidget {
  final Products productData;
  final bool showFavorites;
  const ProductGrid(this.showFavorites, this.productData, {super.key});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  @override
  Widget build(BuildContext context) {
    List<Product> fetchedProduct = widget.productData.items;
    final products = widget.showFavorites
        ? widget.productData.listOfFavItems
        : fetchedProduct;

    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
              value: products[index], child: const ProductItem());
        });
  }
}
