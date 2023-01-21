import 'package:flutter/material.dart';
import 'package:passwordmanager/provider/passprovider.dart';
import 'package:passwordmanager/routers/app_router.dart';
import 'package:passwordmanager/screens/home_screen.dart';
import 'package:passwordmanager/screens/main_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return const MainScreen();
      }));
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/Logo.png',
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          const Text('The only password manager you’ll ever need.'),
        ],
      ),
    );
  }
}
