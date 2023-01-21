import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:passwordmanager/models/yourpassmodel.dart';
import 'package:passwordmanager/provider/passprovider.dart';
import 'package:passwordmanager/widget/mypasswordwidget.dart';
import 'package:passwordmanager/widget/pass_widget.dart';
import 'package:passwordmanager/widget/yourpasswidget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PasswordProvider>(builder: (context, provider, widget) {
      return ScreenUtilInit(
          designSize: const Size(375, 804),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 20)
                            .w,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 32.r,
                          backgroundImage:
                              const AssetImage('assets/images/person.png'),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Welcome back, Ali",
                          style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF035F59)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ).w,
                    child: Text(
                      "Manage",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: const Color(0xFF827D89),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ).w,
                    child: Text(
                      "Your passwords",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF180E25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 200.h,
                    child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: YourPassWord.yourPasswordList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisExtent: 140,
                        ),
                        itemBuilder: (context, index) {
                          return YourPassWidget(
                              YourPassWord.yourPasswordList[index]);
                        }),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: double.infinity.w,
                    height: 285.h,
                    color: const Color(0xFFFFFFFF),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10)
                          .w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Passwords",
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF180E25),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            height: 210.h,
                            child: ListView.builder(
                                itemCount: provider.pass.length,
                                itemBuilder: (context, index) {
                                  return MyPasswordWidget(provider.pass[index]);
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
    });
  }
}

/**  appBar: AppBar(
    actions: [
    Switch(
    value: context.locale == const Locale("ar"),
    onChanged: (x) {
    if (x) {
    setState(() {
    context.setLocale(const Locale("ar"));
    });
    } else {
    setState(() {
    context.setLocale(const Locale("en"));
    });
    }
    }),
    ],
    ),
    body: Column(
    children: [
    Padding(
    padding:
    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    const Text('name').tr(),
    const Spacer(),
    const Text('specialty').tr(),
    ],
    ),
    ),
    const SizedBox(
    height: 20,
    ),
    SizedBox(
    height: 100,
    child: ListView.builder(
    itemCount: provider.pass.length,
    itemBuilder: (context, index) {
    return PassWidget(provider.pass[index]);
    }),
    ),
    const SizedBox(
    height: 20,
    ),
    ElevatedButton(
    onPressed: () {
    Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context) {
    return  MapsScreen();
    }));
    }, child: const Text("Go To Screen"))
    ],
    ),
    floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: IconButton(
    onPressed: () {
    Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context) {
    return const AddNewPass();
    }));
    },
    icon: const Icon(Icons.add),
    ),
    ),*/
