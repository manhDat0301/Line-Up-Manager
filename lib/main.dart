import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/app.dart';
import 'package:marozi/resources/bloc_observer.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/utils/firebase_to_local.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(FutureBuilder(
    future: Firebase.initializeApp(),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        FirebaseToLocal.splashDataLoading();
        return MyApp();
      }
      return BottomLoader();
    },
  ));
}
