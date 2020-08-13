import 'package:flutter/material.dart';

class PreviewGloryBlue extends StatefulWidget {
  @override
  _PreviewGloryBlueState createState() => _PreviewGloryBlueState();
}

class _PreviewGloryBlueState extends State<PreviewGloryBlue> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/blue_export.png',

        ),
        _player(),
      ],
    );
  }

  Widget _player() {
    return Container(
      color: Colors.black,
      child: Text('asdadasd'),
    );
  }
}
