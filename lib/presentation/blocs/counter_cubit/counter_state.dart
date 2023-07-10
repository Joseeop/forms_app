part of 'counter_cubit.dart';


class CounterState extends Equatable {
  final int counter;
  final int transactionCount;

  const CounterState({
    this.counter =0, 
    this.transactionCount=0});


    copyWith({
      int? counter,
      int?transactionCount
    }) => CounterState(
      counter: counter ?? this.counter,
      transactionCount: transactionCount?? this.transactionCount
    );
    
      @override
      //Campos a considerar, si tienen lo mismo es que son iguales.
      List<Object> get props => [counter,transactionCount];
}