import 'package:flutter/material.dart';
class SeatManagment extends StatefulWidget {
  const SeatManagment({Key? key}) : super(key: key);

  @override
  State<SeatManagment> createState() => _SeatManagmentState();
}

class _SeatManagmentState extends State<SeatManagment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'Second widget',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              color: Colors.amber,
              width: 200,
            ),
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'Second widget',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              color: Colors.amber,
              width: 200,
            ),
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'Second widget',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              color: Colors.amber,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
