import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Dog>(
      create: (context) => Dog(name: 'dog10', breed: 'breed10', age: 3),
      child: MaterialApp(
        title: 'Provider 10',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 10'),
      ),
      // 여기!!!
      body: Selector<Dog, String>(
        // 여기!!!
        selector: (context, dog) => dog.name,
        builder: (BuildContext context, String name, Widget? child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                child!,
                const SizedBox(height: 10.0),
                Text(
                  '- name: $name', // 매개변수로 받은 name!
                  style: const TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 10.0),
                const BreedAndAge(),
              ],
            ),
          );
        },
        child: const Text(
          'I like dogs very much',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<Dog, String>(
      selector: (context, dog) => dog.breed,
      builder: (_, String breed, __) {
        return Column(
          children: [
            Text(
              '- breed: $breed',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 10.0),
            const Age(),
          ],
        );
      },
    );
  }
}

class Age extends StatelessWidget {
  const Age({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<Dog, int>(
      selector: (context, dog) => dog.age,
      builder: (_, age, __) {
        return Column(
          children: [
            Text(
              '- age: $age',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => context.read<Dog>().grow(), // dog가 없기 때문에 context에서 가져옴.
              child: const Text(
                'Grow',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        );
      },
    );
  }
}
