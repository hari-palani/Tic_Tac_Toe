import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'controlcode.dart';

void main() {
  runApp(MyApp());
}

Control control = Control();

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  Control control = Control();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.tealAccent,
          title: const Center(
            child: Text(
              'Tic Tac Toe',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50),
            ),
          ),
        ),
        body: const MainApp(),
      ),
    );
  }
}

String playercharacter = "X";
int filled = 0;

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Widget board(int i, int j) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (control.matrix[i][j] == '') {
            control.matrix[i][j] = playercharacter;
            filled++;
            if (control.finished() == true) {
              showCupertinoDialog(
                context: context,
                builder: (_) => CupertinoAlertDialog(
                  title: const Text("Well played!!"),
                  content: Text("${control.swap(playercharacter)} won!"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context, 'press this to restart!');
                          filled = 0;
                          control.matrix = [
                            ['', '', ''],
                            ['', '', ''],
                            ['', '', '']
                          ];
                        });
                      },
                      child: const Text("Press this to restart!"),
                    )
                  ],
                ),
              );
            }
            if (filled == 9) {
              showCupertinoDialog(
                context: context,
                builder: (_) => CupertinoAlertDialog(
                  title: const Text("Well played"),
                  content: const Text("Match Drawn!!"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context, 'press this to restart!');
                          filled = 0;
                          control.matrix = [
                            ['', '', ''],
                            ['', '', ''],
                            ['', '', '']
                          ];
                        });
                      },
                      child: const Text("Press this to restart!"),
                    )
                  ],
                ),
              );
            }
          }
        });
        playercharacter = control.swap(playercharacter);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.width * 0.2,
        child: Center(
          child: Text(
            control.matrix[i][j],
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.width * 0.15),
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            "$playercharacter's turn",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.2),
          ),
        ),
        Padding(
          padding: MediaQuery.of(context).viewPadding * 0.75,
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    board(0, 0),
                    board(0, 1),
                    board(0, 2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    board(1, 0),
                    board(1, 1),
                    board(1, 2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    board(2, 0),
                    board(2, 1),
                    board(2, 2),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
