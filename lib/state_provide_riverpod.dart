import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// variable will be changed
final StateProvider<int> counterProvider = StateProvider<int>(
  (ref) => 0,
);

class StateProvide extends ConsumerWidget {
  const StateProvide({super.key});

  


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final count = ref.watch(counterProvider); // return the value in prover and rebuild when it changed

    ref.watch(counterProvider.notifier).state= 5; // add new value to provider
    return Text('$count');
  }
}
