import 'package:eriell_app/domain/database/hive_data.dart';
import 'package:hive/hive.dart';

abstract class HiveBoxes {
  static final Box<HiveData> data = Hive.box<HiveData>('data');
}