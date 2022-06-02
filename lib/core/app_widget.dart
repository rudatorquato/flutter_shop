import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/cart/models/cart.dart';
import 'package:shop/core/routes/app_routes.dart';
import 'package:shop/product/models/product_list/product_list.dart';
import 'package:shop/product/widget/product_detail/product_detail_widget.dart';

import 'package:shop/product/widget/products_overview/products_overview_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      fontFamily: 'Lato',
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: Colors.purple,
            secondary: Colors.deepOrange,
          ),
        ),
        home: const ProductOverviewWidget(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx) => const ProductDetailWidget(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
