import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:passwordmanager/provider/passprovider.dart';
import 'package:passwordmanager/routers/app_router.dart';
import 'package:passwordmanager/screens/home_screen.dart';
import 'package:passwordmanager/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'),Locale('ar')],
        path: 'assets/translations',
        // <-- change the path of the translation files
        fallbackLocale: const Locale('en'),
        child:  MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PasswordProvider>(
      create: (context) {
        return PasswordProvider();
      },
      child: ScreenUtilInit(
        designSize: const Size(375, 804),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            navigatorKey: AppRouter.navKey,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
