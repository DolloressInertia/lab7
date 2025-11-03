import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lab7/register_page.dart';
import 'package:lab7/user_info_page.dart';
//import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ru'), // Russian locale
        Locale('kk'), // Kazakh locale
      ],
      path: 'assets/translations', // <-- Path to your JSON/ARB files
      fallbackLocale: const Locale('ru'), // <-- Fallback language
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: '/',
      routes: {
        '/': (context) => RegisterPage(),
        '/second': (context) => UserInfoPage(),
      },
    );
  }
}
