import 'package:flutter/material.dart';

import 'difficulty_level.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacity = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Tarefas'),
          ),
          body: AnimatedOpacity(
            opacity: opacity ? 1 : 0,
            duration: const Duration(milliseconds: 800),
            child: ListView(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Task('Testando aaaaaaaaaaaaaaaaaaaaa', 5),
                  Task('Ola mundo', 4),
                  Task('coisa boa', 1),
                  Task('coisa boa', 1),
                  Task('coisa boa', 1),
                  Task('coisa boa', 2),
                  Task('coisa boa', 1),
                  Task('coisa boa', 1),
                ],
              ),
            ]),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                opacity = !opacity;
              });
            },
            child: const Icon(Icons.remove_red_eye),
          )),
    );
  }
}

class Task extends StatefulWidget {
  final String name;
  final int difficulty;

  const Task(this.name, this.difficulty, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue,
            ),
          ),
          Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black26,
                        ),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            child: Text(widget.name,
                                style: TextStyle(
                                    fontSize: 24,
                                    overflow: TextOverflow.ellipsis)),
                          ),
                          Difficulty(difficultyLevel: widget.difficulty)
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                level++;
                              });
                            },
                            child: Column(
                              children: [
                                const Icon(Icons.arrow_drop_up),
                                Text(
                                  'Up',
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )),
                      )
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: widget.difficulty > 0
                              ? (level / widget.difficulty) / 10
                              : 1,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nivel: $level',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}

