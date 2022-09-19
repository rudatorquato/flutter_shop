import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/badge/widget/badge_widget.dart';
import 'package:shop/cart/models/cart/cart.dart';
import 'package:shop/core/routes/app_routes.dart';
import 'package:shop/product/widget/product_grid/product_grid.dart';

enum FilterOptions {
  favorite,
  all,
}

class ProductOverviewWidget extends StatefulWidget {
  const ProductOverviewWidget({Key? key}) : super(key: key);

  @override
  State<ProductOverviewWidget> createState() => _ProductOverviewWidgetState();
}

class _ProductOverviewWidgetState extends State<ProductOverviewWidget> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Minha Loja',
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Somente Favoritos'),
                value: FilterOptions.favorite,
              ),
              const PopupMenuItem(
                child: Text('Todos'),
                value: FilterOptions.all,
              ),
            ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.favorite) {
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
              });
            },
          ),
          Consumer<Cart>(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CART);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
            builder: (ctx, cart, child) => BadgeWidget(
              value: cart.itemsCount.toString(),
              child: child!,
            ),
          ),
        ],
      ),
      body: ProductGridWidget(_showFavoriteOnly),
    );
  }
}
