import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }
}

Future<void> main(List<String> args) async {
  final cubit = CounterCubit();

  //cubit.close();

  final streamSubscription = cubit.listen(print);
  // this subscribes to the cubit state stream and prints the state values emitted by it
  print(cubit.state); //!should print 0 => default state of the counter
  cubit.increment();
  print(cubit.state); //! should print 1
  cubit.decrement();
  print(cubit.state); //!should print 0
  cubit.increment();
  print(cubit.state); //!should print 1
  cubit.increment();
  print(cubit.state); // should print 2
  cubit.decrement();
  print(cubit.state); //should print 1
  print("Subscription data goes here :");
  await Future.delayed(Duration.zero);
  await streamSubscription.cancel();
  await cubit.close();
}
