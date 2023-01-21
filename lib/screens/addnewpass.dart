import 'package:flutter/material.dart';
import 'package:passwordmanager/provider/passprovider.dart';
import 'package:passwordmanager/screens/home_screen.dart';
import 'package:provider/provider.dart';

class AddNewPass extends StatelessWidget {
  const AddNewPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PasswordProvider>(
      builder: (context, provider, widget) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
            body: Form(
              key: provider.fromKey,
              child: Center(
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return " is Not Empty";
                        }
                      },
                      controller: provider.passNameController,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          provider.addNewPass();
                        },
                        child: Text('Add'))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
