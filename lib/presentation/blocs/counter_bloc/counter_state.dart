part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  final int counter;
  final int transactionCount;

  const CounterState({required this.counter, required this.transactionCount});

  @override
  List<Object> get props => [counter, transactionCount];
}

final class CounterInitial extends CounterState {
  const CounterInitial({super.counter = 0, super.transactionCount = 0});

  copyWith({int? counter, int? transactionCount}) => CounterInitial(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount,
  );
}
