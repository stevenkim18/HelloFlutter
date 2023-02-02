import 'package:flutter/material.dart';

import 'models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider 03',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dog = Dog(name: "my dog", breed: "my breed");

  @override
  void initState() {
    super.initState();
    dog.addListener(dogListener);
  }

  void dogListener() {
    print("dogListener age: ${dog.age}");
  }

  @override
  void dispose() {
    dog.removeListener(dogListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 03'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              // provider에서 값을 참조
              '- name: ${dog.name}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 10.0),
            BreedAndAge(dog: dog),
          ],
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  final Dog dog;
  const BreedAndAge({Key? key, required this.dog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- breed: ${dog.breed}',
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 10.0),
        Age(dog: dog),
      ],
    );
  }
}

class Age extends StatefulWidget {
  final Dog dog;
  const Age({Key? key, required this.dog}) : super(key: key);

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- age: ${widget.dog.age}',
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            setState(() {
              // 예제에는 없지만 일부러 만들어 봄.
              widget.dog.grow();
            });
          },
          child: const Text(
            'Grow',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ],
    );
  }
}
