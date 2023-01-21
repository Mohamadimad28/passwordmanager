import 'package:flutter/material.dart';
import 'package:passwordmanager/models/password_model.dart';

class PassWidget extends StatelessWidget {
  PassWidget(this.password, {Key? key}) : super(key: key);
  Password password;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      width: 50,
      height: 50,
      color: Colors.red,
      child: Center(child: Text(password.name!)),
    );
  }
}
