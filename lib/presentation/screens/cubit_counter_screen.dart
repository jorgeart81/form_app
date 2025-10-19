import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: _CubicCounterView(),
    );
  }
}

class _CubicCounterView extends StatelessWidget {
  const _CubicCounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();
    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (CounterCubit cubit) =>
              Text('Cubic counter: ${cubit.state.transactionCount}'),
        ),
        actions: [
          IconButton(
            onPressed: () => counterCubit.reset(),
            icon: Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: BlocBuilder<CounterCubit, CounterState>(
        // buildWhen: (previous, current) => current.counter != previous.counter,
        builder: (context, state) {
          return Center(
            child: Text(
              'Counter value: ${state.counter}',
              style: const TextStyle(fontSize: 18, color: Colors.black87),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 15,
        children: [
          FloatingActionButton(
            heroTag: 1,
            child: const Text('+3'),
            onPressed: () => counterCubit.increment(3),
          ),
          FloatingActionButton(
            heroTag: 2,
            child: const Text('+2'),
            onPressed: () => counterCubit.increment(2),
          ),
          FloatingActionButton(
            heroTag: 3,
            child: const Text('+1'),
            onPressed: () => counterCubit.increment(1),
          ),
        ],
      ),
    );
  }
}
