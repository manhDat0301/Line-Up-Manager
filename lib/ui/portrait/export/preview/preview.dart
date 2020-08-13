import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/export/export_bloc.dart';
import 'package:marozi/ui/portrait/export/preview/blue_and_white/b_w.dart';
import 'package:marozi/ui/portrait/export/preview/braven/braven.dart';
import 'package:marozi/ui/portrait/export/preview/glory_red/glory_red.dart';

class Preview extends StatefulWidget {
  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExportBloc, ExportState>(
      builder: (BuildContext context, ExportState state) {
        if (state is ExportFromPositionSuccess) {
          print(state.currentPage);
          switch (state.currentPage) {
            case 0:
              return PreviewGloryRed();
              break;
            case 1:
              return PreviewBraven();
              break;
            case 2:
              return PreviewBnW();
              break;
            default:
              return PreviewGloryRed();
          }
        }
        return Container();
      },
    );
  }
}
