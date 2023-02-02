class Babies {
  final int age;

  Babies({required this.age});

  Future<int> getBabies() async {
    await Future.delayed(const Duration(seconds: 3));

    return 100;
  }
}
