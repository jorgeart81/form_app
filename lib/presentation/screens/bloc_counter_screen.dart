import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  void _increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(CounterIncreased(value));
  }

  void _resetCounter(BuildContext context) {
    context.read<CounterBloc>().add(CounterReset());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (CounterBloc counterBloc) =>
              Text('Bloc counter ${counterBloc.state.transactionCount}'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _resetCounter(context);
            },
            icon: Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: context.select(
        (CounterBloc counterBloc) => Center(
          child: Text(
            'Counter value: ${counterBloc.state.counter}',
            style: const TextStyle(fontSize: 18, color: Colors.black87),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 15,
        children: [
          FloatingActionButton(
            heroTag: 1,
            child: const Text('+3'),
            onPressed: () {
              _increaseCounterBy(context, 3);
            },
          ),
          FloatingActionButton(
            heroTag: 2,
            child: const Text('+2'),
            onPressed: () {
              _increaseCounterBy(context, 2);
            },
          ),
          FloatingActionButton(
            heroTag: 3,
            child: const Text('+1'),
            onPressed: () {
              _increaseCounterBy(context);
            },
          ),
        ],
      ),
    );
  }
}
