import 'package:flutter/material.dart';
import 'package:marozi/landscape/setting_dialog_landscape.dart';
import 'package:marozi/portrait/setting_dialog_portrait.dart';

class SettingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Orientation.portrait == MediaQuery.of(context).orientation
        ? SettingDialogPortrait()
        : SettingDialogLandscape();
  }
}
