import 'package:flutter/material.dart';

class LandscapeAddingDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.5, bottom: 2),
      child: Divider(
        indent: 0,
        endIndent: 10,
        thickness: 0.5,
        height: 1,
      ),
    );
  }
}
