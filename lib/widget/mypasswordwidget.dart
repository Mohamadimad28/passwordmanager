import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:passwordmanager/models/password_model.dart';
import 'package:passwordmanager/provider/passprovider.dart';
import 'package:passwordmanager/routers/app_router.dart';
import 'package:passwordmanager/screens/editpass_screen.dart';
import 'package:passwordmanager/screens/showpassworddetiles.dart';
import 'package:provider/provider.dart';

class MyPasswordWidget extends StatelessWidget {
  MyPasswordWidget(this.password);

  Password password;

  @override
  Widget build(BuildContext context) {
    return Consumer<PasswordProvider>(
      builder: (context, provider, widget) {
        return ScreenUtilInit(
            designSize: const Size(375, 804),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return ShowPassDetailsScreen(password);
                  }));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5).w,
                  width: 350.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20).r,
                    color: const Color(0xFFFFFFFF),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2.r,
                        color: Colors.grey,
                        // offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
                            .w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(password.urlImage!, height: 50.h),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                        const Spacer(),
                        const Icon(Icons.copy),
                        PopupMenuButton<String>(
                            onSelected: (value) {
                              if (value == 'Edit') {
                                AppRouter.goToScreen(EditeScreen(password));
                              } else if (value == 'Remove') {
                                provider.deletePassword();
                              }
                            },
                            offset: const Offset(-10, 30),
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  value: 'Edit',
                                  child: const Text('Edit'),
                                ),
                                PopupMenuItem(
                                  value: 'Remove',
                                  child: const Text('Remove'),
                                ),
                              ];
                            }),
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
