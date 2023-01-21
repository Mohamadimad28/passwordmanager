import 'package:shared_preferences/shared_preferences.dart';

class SpController {
  static final SpController spController = SpController._();
  late SharedPreferences sharedPreferences;

  SpController._();

  Future<void> initPref() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

}
