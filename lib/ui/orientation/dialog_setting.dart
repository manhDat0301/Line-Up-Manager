import 'package:flutter/material.dart';
import 'package:marozi/ui/landscape/position/setting_dialog_landscape.dart';
import 'package:marozi/ui/landscape/position/setting_dialog_portrait.dart';

class DialogSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Orientation.portrait == MediaQuery.of(context).orientation
        ? DialogSettingPortrait()
        : DialogSettingLandscape();
  }
}
