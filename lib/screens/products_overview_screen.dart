import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/badge.dart';
import 'package:shop_app/widgets/product_grid.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

enum FilterOptions {
  // ignore: constant_identifier_names
  Favorites,
  // ignore: constant_identifier_names
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('ShopApp'),
        actions: [
          PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    showFavoritesOnly = true;
                  } else {
                    showFavoritesOnly = false;
                  }
                });
              },
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: FilterOptions.Favorites,
                    child: Text('Only Favorites'),
                  ),
                  const PopupMenuItem(
                    value: FilterOptions.All,
                    child: Text('Show All'),
                  ),
                ];
              }),
          Consumer<Cart>(
            builder: (context, cart, child) {
              return CartBadge(
                value: cart.itemCount,
                color: const Color.fromARGB(241, 226, 72, 87),
                child: child!,
              );
            },
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: ProductGrid(showFavoritesOnly, productData),
    );
  }
}













/*
When u are using the ChangeNotifierProvider, u can use the .value approach if the value your getting from the class does not depend on any context.
If u are working with something that is part of a list or grid, using the .value approach is a must.
And also if u creating a new object based on the provider class like the way we are doing it in the main.dart, u would have to use create approach in order to avoid bugs.
 */