import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:passwordmanager/models/mypasswordmodel.dart';
import 'package:passwordmanager/routers/app_router.dart';
import 'package:passwordmanager/screens/home_screen.dart';
import 'package:passwordmanager/screens/addpasswordscreen.dart';
import 'package:passwordmanager/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final List<BnItem> bnitem = <BnItem>[
    const BnItem(title: 'Home', widget: HomeScreen()),
     BnItem(title: 'Profile', widget: ProfileScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 804),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Scaffold(
            backgroundColor: const Color(0xFFFAF8FC),
            body: bnitem[currentIndex].widget,
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color(0xFFFFFFFF),
              elevation: 10,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              onTap: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              currentIndex: currentIndex,
              selectedIconTheme: const IconThemeData(
                color: Color(0xFF2F8883),
              ),
              selectedItemColor: const Color(0xFF2F8883),
              unselectedItemColor: const Color(0xFF827D89),
              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
                letterSpacing: 2,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12.sp,
                letterSpacing: 0,
              ),
              items: const [
                // for (int i = 0; i < bnitem.length; i++)
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return AddPasswordScreen();
                }));
              },
              backgroundColor: const Color(0xFFEBFDFC),
              child: const Icon(
                Icons.add,
                color: Color(0xFF2F8883),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
        });
  }
}
