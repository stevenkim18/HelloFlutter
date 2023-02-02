class Babies {
  final int age;

  Babies({required this.age});

  Future<int> getBabies() async {
    await Future.delayed(const Duration(seconds: 3));

    return 100;
  }

  Stream<String> bark() async* {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 2));
      yield "Bark $i";
    }
  }
}
