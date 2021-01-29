Stream<int> boatStream() async* {
  for (int i = 0; i <= 10; i++) {
    print("Sent boat no:" + i.toString());
    await Future.delayed(Duration(seconds: 2));
    yield i;
  }
}

void main(List<String> args) async {
  Stream<int> stream = boatStream();

  stream.listen((recievedData) {
    print("Recieved boat no. " + recievedData.toString());
  });
}
