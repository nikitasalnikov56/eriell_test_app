import 'package:eriell_app/domain/database/hive_data.dart';
import 'package:eriell_app/test_app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HiveDataAdapter());
  await Hive.openBox<HiveData>('data');
  runApp(const TestApp());
}
