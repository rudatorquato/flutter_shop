import 'package:flutter/material.dart';
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
          )
        ],
      ),
      body: ProductGridWidget(_showFavoriteOnly),
    );
  }
}
