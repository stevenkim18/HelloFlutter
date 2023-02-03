import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_04/models/babie.dart';

import 'models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Dog>(
          create: (context) => Dog(name: "dog8", breed: "breed8"),
        ),
        FutureProvider<int>(
            create: (context) {
              final int dogAge = context.read<Dog>().age; // watch 쓰면 에러 남.
              final babies = Babies(age: dogAge);
              return babies.getBabies();
            },
            initialData: 0),
        StreamProvider<String>(
            create: ((context) {
              final int dogAge = context.read<Dog>().age;
              final babies = Babies(age: dogAge);
              return babies.bark();
            }),
            initialData: "start!!!!"),
      ],
      child: MaterialApp(
        title: 'Provider 08',
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
        title: const Text('Provider 08'),
      ),
      body: Consumer<Dog>(
        builder: (BuildContext context, Dog dog, Widget? child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                child!,
                const SizedBox(height: 20.0),
                Text(
                  // provider에서 값을 참조
                  '- name: ${dog.name}',
                  style: const TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 10.0),
                const BreedAndAge(),
              ],
            ),
          );
        },
        child: const Text("Provider 와 무관한 위젯!"),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Dog>(
      builder: (_, Dog dog, __) {
        return Column(
          children: [
            Text(
              '- breed: ${dog.breed}',
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
  const Age({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Dog>(builder: (_, Dog dog, __) {
      return Column(
        children: [
          Text(
            '- age: ${dog.age}',
            style: const TextStyle(fontSize: 20.0),
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              dog.grow();
            },
            child: const Text(
              'Grow',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      );
    });
  }
}
