import 'package:clean_architecture_with_mvvm/app/app.dart';
import 'package:clean_architecture_with_mvvm/app/di.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}
