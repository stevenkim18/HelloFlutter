import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff181818),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              // 옆으로니까 main이면 가로 정렬
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 200,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Hello",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Hello22",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Text(
              "Total Balance",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "\$5 194 482",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(45)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 50,
                    ),
                    child: Text(
                      "Transfer",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
