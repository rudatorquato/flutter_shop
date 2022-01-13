import 'package:flutter/material.dart';
import 'package:shop/product/widget/products_overview/products_overview_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      fontFamily: 'Lato',
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.deepOrange,
        ),
      ),
      home: ProductOverviewWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}
