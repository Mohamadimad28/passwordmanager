import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:passwordmanager/models/password_model.dart';
import 'package:passwordmanager/provider/passprovider.dart';
import 'package:passwordmanager/screens/editpass_screen.dart';
import 'package:passwordmanager/screens/main_screen.dart';
import 'package:provider/provider.dart';

class ShowPassDetailsScreen extends StatelessWidget {
  ShowPassDetailsScreen(this.password, {Key? key}) : super(key: key);
  Password password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const MainScreen();
              }));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: const Color(0xFF180E25),
              size: 30.sp,
            )),
        title: Text(
          password.name!,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF180E25),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return EditeScreen(password);
                }));
              },
              icon: Icon(
                Icons.edit_note,
                color: const Color(0xFF2F8883),
                size: 35.sp,
              )),
        ],
      ),
      body: Consumer<PasswordProvider>(
        builder: (context, provider, widget) {
          return ScreenUtilInit(
              designSize: const Size(375, 804),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                            width: double.infinity.w,
                            height: 140.h,
                            color: const Color(0xFF2F8883)),
                        Positioned(
                          top: 20,
                          bottom: 20,
                          left: 10,
                          right: 10,
                          child: Container(
                            width: 340.w,
                            height: 85.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20).r,
                              color: const Color(0xFFFFFFFF),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10)
                                  .w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Image.network(password.urlImage!, height: 50.h),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        password.name!,
                                        style: TextStyle(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF180E25),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        password.email!,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: const Color(0xFF827D89),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: 350.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20).r,
                        color: const Color(0xFFFFFFFF),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0).w,
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Color(0xFF2F8883),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              password.name!,
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: const Color(0xFF180E25),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 350.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20).r,
                        color: const Color(0xFFFFFFFF),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0).w,
                        child: Row(
                          children: [
                            Icon(
                              Icons.lock,
                              color: Color(0xFF2F8883),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              password.password!,
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: const Color(0xFF180E25),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 350.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20).r,
                        color: const Color(0xFFFFFFFF),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0).w,
                        child: Row(
                          children: [
                            Icon(
                              Icons.note,
                              color: Color(0xFF2F8883),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              password.note!,
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: const Color(0xFF180E25),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              });
        },
      ),
    );
  }
}
