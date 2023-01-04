import 'package:demo_app/Models/user_list.dart';
import 'package:demo_app/button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> labels = ["15 min", "30 min", "45 min", "1 hour", "Other"];

  final List<UserList> userList = [
    UserList("John", "Hello", true),
    UserList("Sara", "Hello", false),
    UserList("Alex", "Hello", false),
    UserList("Sara", "Hello", false),
    UserList("Sara", "Hello", false),
    UserList("Sara", "Hello", false),
    UserList("Sara", "Hello", false),
    UserList("Sara", "Hello", false),
    UserList("Sara", "Hello", false),
  ];

  void bottomSheets() {
    showModalBottomSheet(
        enableDrag: true,
        context: context,
        builder: (context) {
          return BottomSheet(
              onClosing: () {},
              builder: (BuildContext context) {
                return StatefulBuilder(builder: (context, setNewState) {
                  return FractionallySizedBox(
                    heightFactor: 1.5,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        ),
                      ),
                      child: Stack(
                          alignment: AlignmentDirectional.topCenter,
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -13,
                              child: Container(
                                width: 70,
                                height: 4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white),
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                                      child: Text(
                                        'Family Time',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 10, 20),
                                      child: CloseButton(
                                        color: Colors.black38,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  height: 1.2,
                                  width: double.infinity,
                                  color: Color.fromARGB(
                                      (0.25 * 255).round(), 0, 0, 0),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 20, 0, 5),
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    "Profiles to Pause",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 5),
                                  height: 150,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: userList.length,
                                    itemBuilder: (context, index) {
                                      return SizedBox(
                                        width: 125,
                                        child: Card(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 20, 0, 20),
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    const CircleAvatar(
                                                      radius: 35,
                                                      backgroundColor:
                                                          Colors.grey,
                                                      backgroundImage: AssetImage(
                                                          "assets/images/hello.jpg"),
                                                    ),
                                                    Positioned(
                                                      left: 35,
                                                      bottom: 35,
                                                      child: Checkbox(
                                                        shape:
                                                            const CircleBorder(),
                                                        side: const BorderSide(
                                                            style: BorderStyle
                                                                .none),
                                                        value: userList[index]
                                                            .checkValue,
                                                        onChanged:
                                                            (bool? value) {
                                                          setState(
                                                            () {
                                                              userList[index]
                                                                      .checkValue =
                                                                  value;
                                                            },
                                                          );
                                                        },
                                                        checkColor:
                                                            Colors.green,
                                                        activeColor:
                                                            Colors.black54,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Text(
                                                      "${userList[index].name}"))
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                          Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 15, 0, 20),
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    "Pause Period",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                CustomButtonSet(labels),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 30),
                                  height: 50,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text('Start',
                                          style: TextStyle(fontSize: 16)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  );
                });
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: bottomSheets,
          child: const Text('Open Bottom Sheet'),
        ),
      ),
    );
  }
}
