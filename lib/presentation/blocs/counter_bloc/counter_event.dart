part of 'counter_bloc.dart';

//Qué tipos de eventos vamos a recibir
abstract class CounterEvent  {
  const CounterEvent();

  
}

class CounterIncreased extends CounterEvent{
  final int value;
  
  const CounterIncreased(this.value);
}

//CounterReset

class CounterReset extends CounterEvent{}