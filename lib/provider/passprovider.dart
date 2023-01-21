import 'package:flutter/material.dart';
import 'package:passwordmanager/database/db_controller.dart';
import 'package:passwordmanager/models/password_model.dart';

class PasswordProvider extends ChangeNotifier {
  PasswordProvider() {
    DbHelper.dbHelper.initilizaDb().then((x) {
      getAllPassword();
    });
  }

  GlobalKey<FormState> fromKey = GlobalKey();

  List<Password> pass = [];
  TextEditingController passNameController = TextEditingController();
  TextEditingController passEmailController = TextEditingController();
  TextEditingController passUrlImageController = TextEditingController();
  TextEditingController passNoteController = TextEditingController();
  TextEditingController passPasswordController = TextEditingController();

  // List<Password> get pass => _pass;

  getAllPassword() async {
    List<Password> password = await DbHelper.dbHelper.getAllPassword();
    pass = password;
    notifyListeners();
  }

  addNewPass() async {
    if (fromKey.currentState!.validate()) {
      Password password = Password(
        name: passNameController.text,
        email: passEmailController.text,
        urlImage: passUrlImageController.text,
        password: passPasswordController.text,
        note: passNoteController.text,
      );
      passNameController.clear();
      passEmailController.clear();
      passUrlImageController.clear();
      passPasswordController.clear();
      passNoteController.clear();
      await DbHelper.dbHelper.addNewPass(password);
      pass.add(password);
      notifyListeners();
    }
  }

  deletePassword() {
    Password password = Password();
    DbHelper.dbHelper.deletePassword(password.id!);
    notifyListeners();
  }
}
