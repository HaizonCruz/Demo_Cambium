import 'package:flutter/material.dart';

class CustomButtonSet extends StatefulWidget {
  const CustomButtonSet(this.labels, {super.key});

  final List<String> labels;

  @override
  State<CustomButtonSet> createState() => _CustomButtonSetState();
}

class _CustomButtonSetState extends State<CustomButtonSet> {
  String? text;
  int selectedIndex = 0;

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                    onPressed: () => changeIndex(0),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          selectedIndex == 0 ? Colors.grey : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(
                                width: 20, color: Colors.black)),
                      ),
                    ),
                    child: Text(
                      widget.labels[0],
                      style: TextStyle(
                          color:
                              selectedIndex == 0 ? Colors.white : Colors.grey),
                    )),
                OutlinedButton(
                    onPressed: () => changeIndex(1),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          selectedIndex == 1 ? Colors.grey : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(
                                width: 20, color: Colors.black)),
                      ),
                    ),
                    child: Text(
                      widget.labels[1],
                      style: TextStyle(
                          color:
                              selectedIndex == 1 ? Colors.white : Colors.grey),
                    )),
                OutlinedButton(
                    onPressed: () => changeIndex(2),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          selectedIndex == 2 ? Colors.grey : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(
                                width: 20, color: Colors.black)),
                      ),
                    ),
                    child: Text(
                      widget.labels[2],
                      style: TextStyle(
                          color:
                              selectedIndex == 2 ? Colors.white : Colors.grey),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  child: OutlinedButton(
                      onPressed: () => changeIndex(3),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            selectedIndex == 3 ? Colors.grey : Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(
                                  width: 30, color: Colors.black)),
                        ),
                      ),
                      child: Text(
                        widget.labels[3],
                        style: TextStyle(
                            color: selectedIndex == 3
                                ? Colors.white
                                : Colors.grey),
                      )),
                ),
                Stack(
                  children: [
                    SizedBox(
                      width: 150,
                      child: OutlinedButton(
                          onPressed: () => changeIndex(4),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                selectedIndex == 4
                                    ? Colors.grey
                                    : Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(
                                      width: 30, color: Colors.black)),
                            ),
                          ),
                          child: Text(
                            widget.labels[4],
                            style: TextStyle(
                                color: selectedIndex == 4
                                    ? Colors.white
                                    : Colors.grey),
                          )),
                    ),
                    const Positioned(
                        top: 10,
                        left: 100,
                        child: Icon(Icons.edit)),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}
