import 'package:flutter/material.dart';
import 'package:marozi/app.dart';
import 'package:marozi/utils/firebase_or_local.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseOrLocal.splashDataLoading();
  runApp(MyApp());
}