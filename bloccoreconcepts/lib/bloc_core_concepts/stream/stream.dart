Stream<int> boatStream() async* {
  for (var i = 0; i <= 10; i++) {
    print("Sent boat no." + i.toString());


    //wait 2 seconds before sending data
    await Future.delayed(
      Duration(seconds: 2),
    );
    //pushes the boat to the stream;
    yield i;
  }
}

void main() {
  Stream<int> stream = boatStream();
  stream.listen((number) {
    print("Received boat no." + number.toString());
  });
}
