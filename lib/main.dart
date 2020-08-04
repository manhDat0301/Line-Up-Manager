import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/app.dart';
import 'package:marozi/resources/bloc_observer.dart';
import 'package:marozi/utils/firebase_or_local.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseOrLocal.splashDataLoading();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}
