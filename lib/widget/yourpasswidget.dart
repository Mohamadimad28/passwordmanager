import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:passwordmanager/models/yourpassmodel.dart';

class YourPassWidget extends StatelessWidget {
  YourPassWidget(this.yourPassWord);

  YourPassWord yourPassWord;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 804),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            width: 115.w,
            height: 160.h,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(20).r,
              boxShadow: [
// BoxShadow(color: Colors.black54),
                BoxShadow(
                  blurRadius: 2.r,
                  color: Colors.grey,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30.r,
// backgroundImage:  const AssetImage('assets/images/socials.png',),
                  backgroundColor: const Color(0xFFEBFDFC),
                  child: Image.asset(
                    yourPassWord.image,
                    height: 40.h,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  yourPassWord.name,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF180E25),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  yourPassWord.number,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: const Color(0xFF035F59),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
