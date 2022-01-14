import 'package:flutter/material.dart';
import 'package:shop/core/providers/counter.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = CounterProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Exemplo contador')),
      ),
      body: Column(
        children: [
          Text(provider?.state.value.toString() ?? '0'),
          IconButton(
            onPressed: () {
              setState(() {
                provider?.state.inc();
              });
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                provider?.state.dec();
              });
            },
            icon: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
