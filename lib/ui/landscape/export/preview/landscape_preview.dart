import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/export/export_bloc.dart';
import 'package:marozi/ui/landscape/export/preview/glory_blue/glory_blue.dart';

class LandscapePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *0.8,
      height: MediaQuery.of(context).size.height * 0.7,
      alignment: Alignment.center,
      child: BlocBuilder<ExportBloc, ExportState>(
        builder: (BuildContext context, ExportState state) {
          if (state is ExportFromPositionSuccess) {
            switch (state.currentPage) {
              case 0:
                return PreviewGloryBlue();
                break;
              case 1:
                return Container();
                break;
              default:
                return PreviewGloryBlue();
            }
          }
          return Container();
        },
      ),
    );
  }
}
