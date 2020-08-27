import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Container(
              width: 20,
              height: 20,
              child: Text('AAAAAAAAAAAAAAAA'),
            );
          },
        ),
      ),
    );
  }
}
