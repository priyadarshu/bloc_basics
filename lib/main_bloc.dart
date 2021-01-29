import 'package:bloc/bloc.dart';

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.decrement:
        yield state - 1;
        break;
    }
    throw UnimplementedError();
  }
}

Future<void> main(List<String> args) async {
  final bloc = CounterBloc();

  final streamSubscription = bloc.listen(print);
  // this subscribes to the bloc state stream and prints the state values emitted by it
  print(bloc.state); //!should print 0 => default state of the counter

  bloc.add(CounterEvent.increment); //should print 1
  bloc.add(CounterEvent.increment); //should print 2
  bloc.add(CounterEvent.increment); //should print 3
  bloc.add(CounterEvent.increment); //should print 4
  bloc.add(CounterEvent.decrement); //should print 3
  bloc.add(CounterEvent.increment); //should print 4

  await Future.delayed(Duration.zero);
  await streamSubscription.cancel();
  await bloc.close();
}
