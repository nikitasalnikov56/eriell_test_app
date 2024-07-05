import 'package:hive/hive.dart';

part 'hive_data.g.dart';

@HiveType(typeId: 0)
class HiveData {
  @HiveField(0)
  String? userName;

  @HiveField(1)
  String? userEmail;

  @HiveField(2)
  String? password;

  @HiveField(3)
  bool? isAuthenticated;

  HiveData(
      {this.userName, this.userEmail, this.password, this.isAuthenticated});
}
