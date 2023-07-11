import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/presentation/blocs/counter_bloc/counter_bloc.dart';



class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (_) => CounterBloc(),
      child: const BlocCounterView());
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });


  void increaseCounterBy(BuildContext context, [int value = 1]){
    context.read<CounterBloc>()
    .add(CounterIncreased(value));

  }

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterBloc>().state;
    return Scaffold(
      appBar: AppBar(
       title:  Text('BLoC Counter: ${counterState.transactionCount} '),
        actions: [
          IconButton(
            onPressed: (){
              context.read<CounterBloc>().add(CounterReset());
            }, 
          icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body:  Center(
        child: context.select((CounterBloc counterBloc) => Text('Counter Value: ${counterBloc.state.counter}')),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed:() => increaseCounterBy(context,3),
          heroTag: '1',
          child: const Text('+3'),
          ),
          const SizedBox(height: 15,
          ),
          FloatingActionButton(
            onPressed:() => increaseCounterBy(context,2),
          heroTag: '2',
          child: const Text('+2'),
          ),
          const SizedBox(height: 15,
          ),
          FloatingActionButton(
            onPressed:() => increaseCounterBy(context),
          heroTag: '3',
          child: const Text('+1'),
          ),
          
        ],
      ),
      
    );
  }
}