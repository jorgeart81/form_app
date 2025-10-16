import 'package:flutter/material.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cubic counter'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.refresh_rounded)),
        ],
      ),
      body: Center(child: const Text('Counter value')),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 15,
        children: [
          FloatingActionButton(
            heroTag: 1,
            child: const Text('+3'),
            onPressed: () {},
          ),
          FloatingActionButton(
            heroTag: 2,
            child: const Text('+2'),
            onPressed: () {},
          ),
          FloatingActionButton(
            heroTag: 3,
            child: const Text('+1'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
